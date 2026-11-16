//------------------------------------------------------------------------------
// Testbench: tb_ssdec
// Owner    : Noah
// DUT      : rtl/ssdec.sv
// Done when: all 10 digits (and blank) match the expected segment patterns
//------------------------------------------------------------------------------

`include "tb_utils.svh"

module tb_ssdec;

    logic [3:0] digit;
    logic       blank;
    logic [6:0] seg, seg_n;

    // expected patterns {g,f,e,d,c,b,a}, written out separately from the DUT
    logic [6:0] expected [0:9] = '{
        7'h3F, 7'h06, 7'h5B, 7'h4F, 7'h66, 7'h6D, 7'h7D, 7'h07, 7'h7F, 7'h6F
    };

    ssdec                    DUT   (.digit(digit), .blank(blank), .seg(seg));
    ssdec #(.ACTIVE_LOW(1))  DUT_N (.digit(digit), .blank(blank), .seg(seg_n));

    initial begin
        $dumpfile("ssdec.vcd");
        $dumpvars(0, tb_ssdec);
        for (int i = 0; i < 16; i++) begin
            digit = 4'(i);
            blank = 0;
            #1;
            if (seg !== (i < 10 ? expected[i] : 7'h00))
                $fatal(1, "digit %0d gave seg %b", i, seg);
            if (seg_n !== ~seg)
                $fatal(1, "digit %0d active-low output is not the inverse", i);
            blank = 1;
            #1;
            if (seg !== 7'h00 || seg_n !== 7'h7F)
                $fatal(1, "digit %0d not dark when blanked", i);
        end
        $display("PASS ssdec: digits 0-9, invalid codes, blanking, both polarities");
        $finish;
    end

endmodule
