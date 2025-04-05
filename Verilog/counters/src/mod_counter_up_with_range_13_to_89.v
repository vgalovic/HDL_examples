`timescale 1ns / 1ps

module mod_counter_up_with_range_13_to_89 #(
    parameter integer MIN = 13,
    parameter integer MAX = 89
) (
    input wire clk,
    input wire en,
    input wire load,
    input wire reset,
    input wire [6:0] counter_value,
    output reg [6:0] q,
    output reg overflow
);

  initial q = MIN;

  always @(posedge clk) begin
    if (reset) q <= MIN;
    else if (load && (counter_value > MIN) && (counter_value < MAX - 1)) q <= counter_value;
    else if (en) begin
      if (q == MAX - 1) q <= MIN;
      else q <= q + 1;
    end
  end

  always @(*) begin
    if (q >= MAX - 1) overflow <= 1;
    else overflow <= 0;
  end

endmodule
