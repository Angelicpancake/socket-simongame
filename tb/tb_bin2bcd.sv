//------------------------------------------------------------------------------
// Testbench: tb_bin2bcd
// Owner    : Noah
// DUT      : rtl/bin2bcd.sv
// Done when: exhaustive 0-99 matches reference
//------------------------------------------------------------------------------

`include "tb_utils.svh"

module tb_bin2bcd;
    logic clk = 0, nrst = 0;
    always #5 clk = ~clk;

    // TODO(Noah): instantiate bin2bcd, drive stimulus, self-check with $error

    initial begin
        #100 nrst = 1;
        // TODO: stimulus
        #1000 $display("tb_bin2bcd: DONE");
        $finish;
    end
endmodule
