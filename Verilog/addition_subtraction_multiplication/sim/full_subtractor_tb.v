`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Vladimir Galović
//
// Create Date: 03/27/2025 06:07:09 PM
// Design Name:
// Module Name: full_subtractor_tb
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

module full_subtractor_tb ();

  reg A, B, Bin;
  wire D, Bout;

  full_subtractor uut (
      .A(A),
      .B(B),
      .Bin(Bin),
      .D(D),
      .Bout(Bout)
  );

  initial begin
    $display("A B Bin | D Bout");

    A   = 0;
    B   = 0;
    Bin = 0;
    #100;
    $display("%b %b %b  | %b  %b", A, B, Bin, D, Bout);

    A   = 0;
    B   = 0;
    Bin = 1;
    #100;
    $display("%b %b %b  | %b  %b", A, B, Bin, D, Bout);

    A   = 0;
    B   = 1;
    Bin = 0;
    #100;
    $display("%b %b %b  | %b  %b", A, B, Bin, D, Bout);

    A   = 0;
    B   = 1;
    Bin = 1;
    #100;
    $display("%b %b %b  | %b  %b", A, B, Bin, D, Bout);

    A   = 1;
    B   = 0;
    Bin = 0;
    #100;
    $display("%b %b %b  | %b  %b", A, B, Bin, D, Bout);

    A   = 1;
    B   = 0;
    Bin = 1;
    #100;
    $display("%b %b %b  | %b  %b", A, B, Bin, D, Bout);

    A   = 1;
    B   = 1;
    Bin = 0;
    #100;
    $display("%b %b %b  | %b  %b", A, B, Bin, D, Bout);

    A   = 1;
    B   = 1;
    Bin = 1;
    #100;
    $display("%b %b %b  | %b  %b", A, B, Bin, D, Bout);

    $finish;
  end

endmodule
