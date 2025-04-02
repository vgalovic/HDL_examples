`timescale 1ns / 1ps

module SISO_sync_4bit_register_with_ce_we (
    input  wire clk,
    input  wire ce,
    input  wire we,
    input  wire reset,
    input  wire set,
    input  wire d,
    output wire q
);

  reg [3:0] q_w;

  always @(posedge clk) begin
    if (reset) q_w <= 4'b0;
    else if (set) q_w <= {4{1'b1}};
    else if (ce && we) q_w <= {d, q_w[3:1]};  // Shift left, serial input `d` goes to LSB
    // else if (ce && we) q_w <= {q_w[2:0], d};  // Shift right, serial input `d` goes to MSB
  end

  assign q = q_w[0];  // Output the LSB of the shift register for shift left
  // assign q = q_w[3];  // Output the MSB of the shift register for shift right


endmodule
