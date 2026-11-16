//------------------------------------------------------------------------------
// Module   : score_display
// Owner    : Noah
// Reviewer : Rutam
// Status   : TB passing   [WIP | TB passing | Integrated]
// Last edit: 2026-11-16
//
// Description:
//   Binary score to decimal on three seven-segment digits, leading zeros
//   blanked. Wraps bin2bcd and three ssdec so top instantiates one block.
//   Tracks the high score and shows it while show_hi is high.
//
// Interface (see docs/interface_contract.md):
//   clk          in   1   system clock
//   nrst         in   1   reset, active low, async
//   score        in   8   binary score (from score_keep)
//   show_hi      in   1   high shows hi_score instead of score
//   seg_2/1/0    out  7   hundreds / tens / ones, {g,f,e,d,c,b,a}
//   hi_score     out  8   largest score seen since reset
//
// Parameters:
//   ACTIVE_LOW (default 0): passed to ssdec
//
// Behavior notes:
//   Only nrst clears hi_score. A two-digit board leaves seg_2 unconnected.
//
// Testbench : tb/tb_score_display.sv
// Done when : every score 0-255 reads back off the segments; high score held,
//             shown and cleared as documented
//------------------------------------------------------------------------------

module score_display #(
    parameter bit ACTIVE_LOW = 0
) (
    input  logic       clk, nrst,
    input  logic [7:0] score,
    input  logic       show_hi,
    output logic [6:0] seg_2, seg_1, seg_0,
    output logic [7:0] hi_score
);

logic [7:0]  shown;
logic [11:0] bcd;

always_ff @(posedge clk, negedge nrst) begin
    if (!nrst)
        hi_score <= 8'd0;
    else if (score > hi_score)
        hi_score <= score;
end

assign shown = show_hi ? hi_score : score;

bin2bcd conv (.bin(shown), .bcd(bcd));

ssdec #(.ACTIVE_LOW(ACTIVE_LOW)) hundreds (.digit(bcd[11:8]), .blank(bcd[11:8] == 4'd0), .seg(seg_2));
ssdec #(.ACTIVE_LOW(ACTIVE_LOW)) tens     (.digit(bcd[7:4]),  .blank(bcd[11:4] == 8'd0), .seg(seg_1));
ssdec #(.ACTIVE_LOW(ACTIVE_LOW)) ones     (.digit(bcd[3:0]),  .blank(1'b0),              .seg(seg_0));

endmodule
