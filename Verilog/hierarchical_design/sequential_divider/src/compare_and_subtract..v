`timescale 1ns / 1ps

module compare_and_subtract #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] b_r,
    input wire [WIDTH-1:0] r_r,

    output wire q_bit,
    output wire [WIDTH-1:0] r_temp
);

  assign q_bit  = (r_r >= b_r);
  assign r_temp = (q_bit) ? (r_r - b_r) : r_r;

endmodule
