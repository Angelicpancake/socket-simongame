//------------------------------------------------------------------------------
// Module   : btn_input
// Owner    : Joshua
// Reviewer : Rutam
// Status   : WIP   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Converts raw asynchronous pushbuttons into clean single-cycle pulses.
//   2-flop synchronizer -> optional debounce -> rising-edge detect.
//
// Interface (see docs/interface_contract.md):
//   clk          in   1   system clock
//   nrst         in   1   active-low reset (sync/async: <decide>)
//   pb[16:0]     in  17   raw buttons; pb[4:0]=lights 0-4, pb[16]=start
//   press[4:0]   out  5   1-cycle registered pulse per light button
//   start_press  out  1   1-cycle registered pulse
//
// Parameters:
//   DEBOUNCE_MS = 0 in sim; nonzero on real hardware
//
// Behavior notes:
//   Multiple simultaneous presses: <lowest index wins | ignore all>
//
// Testbench : tb/tb_btn_input.sv
// Done when : 1000-cycle hold gives exactly one pulse; sub-cycle glitch ignored;
//             two simultaneous presses follow the documented policy
//------------------------------------------------------------------------------

module btn_input (
    input logic clk,
    input logic nrst
    // TODO(Joshua): add ports per docs/interface_contract.md
);
    import simon_pkg::*;

    // --- Sync stage (Joshua) ---

    // --- Edge detect (Joshua) ---

    // TODO(Joshua): implement

endmodule
