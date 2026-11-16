//------------------------------------------------------------------------------
// Testbench: tb_seq_mem
// Owner    : Aaryan
// DUT      : rtl/seq_mem.sv
// Done when: write N entries, read back identical; read latency matches contract
//------------------------------------------------------------------------------

`include "tb_utils.svh"

module tb_seq_mem;
    logic clk = 0, nrst = 0;
    always #5 clk = ~clk;

    // TODO(Aaryan): instantiate seq_mem, drive stimulus, self-check with $error

    initial begin
        #100 nrst = 1;
        // TODO: stimulus
        #1000 $display("tb_seq_mem: DONE");
        $finish;
    end
endmodule
