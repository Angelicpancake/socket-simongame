# Display (Noah)

## Score format

The score is the number of rounds completed, shown in decimal with leading
zeros dark (`  7`, ` 12`). The control FSM hands the display an 8-bit binary
score; the display never counts anything itself.

The high score is the largest score seen since reset. It is kept inside
`score_display` and shown in place of the current score while `show_hi` is
high. Only `nrst` clears it.

## Modules

| Module | Ports | What it does |
|---|---|---|
| `bin2bcd` | in `bin[7:0]`, out `bcd[11:0]` | Binary to three BCD digits `{hundreds, tens, ones}`. Combinational double dabble (shift left, add 3 to any digit that is 5 or more). |
| `ssdec` | in `digit[3:0]`, `blank`; out `seg[6:0]` | One BCD digit to segments `{g,f,e,d,c,b,a}`. Codes 10-15 and `blank` give a dark digit. Parameter `ACTIVE_LOW` (default 0) inverts the output for common-anode displays. |
| `score_display` | in `clk`, `nrst`, `score[7:0]`, `show_hi`; out `seg_2`, `seg_1`, `seg_0` (7 bits each), `hi_score[7:0]` | The block the top level instantiates: high-score register, `bin2bcd`, and three `ssdec`. |

Connecting it in `top`:

```systemverilog
score_display disp (
    .clk(clk), .nrst(nrst),
    .score(score),      // from the control FSM, rounds completed
    .show_hi(show_hi),  // from the control FSM or a button; tie to 1'b0 if unused
    .seg_2(seg_2), .seg_1(seg_1), .seg_0(seg_0),
    .hi_score()
);
```

With two digits on the board, leave `seg_2` unconnected. If the segments come
out inverted on the board, set `.ACTIVE_LOW(1)`.

## Tests

Run with `make sim MOD=<name>`. Each testbench stops with a fatal error on the
first mismatch and prints one `PASS` line otherwise.

| Testbench | Checks |
|---|---|
| `tb_bin2bcd` | All 256 inputs against `/` and `%`. |
| `tb_ssdec` | Digits 0-9 against a separately written table, codes 10-15 dark, blanking, both polarities. |
| `tb_score_display` | Every score 0-255 read back off the segments, leading-zero blanking, high score held across a lower-scoring game, shown with `show_hi`, cleared by reset. |

All three pass on Icarus Verilog 13.0. Icarus prints two "sorry: constant
selects in always_* processes" notes for `bin2bcd`; they only mean the block
re-evaluates more often in simulation.
