//------------------------------------------------------------------------------
// Module   : top
// Owner    : Rutam
// Reviewer : <decide>
// Status   : WIP   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Top level: wires btn_input, timer, lfsr, seq_mem, score_keep, bin2bcd, ssdec and simon_fsm together.
//
// Interface (see docs/interface_contract.md):
//   clk          in   1   system clock
//   nrst         in   1   reset (sync/async: <decide>)
//   (board I/O) <TBD by owner>
//
// Parameters:
//   CLK_HZ from simon_pkg
//
// Behavior notes:
//   Pin mapping: constraints/pins.xdc (if board demo)
//
// Testbench : tb/tb_top.sv
// Done when : tb_top_golden plays N rounds then fails on purpose; waveforms saved in docs/waveforms/
//------------------------------------------------------------------------------

module top (
    input logic clk,
    input logic nrst
    // TODO(Rutam): add ports per docs/interface_contract.md
);
    import simon_pkg::*;

    // --- Instantiations (Rutam) ---

    // --- Wiring (Rutam) ---

    // TODO(Rutam): implement

endmodule
