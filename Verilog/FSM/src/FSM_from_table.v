/////////////////////////////////////////////////////////////////
//
//  Verilog model of the Finite State Machine (FSM)
//  defined by the state transition and output table below:
//
//   +----------+-----------------------------------+
//   |          |         Next state/output         |
//   |          +-----------------------------------+
//   |  Current |          Inputs:(x, y)            |
//   |  Status  +--------+--------+--------+--------+
//   |          | (0, 0) | (0, 1) | (1, 0) | (1, 1) |
//   +----------+--------+--------+--------+--------+
//   |    S1    | S3 / 0 | S3 / 0 | S2 / 1 | S2 / 1 |
//   |    S2    | S1 / 0 | S1 / 0 | S1 / 0 | S1 / 0 |
//   |    S3    | S4 / 1 | S4 / 1 | S4 / 1 | S4 / 1 |
//   |    S4    | S1 / 0 | S2 / 0 | S1 / 0 | S2 / 0 |
//   +----------+--------+--------+--------+--------+
//
/////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module FSM_from_table (
    input  wire clk,
    input  wire x,
    input  wire y,
    output reg  o
);

  localparam S1 = 0, S2 = 1, S3 = 2, S4 = 3;

  reg [1:0] current_state, next_state;

  initial current_state = S1;
  initial o = 1'b0;

  always @(posedge clk) begin
    current_state <= next_state;
  end

  always @(*) begin
    case (current_state)
      S1: begin
        if (!x && !y) next_state = S3;
        else if (!x && y) next_state = S3;
        else if (x && !y) next_state = S2;
        else next_state = S2;
      end

      S2: next_state = S1;

      S3: next_state = S4;

      S4: begin
        if (!x && !y) next_state = S1;
        else if (!x && y) next_state = S2;
        else if (x && !y) next_state = S1;
        else next_state = S2;
      end

      default: next_state = current_state;
    endcase
  end

  always @(*) begin
    case (current_state)
      S1: o <= 1'b0;
      S2: o <= 1'b0;
      S3: o <= 1'b1;
      S4: o <= 1'b0;
      default: o <= 1'b0;
    endcase
  end

endmodule

