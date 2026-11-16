//------------------------------------------------------------------------------
// Module   : timer
// Owner    : Joshua
// Reviewer : Rutam
// Status   : WIP   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Timing/delay counter used by the FSM (e.g. light-on time, gap time, input timeout).
//
// Interface (see docs/interface_contract.md):
//   clk          in   1   system clock
//   nrst         in   1   reset (sync/async: <decide>)
//   (rest) <TBD by owner>
//
// Parameters:
//   CLK_HZ from simon_pkg
//
// Behavior notes:
//   Tick/expire signal semantics: <decide: pulse vs level>
//
// Testbench : tb/tb_timer.sv
// Done when : expires after exactly N cycles; restart mid-count works; no off-by-one
//------------------------------------------------------------------------------

module timer (
    input logic clk,
    input logic nrst
    // TODO(Joshua): add ports per docs/interface_contract.md
);
    import simon_pkg::*;

    // --- Counter (Joshua) ---

    // --- Expire flag (Joshua) ---

    // TODO(Joshua): implement

endmodule
