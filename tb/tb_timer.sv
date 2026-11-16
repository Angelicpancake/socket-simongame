//------------------------------------------------------------------------------
// Testbench: tb_timer
// Owner    : Joshua
// DUT      : rtl/timer.sv
// Done when: expires after exactly N cycles; restart mid-count works; no off-by-one
//------------------------------------------------------------------------------

`include "tb_utils.svh"

module tb_timer;
    logic clk = 0, nrst = 0;
    always #5 clk = ~clk;

    // TODO(Joshua): instantiate timer, drive stimulus, self-check with $error

    initial begin
        #100 nrst = 1;
        // TODO: stimulus
        #1000 $display("tb_timer: DONE");
        $finish;
    end
endmodule
