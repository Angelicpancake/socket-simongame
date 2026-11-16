//------------------------------------------------------------------------------
// Testbench: tb_ssdec
// Owner    : Noah
// DUT      : rtl/ssdec.sv
// Done when: all 10 digits (and blank) match the expected segment patterns
//------------------------------------------------------------------------------

`include "tb_utils.svh"

module tb_ssdec;
    logic clk = 0, nrst = 0;
    always #5 clk = ~clk;

    // TODO(Noah): instantiate ssdec, drive stimulus, self-check with $error

    initial begin
        #100 nrst = 1;
        // TODO: stimulus
        #1000 $display("tb_ssdec: DONE");
        $finish;
    end
endmodule
