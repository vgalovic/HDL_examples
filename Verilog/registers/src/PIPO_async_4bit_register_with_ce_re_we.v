`timescale 1ns / 1ps

module PIPO_async_4bit_register_with_ce_re_we (
    input wire clk,
    input wire ce,
    input wire re,
    input wire we,
    input wire clear,
    input wire preset,
    input wire [3:0] d,
    output reg [3:0] q
);

  reg [3:0] q_w;

  always @(posedge clk or posedge clear or posedge preset) begin
    if (clear) q_w <= 4'b0;
    else if (preset) q_w <= 4'b1111;
    else if (ce && we) q_w <= d;
  end

  always @(*) begin
    if (re) q = q_w;
    else q = 4'b0;
  end

endmodule
