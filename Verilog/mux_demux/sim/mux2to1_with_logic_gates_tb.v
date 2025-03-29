`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Vladimir Galović
//
// Create Date: 03/29/2025 11:30:12 AM
// Design Name:
// Module Name: mux2to1_with_logic_gates_tb
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


module mux2to1_with_logic_gates_tb ();

  reg x0, x1, sel;
  wire y;

  mux2to1_with_logic_gates dut (
      .x0 (x0),
      .x1 (x1),
      .sel(sel),
      .y  (y)
  );

  initial begin
    x0  = 0;
    x1  = 0;
    sel = 0;
    #100;
    x0 = 1;
    #100;
    x1 = 1;
    #100;
    sel = 1;
    #100;
    x0 = 0;
    #100;
    x1 = 0;
    #100;
  end

endmodule
