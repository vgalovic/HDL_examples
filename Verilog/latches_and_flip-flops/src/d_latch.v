`timescale 1ns / 1ps

module d_latch (
    input  wire d,
    input  wire g,
    output reg  q
);

  always @(*) begin
    if (g) begin
      q = d;
    end
  end

endmodule
