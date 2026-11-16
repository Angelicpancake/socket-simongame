//------------------------------------------------------------------------------
// Package  : simon_pkg
// Owner    : Rutam (shared; changes go through docs/interface_contract.md first)
// Reviewer : all
// Status   : WIP
// Last edit: 2026-11-16
//
// Description:
//   Source of truth for shared constants. Nobody hardcodes 5 or 16 in a module.
//------------------------------------------------------------------------------

package simon_pkg;
    // TODO(Rutam): confirm values against the board
    localparam int CLK_HZ     = 50_000_000;  // <decide>
    localparam int NUM_LIGHTS = 5;
    localparam int LIGHT_W    = $clog2(NUM_LIGHTS);
    typedef logic [LIGHT_W-1:0] light_t;     // light index encoding 0..NUM_LIGHTS-1
endpackage
