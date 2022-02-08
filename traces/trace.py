from traceanalyze import *

clock_step('module:tile',          0)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=         0)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       508, t=         0)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',          1)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=         1)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       508, t=         1)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',          2)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=         2)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       508, t=         2)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',          3)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=         3)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       508, t=         3)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',          4)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=         4)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       508, t=         4)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       508, t=         4)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',          5)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=         5)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       512, t=         5)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 4]', 0x00000000)
read('regs[ 4]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       508, t=         5)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',          6)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=         6)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       516, t=         6)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[11]', 0x00000000)
read('regs[11]', 0x00000064)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       512, t=         6)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[11]', 0x00000064)
uop_end()
# =======
clock_step('module:tile',          7)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=         7)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=2)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       520, t=         7)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',          8)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=         8)
write('state', 2)
uop_end()
# =======
# =======
uop_begin('module:memarbiter', 'cache_read_resp', ic=       520, t=         8)
write('io.dcache.r.valid', 1)
write('io.dcache.r.bits', 0x0000000000000000)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=6)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       520, t=         8)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',          9)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=         9)
write('state', 2)
uop_end()
# =======
# =======
uop_begin('module:memarbiter', 'cache_read_resp', ic=       520, t=         9)
write('io.dcache.r.valid', 1)
write('io.dcache.r.bits', 0x0000000000000000)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache hit', ic=       516, t=         9)
uop_begin('module:dcache', 'cache_write', ic=       516, t=         9)
write('wen', 1)
write('metadata[0x04]', 0x00000)
write('data[0x04]', 0x00000000000000000000000000000000, 0b11111111111111111111)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=6)
# =======
# =======
# anno('module:dcache', 'refill', ic=       520, t=         9)
# =======
# =======
# anno('module:dcache', 'cache hit', ic=       520, t=         9)
uop_begin('module:dcache', 'cache_read_hit', ic=       520, t=         9)
write('io.cpu.resp.bits.data', 0x00000000)
write('io.cpu.resp.valid', 0x0)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       520, t=         9)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         10)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        10)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache hit', ic=       516, t=        10)
uop_begin('module:dcache', 'cache_write', ic=       516, t=        10)
write('wen', 1)
write('data[0x04]', 0x00000064000000640000006400000064, 0b00000000000000000001)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=2)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       520, t=        10)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         11)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        11)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       520, t=        11)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         12)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        12)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=1)
# =======
# =======
# anno('module:dcache', 'cache hit', ic=       524, t=        12)
uop_begin('module:dcache', 'cache_read_hit', ic=       524, t=        12)
write('io.cpu.resp.bits.data', 0x00000000000000000000000001100100)
write('io.cpu.resp.valid', 0x1)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       524, t=        12)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       520, t=        12)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[14]', 0x00000064)
uop_end()
# =======
clock_step('module:tile',         13)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        13)
write('state', 0)
uop_end()
# =======
# Simulation terminated by timeout at time 120 (cycle 12)
finish()