//------------------------------------------------------------------------------
// Testbench: tb_btn_input
// Owner    : Joshua
// DUT      : rtl/btn_input.sv
// Done when: 1000-cycle hold gives exactly one pulse; sub-cycle glitch ignored;
//             two simultaneous presses follow the documented policy
//------------------------------------------------------------------------------

`include "tb_utils.svh"

module tb_btn_input;
    logic clk = 0, nrst = 0;
    always #5 clk = ~clk;

    // TODO(Joshua): instantiate btn_input, drive stimulus, self-check with $error

    initial begin
        #100 nrst = 1;
        // TODO: stimulus
        #1000 $display("tb_btn_input: DONE");
        $finish;
    end
endmodule
