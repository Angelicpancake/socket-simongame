//------------------------------------------------------------------------------
// Module   : seq_mem
// Owner    : Aaryan
// Reviewer : Rutam
// Status   : WIP   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Stores the generated light sequence and reads it back by index.
//
// Interface (see docs/interface_contract.md):
//   clk          in   1   system clock
//   nrst         in   1   reset (sync/async: <decide>)
//   (rest) <TBD by owner>
//
// Parameters:
//   DEPTH (<decide>), light width from simon_pkg
//
// Behavior notes:
//   Read latency: <decide>
//
// Testbench : tb/tb_seq_mem.sv
// Done when : write N entries, read back identical; read latency matches contract
//------------------------------------------------------------------------------

module seq_mem (
    input logic clk,
    input logic nrst
    // TODO(Aaryan): add ports per docs/interface_contract.md
);
    import simon_pkg::*;

    // --- Write port (Aaryan) ---

    // --- Read port (Aaryan) ---

    // TODO(Aaryan): implement

endmodule
