`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Vladimir Galović
//
// Create Date: 03/27/2025 04:01:31 PM
// Design Name:
// Module Name: xor_cir
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


module xor_cir (
    input  wire a,  // Input a
    input  wire b,  // Input b
    output wire f   // Output y
);

  assign f = a ^ b;

endmodule
