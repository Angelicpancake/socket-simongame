//------------------------------------------------------------------------------
// Testbench: tb_bin2bcd
// Owner    : Noah
// DUT      : rtl/bin2bcd.sv
// Done when: exhaustive 0-255 matches reference
//------------------------------------------------------------------------------

`include "tb_utils.svh"

module tb_bin2bcd;

    logic [7:0]  bin;
    logic [11:0] bcd;

    bin2bcd DUT (.bin(bin), .bcd(bcd));

    initial begin
        $dumpfile("bin2bcd.vcd");
        $dumpvars(0, tb_bin2bcd);
        for (int i = 0; i < 256; i++) begin
            bin = 8'(i);
            #1;
            if (bcd !== {4'(i / 100), 4'((i / 10) % 10), 4'(i % 10)})
                $fatal(1, "bin %0d gave bcd %h", i, bcd);
        end
        $display("PASS bin2bcd: all 256 inputs");
        $finish;
    end

endmodule
