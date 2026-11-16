//------------------------------------------------------------------------------
// Testbench: tb_lfsr
// Owner    : Aaryan
// DUT      : rtl/lfsr.sv
// Done when: never locks up at all-zero/all-ones; output sequence matches reference model
//------------------------------------------------------------------------------

`include "tb_utils.svh"

module tb_lfsr;
    logic clk = 0, nrst = 0;
    always #5 clk = ~clk;

    // TODO(Aaryan): instantiate lfsr, drive stimulus, self-check with $error

    initial begin
        #100 nrst = 1;
        // TODO: stimulus
        #1000 $display("tb_lfsr: DONE");
        $finish;
    end
endmodule
