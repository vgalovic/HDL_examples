`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Vladimir Galović
//
// Create Date: 03/29/2025 11:23:48 AM
// Design Name:
// Module Name: mux2to1_with_logic_gates
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


module mux2to1_with_logic_gates (
    input  wire x0,
    input  wire x1,
    input  wire sel,
    output wire y
);

  wire and0, and1;

  assign and0 = x0 & ~sel;
  assign and1 = x1 & sel;

  assign y = and0 | and1;
endmodule
