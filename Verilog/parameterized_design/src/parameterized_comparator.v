`timescale 1ns / 1ps

module parameterized_comparator #(
    parameter WIDTH = 8
) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    output lt,
    output eq,
    output gt
);

  assign lt = (a < b);
  assign eq = (a == b);
  assign gt = (a > b);

endmodule
