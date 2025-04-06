//////////////////////////////////////////////////////
//
// The state diagram of the corresponding sequence:
//
//          w=0                w=1
//        ┌────┐             ┌────┐
//        │    ∨             ∨    │
//      ┌───────┐          ┌───────┐
//      │  S00  │          │  S11  │<───┐
//      │       │<───┐     │       │    │
//      │  z=1  │    │     │  z=1  │    │
//      └───────┘    │     └───────┘    │
//         │         │          │       │
//         │         │          │       │
//     w=1 │         │ w=0      │ w=0   │ w=1
//         │         └───────┐  │       │
//         ∨                 │  ∨       │
//      ┌───────┐   w=0    ┌───────┐    │
//      │  S01  │─────────>│  S10  │    │
//      │       │          │       │    │
//      │  z=0  │<─────────│  z=0  │    │
//      └───────┘   w=1    └───────┘    │
//         │                            │
//         └────────────────────────────┘
//
//////////////////////////////////////////////////////

`timescale 1ns / 1ps

module FSM_corresponding_sequence (
    input  wire clk,
    input  wire w,
    output reg  z
);

  localparam S00 = 2'b00, S01 = 2'b01, S10 = 2'b10, S11 = 2'b11;

  reg [1:0] current_state = S00, next_state;
  initial z = 1'b1;

  always @(posedge clk) begin
    current_state <= next_state;
  end

  always @(*) begin
    case (current_state)
      S00: next_state = (w) ? S01 : S00;
      S01: next_state = (w) ? S11 : S10;
      S11: next_state = (w) ? S01 : S00;
      S10: next_state = (w) ? S11 : S10;
      default: next_state = current_state;
    endcase
  end

  always @(*) begin
    case (current_state)
      S00, S11: z = 1'b1;
      S01, S10: z = 1'b0;
      default:  z = 1'b0;
    endcase
  end

endmodule
