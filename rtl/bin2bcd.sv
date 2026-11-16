//------------------------------------------------------------------------------
// Module   : bin2bcd
// Owner    : Noah
// Reviewer : Rutam
// Status   : TB passing   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Converts a binary score to BCD digits for the display.
//
// Interface (see docs/interface_contract.md):
//   bin          in   8   binary score, 0-255
//   bcd          out  12  {hundreds, tens, ones}, 4 bits each
//
// Parameters:
//   none
//
// Behavior notes:
//   Combinational double dabble (shift left, add 3 to any digit that is 5 or
//   more). No clk/nrst. A two-digit board uses bcd[7:0] and ignores bcd[11:8].
//
// Testbench : tb/tb_bin2bcd.sv
// Done when : exhaustive 0-255 matches reference
//------------------------------------------------------------------------------

module bin2bcd (
    input  logic [7:0]  bin,
    output logic [11:0] bcd
);

always_comb begin
    bcd = 12'd0;
    for (int i = 7; i >= 0; i--) begin
        if (bcd[3:0]  >= 4'd5) bcd[3:0]  = bcd[3:0]  + 4'd3;
        if (bcd[7:4]  >= 4'd5) bcd[7:4]  = bcd[7:4]  + 4'd3;
        if (bcd[11:8] >= 4'd5) bcd[11:8] = bcd[11:8] + 4'd3;
        bcd = {bcd[10:0], bin[i]};
    end
end

endmodule
