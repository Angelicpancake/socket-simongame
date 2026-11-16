//------------------------------------------------------------------------------
// Module   : ssdec
// Owner    : Noah
// Reviewer : Rutam
// Status   : TB passing   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Decodes a BCD digit to seven-segment outputs.
//
// Interface (see docs/interface_contract.md):
//   digit        in   4   BCD digit; codes 10-15 give a dark digit
//   blank        in   1   high forces the digit dark
//   seg          out  7   {g,f,e,d,c,b,a}
//
// Parameters:
//   ACTIVE_LOW (default 0): 1 inverts seg for common-anode displays
//
// Behavior notes:
//   Combinational. No clk/nrst.
//
// Testbench : tb/tb_ssdec.sv
// Done when : all 10 digits (and blank) match the expected segment patterns
//------------------------------------------------------------------------------

module ssdec #(
    parameter bit ACTIVE_LOW = 0
) (
    input  logic [3:0] digit,
    input  logic       blank,
    output logic [6:0] seg
);

logic [6:0] on;

always_comb begin
    case (digit)
        4'd0:    on = 7'b0111111;
        4'd1:    on = 7'b0000110;
        4'd2:    on = 7'b1011011;
        4'd3:    on = 7'b1001111;
        4'd4:    on = 7'b1100110;
        4'd5:    on = 7'b1101101;
        4'd6:    on = 7'b1111101;
        4'd7:    on = 7'b0000111;
        4'd8:    on = 7'b1111111;
        4'd9:    on = 7'b1101111;
        default: on = 7'b0000000;
    endcase
    if (blank) on = 7'b0000000;
end

assign seg = ACTIVE_LOW ? ~on : on;

endmodule
