//------------------------------------------------------------------------------
// Module   : lfsr
// Owner    : Aaryan
// Reviewer : Rutam
// Status   : WIP   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Pseudo-random number generator used to pick the next light.
//
// Interface (see docs/interface_contract.md):
//   clk          in   1   system clock
//   nrst         in   1   reset (sync/async: <decide>)
//   (rest) <TBD by owner>
//
// Parameters:
//   SEED, WIDTH (<decide>)
//
// Behavior notes:
//   Mapping from LFSR value to light index 0..NUM_LIGHTS-1: <decide>
//
// Testbench : tb/tb_lfsr.sv
// Done when : never locks up at all-zero/all-ones; output sequence matches reference model
//------------------------------------------------------------------------------

module lfsr (
    input logic clk,
    input logic nrst
    // TODO(Aaryan): add ports per docs/interface_contract.md
);
    import simon_pkg::*;

    // --- Shift register (Aaryan) ---

    // --- Light mapping (Aaryan) ---

    // TODO(Aaryan): implement

endmodule
