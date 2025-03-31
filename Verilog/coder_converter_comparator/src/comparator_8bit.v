`timescale 1ns / 1ps

module comparator_8bit (
    input wire [7:0] a,
    input wire [7:0] b,
    output reg neq,
    output reg gte,
    output reg lte
);

  always @(*) begin
    neq = 1'b0;
    gte = 1'b0;
    lte = 1'b0;

    if (a != b) neq = 1'b1;
    if (a >= b) gte = 1'b1;
    if (a <= b) lte = 1'b1;
  end

endmodule
