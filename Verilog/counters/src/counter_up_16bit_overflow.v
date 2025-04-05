`timescale 1ns / 1ps

module counter_up_16bit_overflow (
    input wire clk,
    input wire ce,
    input wire en,
    input wire load,
    output reg overflow,
    input wire [15:0] counter_value,
    input wire [15:0] overflow_value,
    output reg [15:0] q
);

  initial q = 16'b0;

  always @(posedge clk) begin
    if (ce) begin
      if (load) q <= counter_value;
      else if (en) q <= q + 1;
    end
  end

  always @(*) begin
    if (q == overflow_value) overflow <= 1;
    else overflow <= 0;
  end

endmodule
