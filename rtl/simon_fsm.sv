//------------------------------------------------------------------------------
// Module   : simon_fsm
// Owner    : Rutam
// Reviewer : <decide>
// Status   : WIP   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Moore FSM controlling the game: show sequence, wait for input, check, score, game over.
//
// Interface (see docs/interface_contract.md):
//   clk          in   1   system clock
//   nrst         in   1   reset (sync/async: <decide>)
//   (rest) <TBD by owner>
//
// Parameters:
//   none
//
// Behavior notes:
//   State diagram: docs/fsm_diagram.png
//
// Testbench : tb/tb_simon_fsm.sv
// Done when : correct sequence advances round; wrong press ends game; timeout handled; all states reachable
//------------------------------------------------------------------------------

module simon_fsm (
    input logic clk,
    input logic nrst
    // TODO(Rutam): add ports per docs/interface_contract.md
);
    import simon_pkg::*;

    // --- State register (Rutam) ---

    // --- Next-state logic (Rutam) ---

    // --- Output logic (Rutam) ---

    // TODO(Rutam): implement

endmodule
