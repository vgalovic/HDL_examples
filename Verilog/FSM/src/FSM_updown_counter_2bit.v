///////////////////////////////////////////////////////////
//
// State diagram for up/down counter with 2 bit state:
//
//             ┌────────┐   d=0   ┌────────┐
//             │        │<────────│        │
//             │  "01"  │         │  "00"  │
//             │        │────────>│        │
//             └────────┘   d=1   └────────┘
//               │    ∧             │    ∧
//               │    │             │    │
//           d=0 │    │d=1      d=1 │    │d=0
//               │    │             │    │
//               ∨    │             ∨    │
//             ┌────────┐   d=1   ┌────────┐
//             │        │<────────│        │
//             │  "10"  │         │  "11"  │
//             │        │────────>│        │
//             └────────┘   d=0   └────────┘
//
///////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module FSM_updown_counter_2bit (
    input wire clk,
    input wire d,
    output reg [1:0] q
);

  reg [1:0] current_state, next_state;
  initial current_state = 2'b00;

  // initial q = 2'b00;

  // always @(posedge clk) begin
  //   if (d) q <= q - 1;
  //   else q <= q + 1;
  // end


  always @(posedge clk) begin
    current_state <= next_state;
  end

  always @(*) begin
    q = current_state;

    if (d) begin
      case (current_state)
        2'b00:   next_state = 2'b11;
        2'b01:   next_state = 2'b00;
        2'b10:   next_state = 2'b01;
        2'b11:   next_state = 2'b10;
        default: next_state = current_state;
      endcase
    end else begin
      case (current_state)
        2'b00:   next_state = 2'b01;
        2'b01:   next_state = 2'b10;
        2'b10:   next_state = 2'b11;
        2'b11:   next_state = 2'b00;
        default: next_state = current_state;
      endcase
    end
  end

endmodule
