`timescale 1ns / 1ps

module compare_in_range (
    input wire [3:0] a,
    output reg in_range
);

  always @(*) begin
    in_range = 1'b0;

    if (a >= 4'h3 && a < 4'h7) in_range = 1'b1;
  end

endmodule
