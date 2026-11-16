//------------------------------------------------------------------------------
// Module   : ssdec
// Owner    : Noah
// Reviewer : Rutam
// Status   : WIP   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Decodes a BCD digit to seven-segment outputs.
//
// Interface (see docs/interface_contract.md):
//   (inputs/outputs) <TBD by owner>
//
// Parameters:
//   ACTIVE_LOW (<decide>)
//
// Behavior notes:
//   Segment order/polarity: <decide per board>
//
// Testbench : tb/tb_ssdec.sv
// Done when : all 10 digits (and blank) match the expected segment patterns
//------------------------------------------------------------------------------

module ssdec (
    input logic clk,
    input logic nrst
    // TODO(Noah): add ports per docs/interface_contract.md
);
    import simon_pkg::*;

    // --- Decode table (Noah) ---

    // TODO(Noah): implement

endmodule
