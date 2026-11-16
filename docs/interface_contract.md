# Interface contract

Single source of truth for every signal. Change this doc (via PR, approved by consumers) before changing code.  
Shared constants live in `rtl/simon_pkg.sv`.

| Module | Signal | Width | Dir | Active level | Pulse/Level | Notes |
|---|---|---|---|---|---|---|
| all | clk | 1 | in | rising edge | level | 100 MHz system clock (Pin W5) |
| all | rst | 1 | in | high | level | sync reset; mapped to `sw[15]` (or `btnC` if using 4 lights) |
| btn_input | btn[4:0] | 5 | in | high | level | Basys 3 buttons: `{btnC, btnU, btnL, btnR, btnD}` = lights 4:0 |
| btn_input | start_sw | 1 | in | high | level | mapped to `sw[0]` (start trigger on rising edge) |
| btn_input | press[4:0] | 5 | out | high | 1-cycle pulse | debounced & synchronized |
| btn_input | start_press | 1 | out | high | 1-cycle pulse | edge-detected from `start_sw` |
| top / lights | led[4:0] | 5 | out | high | level | mapped to `led[4:0]` for Simon output lights |
| timer | TBD | | | | | Joshua (note: 100 MHz = 10 ns period) |
| lfsr | TBD | | | | | Aaryan |
| seq_mem | TBD (read latency) | | | | | Aaryan |
| score_keep | TBD | | | | | Noah/Rutam |
| bin2bcd | TBD | | | | | Noah |
| ssdec | seg[6:0] | 7 | out | low | level | active-low cathodes `{CG..CA}` for Basys 3 7-seg |
| ssdec | an[3:0] | 4 | out | low | level | active-low digit anodes (time-multiplexed) |
| simon_fsm | TBD | | | | | Rutam |