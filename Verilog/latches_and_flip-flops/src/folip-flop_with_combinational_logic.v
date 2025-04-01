`timescale 1ns / 1ps

// T Flip-Flop

module folip_flop_with_combinational_logic (
    input  wire clk,
    input  wire x1,
    input  wire x2,
    output reg  q1,
    output wire q2
);

  wire a0, a1, d;

  assign a0 = x1 & q2;
  assign a1 = x2 & q1;
  assign d  = a0 | a1;

  always @(posedge clk) begin
    q1 <= d;
  end

  assign q2 = ~q1;

endmodule
