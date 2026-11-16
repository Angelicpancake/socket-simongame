# Interface contract

Single source of truth for every signal. Change this doc (via PR, approved by consumers) before changing code.
Shared constants live in `rtl/simon_pkg.sv`.

| Module | Signal | Width | Dir | Active level | Pulse/Level | Notes |
|---|---|---|---|---|---|---|
| all | clk | 1 | in | rising edge | level | system clock |
| all | nrst | 1 | in | low | level | reset style (sync/async): TBD |
| btn_input | pb[16:0] | 17 | in | high | level | pb[4:0]=lights 0-4, pb[16]=start |
| btn_input | press[4:0] | 5 | out | high | 1-cycle pulse | registered |
| btn_input | start_press | 1 | out | high | 1-cycle pulse | registered |
| timer | TBD | | | | | Joshua |
| lfsr | TBD | | | | | Aaryan |
| seq_mem | TBD (read latency) | | | | | Aaryan |
| score_keep | TBD | | | | | Noah/Rutam |
| bin2bcd | bin[7:0] | 8 | in | - | level | binary score 0-255; combinational, no clk/nrst |
| bin2bcd | bcd[11:0] | 12 | out | - | level | {hundreds, tens, ones}; two-digit board uses bcd[7:0] |
| ssdec | digit[3:0] | 4 | in | - | level | BCD digit; 10-15 give a dark digit; combinational, no clk/nrst |
| ssdec | blank | 1 | in | high | level | forces the digit dark |
| ssdec | seg[6:0] | 7 | out | high (param ACTIVE_LOW=1 inverts) | level | {g,f,e,d,c,b,a} |
| score_display | score[7:0] | 8 | in | - | level | optional wrapper (bin2bcd + 3 ssdec + high score), see docs/display.md |
| score_display | show_hi | 1 | in | high | level | show hi_score instead of score; tie low if unused |
| score_display | seg_2, seg_1, seg_0 | 7 each | out | high (param ACTIVE_LOW=1 inverts) | level | hundreds, tens, ones; leading zeros dark |
| score_display | hi_score[7:0] | 8 | out | - | level | largest score since reset; cleared only by nrst (async) |
| simon_fsm | TBD | | | | | Rutam |
