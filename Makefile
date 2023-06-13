root_dir := $(PWD)
inc_dir := ./include
sim_dir := ./sim
bld_dir := ./build

src_90_dir := ./src_90
src_40_dir := ./src_40

mem_40_dir := ./mem/sram_40
mem_90_dir := ./mem/sram_90

syn_90_dir := ./syn/syn_90
syn_40_dir := ./syn/syn_40

include mkflags

CYCLE=`grep -v '^$$' $(root_dir)/sim/CYCLE`
MAX=`grep -v '^$$' $(root_dir)/sim/MAX`

$(bld_dir):
	mkdir -p $(bld_dir)

$(syn_90_dir):
	mkdir -p $(syn_90_dir); 

$(syn_40_dir):
	mkdir -p $(syn_40_dir); 

# RTL simulation
rtl_all: clean 

top_tb_90: | $(bld_dir) 
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/test_FFTP.sv \
	+incdir+$(root_dir)/$(src_90_dir)+$(root_dir)/$(src_90_dir)/DTFAG+$(root_dir)/$(inc_dir)+$(root_dir)/$(mem_90_dir) \
	+define+SRAM_90 \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r -mccodegen -mcmaxcores 4 -mcdump -loadpli1 debpli:novas_pli_boot \
	+output_path=$(root_dir)/test_result_v	

top_tb_40: | $(bld_dir) 
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/test_FFTP.sv \
	+incdir+$(root_dir)/$(src_40_dir)+$(root_dir)/$(src_40_dir)/DTFAG+$(root_dir)/$(inc_dir)+$(root_dir)/$(mem_40_dir) \
	+define+SRAM_40 \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r -mccodegen -mcmaxcores 4 -mcdump -loadpli1 debpli:novas_pli_boot \
	+output_path=$(root_dir)/test_result_v	

# Post-Synthesis simulation
syn_all: clean

SYN_90: | $(bld_dir)
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/test_FFTP.sv \
	-sdf_file $(root_dir)/$(syn_90_dir)/FFTP_syn.sdf \
	+incdir+$(root_dir)/$(syn_90_dir)+$(root_dir)/$(inc_dir)+$(root_dir)/$(sim_dir)+$(root_dir)/$(mem_90_dir) \
	+define+SYN+SYN_90 \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r -mccodegen -mcmaxcores 4 -loadpli1 debpli:novas_pli_boot \
	+output_path=$(root_dir)/test_result_syn

SYN_40: | $(bld_dir)
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/test_FFTP.sv \
	-sdf_file $(root_dir)/$(syn_40_dir)/FFTP_syn.sdf \
	+incdir+$(root_dir)/$(syn_40_dir)+$(root_dir)/$(inc_dir)+$(root_dir)/$(sim_dir)+$(root_dir)/$(mem_40_dir) \
	+define+SYN+SYN_40 \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r +notimingcheck -mccodegen -mcmaxcores 4 -loadpli1 debpli:novas_pli_boot \
	+output_path=$(root_dir)/test_result_syn

# Utilities
nWave: | $(bld_dir)
	cd $(bld_dir); \
	nWave &
	
superlint: | $(bld_dir)
	cd $(bld_dir); \
	jg -superlint ../script/superlint.tcl &

dv: | $(bld_dir) $(syn_90_dir)
	cp script/synopsys_dc.setup $(bld_dir)/.synopsys_dc.setup; \
	cd $(bld_dir); \
	dc_shell -gui -no_home_init

synthesize_90: | $(bld_dir) $(syn_90_dir)
#	cp script/synopsys_dc.setup $(bld_dir)/.synopsys_dc.setup; 
	cd $(bld_dir); \
	dc_shell -no_home_init -f ../script/synthesis_90.tcl

synthesize_40: | $(bld_dir) $(syn_40_dir)
#	cp script/synopsys_dc.setup $(bld_dir)/.synopsys_dc.setup; 
	cd $(bld_dir); \
	dc_shell -no_home_init -f ../script/synthesis_40.tcl

# SRAM generate
# 90nm
SRAM_90:
	cd $(mem_90_dir);\
	$(sram_90_path) verilog -mux $(MUX) \
	-bits $(double_bit_size) -instname $(instname)  -frequency $(Freq) -words $(sram_word_size);

SRAM_90_syn:
	cd $(mem_90_dir);\
	$(sram_90_path) synopsys -mux $(MUX) \
	-bits $(double_bit_size) -instname $(instname) -libname $(instname) -frequency $(Freq) -words $(sram_word_size);\
	rm -rf *_ff_*.lib; \
	rm -rf *_ss_*.lib;

LIB_TO_DB_90: SRAM_90_syn
	cd $(mem_90_dir);\
	lc_shell -f lc_script.tcl;\
	rm -rf *.txt;\
	rm -rf *.log;
# 40nm
SRAM_40:
	cd $(mem_40_dir);\
	$(sram_40_path) verilog -mux $(MUX_40) \
	-bits $(double_bit_size_40) -instname $(instname_40) -frequency $(Freq_40) -words $(sram_word_size_40);

SRAM_40_syn:
	cd $(mem_40_dir);\
	$(sram_40_path) synopsys -mux $(MUX_40) \
	-bits $(double_bit_size_40) -instname $(instname_40) -libname $(instname_40) -frequency $(Freq_40) -words $(sram_word_size_40);\
	rm -rf *_ff_*.lib; \
	rm -rf *_ss_*.lib; \
	rm -rf *_ffg_*.lib;

LIB_TO_DB_40: SRAM_40_syn
	cd $(mem_40_dir);\
	lc_shell -f lc_script_40.tcl;\
	rm -rf *.txt;\
	rm -rf *.log;

.PHONY: clean

clean:
	rm -rf $(bld_dir); \
	rm -rf $(sim_dir)/prog*/result*.txt; \

	rm -rf $(root_dir)/INCA_libs; \
	rm -rf $(root_dir)/$(src_90_dir)/INCA_libs; \
	rm -rf $(root_dir)/$(src_90_dir)/*.history; \
	rm -rf $(root_dir)/$(src_90_dir)/*.log; \
	rm -rf $(root_dir)/$(src_90_dir)/simv.daidir; \

	rm -rf $(root_dir)/$(src_40_dir)/INCA_libs; \
	rm -rf $(root_dir)/$(src_40_dir)/*.history; \
	rm -rf $(root_dir)/$(src_40_dir)/*.log; \
	rm -rf $(root_dir)/$(src_40_dir)/simv.daidir; \
	
	rm -rf $(root_dir)/$(sim_dir)/testbench/INCA_libs;\
	rm -rf $(root_dir)/$(sim_dir)/testbench/*.history;\
	rm -rf $(root_dir)/$(sim_dir)/testbench/*.log;\

	rm -rf $(root_dir)/$(mem_90_dir)/*.log; \
	rm -rf $(root_dir)/$(mem_90_dir)/*.history; \
	rm -rf $(root_dir)/$(mem_90_dir)/INCA_libs; \

	rm -rf $(root_dir)/$(mem_40_dir)/*.log; \
	rm -rf $(root_dir)/$(mem_40_dir)/*.history; \
	rm -rf $(root_dir)/$(mem_40_dir)/INCA_libs; \

	rm -rf $(root_dir)/*.log; \
	rm -rf $(root_dir)/*.history;\
