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
| bin2bcd | TBD | | | | | Noah |
| ssdec | TBD | | | | | Noah |
| simon_fsm | TBD | | | | | Rutam |
