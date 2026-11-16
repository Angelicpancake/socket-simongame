# Simon (Team 20)

Simon memory game in SystemVerilog. Block diagram: `docs/architecture.png` (TODO, Rutam). FSM: `docs/fsm_diagram.png` (TODO, Rutam).

## Modules and owners

| Module | Owner | Testbench | Status |
|---|---|---|---|
| timer, btn_input, tb_utils.svh | Joshua | tb_timer, tb_btn_input | WIP |
| lfsr, seq_mem | Aaryan | tb_lfsr, tb_seq_mem | WIP |
| bin2bcd, ssdec | Noah | tb_bin2bcd, tb_ssdec | WIP |
| score_keep | Noah or Rutam (decide now) | tb_score_keep | WIP |
| simon_fsm, top, golden test | Rutam | tb_simon_fsm, tb_top_golden | WIP |

Every `.sv` file starts with a header block (owner, reviewer, status, interface, done-when). Keep `Status` current.

## Running sims

    make sim MOD=timer     # one module
    make sim_all           # every testbench
    make waves MOD=timer   # open waveform

Requires Icarus Verilog (`iverilog`) and GTKWave.

## Git workflow

- `main` is protected; it only receives PRs that pass the module's testbench.
- Branches: `module/<name>`, one owner each (e.g. `module/btn_input`).
- PRs need one review, from whoever consumes your module. Rutam reviews leaf modules; someone else reviews Rutam's.
- Interface changes go through `docs/interface_contract.md` first: update the doc in a PR, get consumers to approve, then change code.
- `simon_pkg.sv` is the source of truth for shared constants.
- Freeze `docs/interface_contract.md` and `tb/tb_utils.svh` by Nov 1-7 per the schedule.
