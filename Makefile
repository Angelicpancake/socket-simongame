# Requires iverilog + gtkwave. Usage: make sim MOD=timer | make sim_all | make waves MOD=timer
MODS := timer btn_input lfsr seq_mem score_keep bin2bcd ssdec score_display simon_fsm
PKG  := rtl/simon_pkg.sv
BUILD := build

sim:
	@test -n "$(MOD)" || (echo "usage: make sim MOD=<name>"; exit 1)
	@mkdir -p $(BUILD)
	iverilog -g2012 -I tb -y rtl -Y .sv -o $(BUILD)/$(MOD).vvp $(PKG) rtl/$(MOD).sv tb/tb_$(MOD).sv
	cd $(BUILD) && vvp $(MOD).vvp

sim_all:
	@for m in $(MODS); do $(MAKE) sim MOD=$$m || exit 1; done

waves:
	gtkwave $(BUILD)/$(MOD).vcd

clean:
	rm -rf $(BUILD)

.PHONY: sim sim_all waves clean
