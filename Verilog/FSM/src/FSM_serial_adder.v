//////////////////////////////////////////////////////////////////////////////
//
// State diagram for serial adder:
//
//                                a=1 and b=1 /
//                                    S<=0
//            reset=1 ────┐  ┌───────────────────┐
//                        ∨  │                   ∨
//   a=0 and b=0/s<=0    ┌────────┐         ┌────────┐      a=0 and b=1/s<=0
//          or        ┌──│        │         │        │────┐        or
//   a=0 and b=1/s<=1 │  │  NCI   │         │   CI   │    │ a=1 and b=0/s<=0
//          or        └─>│        │         │        │<───┘        or
//   a=1 and b=0/s<=1    └────────┘         └────────┘      a=1 and b=1/s<=1
//                           ∧                   │
//                           └───────────────────┘
//                                a=0 and b=0 /
//                                    s<=1
//
//////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module FSM_serial_adder (
    input  wire clk,
    input  wire reset,
    input  wire a,
    input  wire b,
    output reg  s
);

  localparam NCI = 0, CI = 1;

  reg current_state = NCI, next_state;

  initial s = 1'b0;

  always @(posedge clk) begin
    current_state <= (reset) ? NCI : next_state;
  end

  always @(*) begin
    case (current_state)
      NCI: next_state = (a && b) ? CI : NCI;
      CI: next_state = (!a && !b) ? NCI : CI;
      default: next_state = current_state;
    endcase
  end

  always @(*) begin
    case (current_state)
      NCI: s = (a != b) ? 1'b1 : 1'b0;
      CI: s = (a != b) ? 1'b0 : 1'b1;
      default: s <= 1'b0;
    endcase
  end

endmodule
