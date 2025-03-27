`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Vladimir Galović
//
// Create Date: 03/27/2025 03:59:49 PM
// Design Name:
// Module Name: full_subtractor
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


module full_subtractor (
    input  wire A,    // Minuend
    input  wire B,    // Subtrahend
    input  wire Bin,  // Borrow-in
    output wire D,    // Difference
    output wire Bout  // Borrow-out
);

  wire x0, b0, b1;

  assign x0   = A ^ B;
  assign D    = x0 ^ Bin;

  assign b0   = ~A & B;
  assign b1   = ~x0 & Bin;

  assign Bout = b0 | b1;


endmodule
