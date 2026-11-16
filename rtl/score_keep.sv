//------------------------------------------------------------------------------
// Module   : score_keep
// Owner    : Noah or Rutam <decide>
// Reviewer : Rutam
// Status   : WIP   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Tracks the current score / round count.
//
// Interface (see docs/interface_contract.md):
//   clk          in   1   system clock
//   nrst         in   1   reset (sync/async: <decide>)
//   (rest) <TBD by owner>
//
// Parameters:
//   MAX_SCORE (<decide>)
//
// Behavior notes:
//   Saturate vs wrap at max: <decide>
//
// Testbench : tb/tb_score_keep.sv
// Done when : increments once per successful round; clears on new game; max behavior as documented
//------------------------------------------------------------------------------

module score_keep (
    input logic clk,
    input logic nrst
    // TODO(Noah): add ports per docs/interface_contract.md
);
    import simon_pkg::*;

    // --- Counter (Noah) ---

    // --- Saturation (Noah) ---

    // TODO(Noah): implement

endmodule
