/////////////////////////////////////////////////////////////////////////////
//
// The finite state machine is specified using the following state diagram:
//
//                               ┌────────┐
//                               │        │
//             ┌───────────────> │  "00"  │ <───────────────┐
//             │                 │        │                 │
//             │                 └────────┘                 │
//             │                      │                     │
//             │                      │   - /               │
//             │                      │ Y <= 0              │
//             │                      │                     │
//             │                      ∨                     │
//        - /  │                 ┌────────┐                 │   - /
//      Y <= 0 │         C = 0 / │        │ C = 1 /         │ Y <= 0
//             │          Y <= 0 │  "01"  │ Y = 1           │
//             │         ┌───────│        │───────┐         │
//             │         │       └────────┘       │         │
//             │         │                        │         │
//             │         ∨                        ∨         │
//             │    ┌────────┐                ┌────────┐    │
//             │    │        │                │        │    │
//             └────│  "10"  │                │  "11"  │────┘
//                  │        │                │        │
//                  └────────┘                └────────┘
//
/////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module FSM_from_state_diagram (
    input  wire clk,
    input  wire C,
    output reg  Y
);

  reg [1:0] current_state, next_state;

  initial current_state = 2'b00;
  initial Y = 1'b0;

  always @(posedge clk) begin
    current_state <= next_state;
  end

  always @(*) begin
    case (current_state)
      2'b00:   next_state = 2'b01;
      2'b01:   next_state = (C == 1'b1) ? 2'b11 : 2'b10;
      2'b10:   next_state = 2'b00;
      2'b11:   next_state = 2'b00;
      default: next_state = current_state;
    endcase
  end

  always @(*) begin
    case (current_state)
      2'b00:   Y = 1'b0;
      2'b01:   Y = (C == 1'b1) ? 1'b1 : 1'b0;
      2'b10:   Y = 1'b0;
      2'b11:   Y = 1'b0;
      default: Y = 1'b0;
    endcase
  end

endmodule
