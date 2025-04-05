`timescale 1ns / 1ps

module counter_up_8bit (
    input wire clk,
    input wire reset,
    input wire ce,
    input wire en,
    output reg [7:0] q
);

  initial q = 8'b0;

  always @(posedge clk) begin
    if (reset) q <= 8'b0;
    else if (ce && en) q <= q + 1;
  end
endmodule
