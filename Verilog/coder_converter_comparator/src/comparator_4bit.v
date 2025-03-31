`timescale 1ns / 1ps

module comparator_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    output reg eq,
    output reg gt,
    output reg lt
);

  always @(*) begin
    eq = 1'b0;
    gt = 1'b0;
    lt = 1'b0;

    if (a == b) eq = 1'b1;
    if (a > b) gt = 1'b1;
    if (a < b) lt = 1'b1;
  end

endmodule
