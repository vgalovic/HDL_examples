`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Vladimir Galović
//
// Create Date: 03/27/2025 03:58:45 PM
// Design Name:
// Module Name: and_cir
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


module and_cir (
    input  wire a,  // Input a
    input  wire b,  // Input b
    output wire f   // Output y
);

  assign f = a & b;

endmodule
