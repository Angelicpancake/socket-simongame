//------------------------------------------------------------------------------
// Testbench: tb_simon_fsm
// Owner    : Rutam
// DUT      : rtl/simon_fsm.sv
// Done when: correct sequence advances round; wrong press ends game; timeout handled; all states reachable
//------------------------------------------------------------------------------

`include "tb_utils.svh"

module tb_simon_fsm;
    logic clk = 0, nrst = 0;
    always #5 clk = ~clk;

    // TODO(Rutam): instantiate simon_fsm, drive stimulus, self-check with $error

    initial begin
        #100 nrst = 1;
        // TODO: stimulus
        #1000 $display("tb_simon_fsm: DONE");
        $finish;
    end
endmodule
