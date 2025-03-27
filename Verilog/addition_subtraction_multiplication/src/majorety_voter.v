`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Vladimir Galović
//
// Create Date: 03/27/2025 04:00:32 PM
// Design Name:
// Module Name: majorety_voter
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


module majorety_voter (
    input  x,
    input  y,
    input  z,
    output v
);

  wire a0, a1, a2;

  assign a0 = ~(x & y);
  assign a1 = ~(y & z);
  assign a2 = ~(x & z);

  assign v  = ~(a0 & a1 & a2);

endmodule
