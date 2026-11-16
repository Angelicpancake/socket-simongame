//------------------------------------------------------------------------------
// Testbench: tb_score_keep
// Owner    : Noah or Rutam <decide>
// DUT      : rtl/score_keep.sv
// Done when: increments once per successful round; clears on new game; max behavior as documented
//------------------------------------------------------------------------------

`include "tb_utils.svh"

module tb_score_keep;
    logic clk = 0, nrst = 0;
    always #5 clk = ~clk;

    // TODO(Noah): instantiate score_keep, drive stimulus, self-check with $error

    initial begin
        #100 nrst = 1;
        // TODO: stimulus
        #1000 $display("tb_score_keep: DONE");
        $finish;
    end
endmodule
