#include <verilated.h>
#include <iostream>

#if VM_TRACE
# include <verilated_vcd_c.h>	// Trace file format header
#endif

#define NUM_INSTS 8

using namespace std;

vluint64_t main_time = 0;       // Current simulation time
        // This is a 64-bit integer to reduce wrap over issues and
        // allow modulus.  You can also use a double, if you wish.

double sc_time_stamp () { // Called by $time in Verilog
  return main_time;       // converts to double, to match
                          // what SystemC does
}


struct imem
{
  int data[NUM_INSTS];

  bool      icache_resp_valid = true;
  uint64_t  icache_resp_bits_data = 0x00000000;
  
  bool      prev_reset;
  bool      prev_icache_req_valid;
  uint64_t  prev_icache_req_bits_addr;

  void tick(
    bool      reset,
    bool      icache_req_valid, 
    uint64_t  icache_req_bits_addr
  ) {
    int index = (icache_req_bits_addr/4) % NUM_INSTS;
    if (reset) {
      // will be invoked for first two cycles
      icache_resp_valid = true;
      icache_resp_bits_data = 0x00000000;
    } else if (prev_reset) {
      // will be invoked for third cycles (when reset goes low)
      icache_resp_valid = false;
      icache_resp_bits_data = 0x00000000;
    } else if (icache_req_valid) {
      // remainder of the simulation
      icache_resp_valid = true;
      if (icache_req_bits_addr < 508) {
        icache_resp_bits_data = 0x00000000;
      } else if (icache_req_bits_addr == 508) {
        icache_resp_bits_data = 0x00000013;        
      } else {
        icache_resp_bits_data = data[index];
      }
    }
    // cout << icache_resp_valid << " " << icache_resp_bits_data << " " << prev_reset;

    // save the previous reset to detect a negative reset edge
    prev_reset = reset;
    prev_icache_req_valid = icache_req_valid;
    prev_icache_req_bits_addr = icache_req_bits_addr;
  }

  void load_imem(vector<int> instructions) {
    for (auto i = 0; i < min((int) instructions.size(), NUM_INSTS); i++) {
      data[i] = instructions[i];
    }
  }

  bool get_icache_resp_valid() { return icache_resp_valid; }
  uint64_t get_icache_resp_bits_data() { return icache_resp_bits_data; }
} * imem_sim;

VCoreTop* top; // target design
#ifdef VM_TRACE
VerilatedVcdC* tfp;
#endif
// mm_magic_t* mem; // target memory

// TODO Provide command-line options like vcd filename, timeout count, etc.
const long timeout = 100; // 100000000L;

void tick() {
  cout << "clock_step(" << main_time/2 << ")" << endl;
  
  imem_sim->tick(
    // instead of top reset (which lags by a cycle), 
    // get the reset from the simulator (combinational, same cycle)
    top->reset,
    top->io_io_icache_req_valid,
    top->io_io_icache_req_bits_addr
  );
  top->io_io_icache_resp_valid = imem_sim->get_icache_resp_valid();
  top->io_io_icache_resp_bits_data = imem_sim->get_icache_resp_bits_data();
  imem_sim->tick(
    // instead of top reset (which lags by a cycle), 
    // get the reset from the simulator (combinational, same cycle)
    top->reset,
    top->io_io_icache_req_valid,
    top->io_io_icache_req_bits_addr
  );

  top->clock = 1;
  top->eval();
#if VM_TRACE
  if (tfp) tfp->dump((double) main_time);
#endif // VM_TRACE
  main_time++;
  
  top->clock = 0;
  top->eval();
#if VM_TRACE
  if (tfp) tfp->dump((double) main_time);
#endif // VM_TRACE
  main_time++;
}

int main(int argc, char** argv) {
  Verilated::commandArgs(argc, argv);   // Remember args
  top = new VCoreTop; // target design
  // mem = new mm_magic_t(1L << 32, 8); // target memory
  imem_sim = new imem;
  // load_mem(mem->get_data(), (const char*)(argv[1])); // load hex
  imem_sim->load_imem({
    0x06400593, 0x0c858613, 0x0c860613, 0x00000013, 
    0x00000013, 0x00000013, 0x00000013, 0x00000013
  });

#if SIMDEBUG
  for (auto i = 0; i < NUM_INSTS; i++) {
    cout << imem_sim->data[i];
  }
#endif

#if VM_TRACE			// If verilator was invoked with --trace
  Verilated::traceEverOn(true);	// Verilator must compute traced signals
  VL_PRINTF("Enabling waves...\n");
  tfp = new VerilatedVcdC;
  top->trace(tfp, 99);	// Trace 99 levels of hierarchy
  tfp->open(argc > 2 ? argv[2] : "dump.vcd"); // Open the dump file
#endif

  cout << "Starting simulation!\n";

  // reset
  top->reset = 1;
  for (size_t i = 0; i < 2 ; i++) {
    tick();
  }

  // start
  top->reset = 0;
  top->io_host_fromhost_bits = 0;
  top->io_host_fromhost_valid = 0;
  do {
    tick();
  } while(!top->io_host_tohost && main_time < timeout);

  int retcode = top->io_host_tohost >> 1;

  // Run for 10 more clocks
  for (size_t i = 0 ; i < 10 ; i++) {
    tick();
  }

  if (main_time >= timeout) {
    cerr << "# Simulation terminated by timeout at time " << main_time
         << " (cycle " << main_time / 10 << ")"<< endl;
    // cerr << "finish(\'" << argv[1] << "\')" << endl;
    return EXIT_FAILURE;
  } else {
    cerr << "Simulation completed at time " << main_time <<
           " (cycle " << main_time / 10 << ")"<< endl;
    if (retcode) {
      cerr << "TOHOST = " << retcode << endl;
    }
  }

#if VM_TRACE
  if (tfp) tfp->close();
  delete tfp;
#endif
  delete top;
  delete imem_sim;

  cout << "Finishing simulation!\n";

  return retcode == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
}

