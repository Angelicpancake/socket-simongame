//------------------------------------------------------------------------------
// Module   : bin2bcd
// Owner    : Noah
// Reviewer : Rutam
// Status   : WIP   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Converts a binary score (0-99) to two BCD digits for the display.
//
// Interface (see docs/interface_contract.md):
//   (inputs/outputs) <TBD by owner>
//
// Parameters:
//   none
//
// Behavior notes:
//   Combinational vs registered: <decide>
//
// Testbench : tb/tb_bin2bcd.sv
// Done when : exhaustive 0-99 matches reference
//------------------------------------------------------------------------------

module bin2bcd (
    input logic clk,
    input logic nrst
    // TODO(Noah): add ports per docs/interface_contract.md
);
    import simon_pkg::*;

    // --- Conversion (Noah) ---

    // TODO(Noah): implement

endmodule
