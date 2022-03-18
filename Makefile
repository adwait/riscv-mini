default: compile

base_dir   = $(abspath .)
src_dir    = $(base_dir)/src/main
gen_dir    = $(base_dir)/generated-src
gen_dir_coretop    = $(base_dir)/generated-src-coretop
out_dir    = $(base_dir)/outputs

SBT       = sbt
SBT_FLAGS = -ivy $(base_dir)/.ivy2

sbt:
	$(SBT) $(SBT_FLAGS)

compile: $(gen_dir)/Tile.v

$(gen_dir)/Tile.v: $(wildcard $(src_dir)/scala/mini/*.scala)
	$(SBT) $(SBT_FLAGS) "run $(gen_dir)"

$(gen_dir_coretop)/CoreTop.v: $(wildcard $(src_dir)/scala/mini/*.scala)
	$(SBT) $(SBT_FLAGS) "run $(gen_dir_coretop)"

CXXFLAGS += -std=c++11 -Wall -Wno-unused-variable

# compile verilator
VERILATOR = verilator --cc --exe
VERILATOR_FLAGS = --assert -Wno-STMTDLY -O3 --trace \
	--top-module Tile -Mdir $(gen_dir)/VTile.csrc \
	-CFLAGS "$(CXXFLAGS) -include $(gen_dir)/VTile.csrc/VTile.h" 

VERILATOR_FLAGS_C = --assert -Wno-STMTDLY -O3 --trace \
	--top-module CoreTop -Mdir $(gen_dir_coretop)/CoreTop.csrc \
	-CFLAGS "$(CXXFLAGS) -include $(gen_dir_coretop)/CoreTop.csrc/VCoreTop.h" 

$(base_dir)/VTile: $(gen_dir)/Tile.v $(src_dir)/cc/top.cc $(src_dir)/cc/mm.cc $(src_dir)/cc/mm.h
	$(VERILATOR) $(VERILATOR_FLAGS) -o $@ $< $(word 2, $^) $(word 3, $^)
	$(MAKE) -C $(gen_dir)/VTile.csrc -f VTile.mk

$(base_dir)/VCoreTop: $(gen_dir_coretop)/CoreTop.v $(src_dir)/cc/coretop.cc
	$(VERILATOR) $(VERILATOR_FLAGS_C) -o $@ $< $(word 2, $^) $(word 3, $^)
	$(MAKE) -C $(gen_dir_coretop)/CoreTop.csrc -f VCoreTop.mk

verilator: $(base_dir)/VTile

verilatorC: $(base_dir)/VCoreTop

# isa tests + benchmarks with verilator
test_hex_files = $(wildcard $(base_dir)/tests/*.hex)
test_out_files = $(foreach f,$(test_hex_files),$(patsubst %.hex,%.out,$(out_dir)/$(notdir $f)))

$(test_out_files): $(out_dir)/%.out: $(base_dir)/VTile $(base_dir)/tests/%.hex
	mkdir -p $(out_dir)
	$^ $(patsubst %.out,%.vcd,$@) 2> $@

run-tests: $(test_out_files)

# run custom benchamrk
custom_bmark_hex ?= $(base_dir)/custom-bmark/main.hex
custom_bmark_out  = $(patsubst %.hex,%.out,$(out_dir)/$(notdir $(custom_bmark_hex)))
$(custom_bmark_hex):
	$(MAKE) -C custom-bmark

$(custom_bmark_out): $(base_dir)/VTile $(custom_bmark_hex)
	mkdir -p $(out_dir)
	$^ $(patsubst %.out,%.vcd,$@) 2> $@

run-custom-bmark: $(custom_bmark_out)

# unit tests + integration tests
test:
	$(SBT) $(SBT_FLAGS) test

clean:
	rm -rf $(gen_dir) $(out_dir) test_run_dir

cleanall: clean
	rm -rf target project/target

.PHONY: sbt compile verilator run-tests run-custom-bmark test clean cleanall
