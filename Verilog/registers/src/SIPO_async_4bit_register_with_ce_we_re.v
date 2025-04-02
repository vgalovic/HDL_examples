`timescale 1ns / 1ps

module SIPO_async_4bit_register_with_ce_we_re (
    input wire clk,
    input wire ce,
    input wire we,
    input wire re,
    input wire clear,
    input wire preset,
    input wire d,
    output reg [3:0] q
);

  reg [3:0] q_w;

  always @(posedge clk or posedge clear or posedge preset) begin
    if (clear) q_w <= 4'b0;
    else if (preset) q_w <= {4{1'b1}};
    else if (ce && we)
      q_w <= {q_w[2:0], d};  // Shift left, serial input `d` goes to LSB  (more common in SIPO)
    // else if (ce && we) q <= {d, q[3:1]}; // Shift right, serial input `d` goes to MSB
  end

  always @(*) begin
    if (re) q = q_w;
    else q = 4'b0;
  end

endmodule
