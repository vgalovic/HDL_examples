`timescale 1ns / 1ps

module mod_100_counter_up_overflow #(
    parameter integer M = 100
) (
    input wire clk,
    input wire en,
    input wire load,
    input wire [6:0] counter_value,
    output reg [6:0] q,
    output reg overflow
);

  initial q = 7'b0;

  always @(posedge clk) begin
    if (load) q <= counter_value;
    else if (en) begin
      if (q == M - 1) q <= 7'b0;
      else q <= q + 1;
    end
  end

  always @(*) begin
    if (q == M - 1) overflow <= 1;
    else overflow <= 0;
  end

endmodule
