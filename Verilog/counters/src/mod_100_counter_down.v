`timescale 1ns / 1ps

module mod_100_counter_down #(
    parameter integer M = 100,
    parameter integer WIDTH = 7
) (
    input wire clk,
    input wire load,
    input wire ce,
    input wire en,
    input wire [WIDTH-1:0] counter_value,
    output reg [WIDTH-1:0] q
);

  initial q = M - 1;

  always @(posedge clk) begin
    if (load) q <= counter_value;
    else if (ce && en) begin
      if (q == {WIDTH{1'b0}}) q <= M - 1;
      else q <= q - 1;
    end
  end
endmodule
