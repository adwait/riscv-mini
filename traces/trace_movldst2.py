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
read('regs[ 0]', 0x00000000)
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
read('regs[ 0]', 0x00000000)
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
write('io.cpu.resp.valid', 0b0)
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
write('data[0x04]', 0x00000064000000640000006400000064, 0b00000000000000001111)
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
write('io.cpu.resp.bits.data', 0x00000064)
write('io.cpu.resp.valid', 0b1)
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
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       524, t=        13)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         14)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        14)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       524, t=        14)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         15)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        15)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       524, t=        15)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         16)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        16)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       524, t=        16)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       524, t=        16)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         17)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        17)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       528, t=        17)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       524, t=        17)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         18)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        18)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       532, t=        18)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       528, t=        18)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         19)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        19)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       536, t=        19)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       532, t=        19)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         20)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        20)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       540, t=        20)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         21)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        21)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       540, t=        21)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         22)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        22)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       540, t=        22)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         23)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        23)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       540, t=        23)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       536, t=        23)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         24)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        24)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       544, t=        24)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       540, t=        24)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         25)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        25)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       548, t=        25)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       544, t=        25)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         26)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        26)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       552, t=        26)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       548, t=        26)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         27)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        27)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       556, t=        27)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         28)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        28)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       556, t=        28)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         29)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        29)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       556, t=        29)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         30)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        30)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       556, t=        30)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       552, t=        30)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         31)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        31)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       560, t=        31)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       556, t=        31)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         32)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        32)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       564, t=        32)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       560, t=        32)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         33)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        33)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       568, t=        33)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       564, t=        33)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         34)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        34)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       572, t=        34)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         35)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        35)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       572, t=        35)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         36)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        36)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       572, t=        36)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         37)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        37)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       572, t=        37)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       568, t=        37)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         38)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        38)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       576, t=        38)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       572, t=        38)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         39)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        39)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       580, t=        39)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       576, t=        39)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         40)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        40)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       584, t=        40)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       580, t=        40)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         41)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        41)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       588, t=        41)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         42)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        42)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       588, t=        42)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         43)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        43)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       588, t=        43)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         44)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        44)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       588, t=        44)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       584, t=        44)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         45)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        45)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       592, t=        45)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       588, t=        45)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         46)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        46)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       596, t=        46)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       592, t=        46)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         47)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        47)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       600, t=        47)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       596, t=        47)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         48)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        48)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       604, t=        48)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         49)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        49)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       604, t=        49)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         50)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        50)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       604, t=        50)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         51)
# =======
# anno('module:icache', 'cache state', state=0)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        51)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       604, t=        51)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# =======
uop_begin('module:datapath', 'regs_write', ic=       600, t=        51)
# 'regFile.io.waddr := wb_rd_addr
# 'regFile.io.wdata := regWrite
write('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         52)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        52)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       608, t=        52)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         53)
# =======
# anno('module:icache', 'cache state', state=1)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        53)
write('state', 0)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       612, t=        53)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
clock_step('module:tile',         54)
# =======
# anno('module:icache', 'cache state', state=6)
# =======
# =======
uop_begin('module:memarbiter', 'ctrl_state', ic=0, t=        54)
write('state', 1)
uop_end()
# =======
# =======
# anno('module:dcache', 'cache state', state=0)
# =======
# =======
uop_begin('module:datapath', 'regs_read', ic=       612, t=        54)
# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
read('regs[ 0]', 0x00000000)
read('regs[ 0]', 0x00000000)
uop_end()
# =======
# Simulation terminated by timeout at time 120 (cycle 12)
finish('tests/rv32ui-p-movldst2.hex')
