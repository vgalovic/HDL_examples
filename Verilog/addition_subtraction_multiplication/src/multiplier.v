`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Vladimir Galović
//
// Create Date: 03/27/2025 04:00:55 PM
// Design Name:
// Module Name: multiplier
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module multiplier (
    input wire [1:0] A,  // 2-bit input A
    input wire [1:0] B,  // 2-bit input B

    output wire [3:0] C  // 4-bit output C (product)
);

  wire a0, a1, a2, a3, a4, a5;
  wire x0, x1;

  // Partial products
  assign a0   = A[0] & B[1];
  assign a1   = A[0] & B[0];
  assign a2   = A[1] & B[0];
  assign a3   = A[1] & B[1];

  assign a4   = a0 & a2;
  assign a5   = a3 & a4;

  assign x0   = a0 ^ a2;
  assign x1   = a3 ^ a4;

  assign C[0] = a1;
  assign C[1] = x0;
  assign C[2] = x1;
  assign C[3] = a5;

endmodule
