root_dir := $(PWD)
src_dir := ./src
syn_dir := ./syn
inc_dir := ./include
sim_dir := ./sim
bld_dir := ./build
mem_dir := ./mem

include mkflags

CYCLE=`grep -v '^$$' $(root_dir)/sim/CYCLE`
MAX=`grep -v '^$$' $(root_dir)/sim/MAX`

$(bld_dir):
	mkdir -p $(bld_dir)

$(syn_dir):
	mkdir -p $(syn_dir)

# RTL simulation
rtl_all: clean 

top_tb: | $(bld_dir)  SRAM
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/test_FFTP.sv \
	+incdir+$(root_dir)/$(src_dir)+$(root_dir)/$(src_dir)/DTFAG+$(root_dir)/$(inc_dir)+$(root_dir)/$(mem_dir) \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r -mccodegen -mcmaxcores 4 -loadpli1 debpli:novas_pli_boot \
	+output_path=$(root_dir)/test_result_v	

# Post-Synthesis simulation
syn_all: clean syn0 syn1 syn2 syn3

SYN: | $(bld_dir)
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/test_FFTP.sv \
	-sdf_file $(root_dir)/$(syn_dir)/FFTP_syn.sdf \
	+incdir+$(root_dir)/$(syn_dir)+$(root_dir)/$(inc_dir)+$(root_dir)/$(sim_dir)+$(root_dir)/$(mem_dir) \
	+define+SYN \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r -mccodegen -mcmaxcores 4 -loadpli1 debpli:novas_pli_boot \
	+output_path=$(root_dir)/test_result_syn


# Utilities
nWave: | $(bld_dir)
	cd $(bld_dir); \
	nWave &
	
superlint: | $(bld_dir)
	cd $(bld_dir); \
	jg -superlint ../script/superlint.tcl &

dv: | $(bld_dir) $(syn_dir)
	cp script/synopsys_dc.setup $(bld_dir)/.synopsys_dc.setup; \
	cd $(bld_dir); \
	dc_shell -gui -no_home_init

synthesize: | $(bld_dir) $(syn_dir)
#	cp script/synopsys_dc.setup $(bld_dir)/.synopsys_dc.setup; 
	cd $(bld_dir); \
	dc_shell -no_home_init -f ../script/synthesis.tcl

# SRAM generate
SRAM:
	cd $(mem_dir);\
	$(sram_path) verilog -mux $(MUX) \
	-bits $(double_bit_size) -instname $(instname)  -frequency $(Freq) -words $(sram_word_size);

SRAM_syn:
	cd $(mem_dir);\
	$(sram_path) synopsys -mux $(MUX) \
	-bits $(double_bit_size) -instname $(instname) -libname $(instname) -frequency $(Freq) -words $(sram_word_size);\
	rm -rf *_ff_*.lib; \
	rm -rf *_ss_*.lib;

LIB_TO_DB: SRAM_syn
	cd $(mem_dir);\
	lc_shell -f lc_script.tcl;\
	rm -rf *.txt;\
	rm -rf *.log;

.PHONY: clean

clean:
	rm -rf $(bld_dir); \
	rm -rf $(sim_dir)/prog*/result*.txt; \

	rm -rf $(root_dir)/INCA_libs; \
	rm -rf $(root_dir)/$(src_dir)/INCA_libs; \
	rm -rf $(root_dir)/$(src_dir)/*.history; \
	rm -rf $(root_dir)/$(src_dir)/*.log; \
	rm -rf $(root_dir)/$(src_dir)/simv.daidir; \
	
	rm -rf $(root_dir)/$(sim_dir)/testbench/INCA_libs;\
	rm -rf $(root_dir)/$(sim_dir)/testbench/*.history;\
	rm -rf $(root_dir)/$(sim_dir)/testbench/*.log;\

	rm -rf $(root_dir)/$(mem_dir)/*.log; \
	rm -rf $(root_dir)/$(mem_dir)/*.history; \
	rm -rf $(root_dir)/$(mem_dir)/INCA_libs; \

	rm -rf $(root_dir)/*.log; \
	rm -rf $(root_dir)/*.history;\
