//------------------------------------------------------------------------------
// Testbench: tb_score_display
// Owner    : Noah
// DUT      : rtl/score_display.sv (with bin2bcd and ssdec)
// Done when: every score 0-255 reads back off the segments; leading zeros dark;
//            high score held across a lower-scoring game, shown, cleared by reset
//------------------------------------------------------------------------------

`include "tb_utils.svh"

module tb_score_display;

    logic       clk = 0, nrst = 1;
    logic [7:0] score = 0, hi_score;
    logic       show_hi = 0;
    logic [6:0] seg_2, seg_1, seg_0;

    always #1 clk = ~clk;

    score_display DUT (.*);

    // segments back to a digit; 10 = dark, 15 = not a digit
    function automatic logic [3:0] digit_of(input logic [6:0] seg);
        case (seg)
            7'h3F: return 4'd0;
            7'h06: return 4'd1;
            7'h5B: return 4'd2;
            7'h4F: return 4'd3;
            7'h66: return 4'd4;
            7'h6D: return 4'd5;
            7'h7D: return 4'd6;
            7'h07: return 4'd7;
            7'h7F: return 4'd8;
            7'h6F: return 4'd9;
            7'h00: return 4'd10;
            default: return 4'd15;
        endcase
    endfunction

    // what the three digits should read for value v, leading zeros dark
    task automatic expect_shows(input int v);
        logic [3:0] h, t, o;
        h = (v >= 100) ? 4'(v / 100) : 4'd10;
        t = (v >= 10) ? 4'((v / 10) % 10) : 4'd10;
        o = 4'(v % 10);
        if (digit_of(seg_2) !== h || digit_of(seg_1) !== t || digit_of(seg_0) !== o)
            $fatal(1, "expected %0d on the display, segs %h %h %h", v, seg_2, seg_1, seg_0);
    endtask

    task automatic set_score(input int v);
        @(negedge clk);
        score = 8'(v);
        @(negedge clk);
    endtask

    initial begin
        $dumpfile("score_display.vcd");
        $dumpvars(0, tb_score_display);
        nrst = 0;
        @(negedge clk);
        nrst = 1;

        // every score reads correctly, and the high score follows a rising score
        for (int i = 0; i < 256; i++) begin
            set_score(i);
            expect_shows(i);
            if (hi_score !== 8'(i)) $fatal(1, "hi_score %0d after score %0d", hi_score, i);
        end

        // reset clears the high score
        score = 0;
        nrst = 0;
        @(negedge clk);
        nrst = 1;
        if (hi_score !== 8'd0) $fatal(1, "hi_score not cleared by reset");

        // a game to 12, then a new game to 5: high score stays 12
        set_score(12);
        set_score(0);
        set_score(5);
        expect_shows(5);
        if (hi_score !== 8'd12) $fatal(1, "hi_score %0d, expected 12", hi_score);
        show_hi = 1;
        #1;
        expect_shows(12);
        show_hi = 0;
        #1;
        expect_shows(5);

        // beating it moves it
        set_score(13);
        show_hi = 1;
        #1;
        expect_shows(13);

        $display("PASS score_display: 0-255, leading-zero blanking, high score, reset");
        $finish;
    end

endmodule
