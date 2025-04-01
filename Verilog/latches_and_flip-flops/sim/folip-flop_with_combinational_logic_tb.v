`timescale 1ns / 1ps

module folip_flop_with_combinational_logic_tb ();

  reg  clk;
  reg  x1;
  reg  x2;
  wire q1;
  wire q2;

  folip_flop_with_combinational_logic uut (
      .clk(clk),
      .x1 (x1),
      .x2 (x2),
      .q1 (q1),
      .q2 (q2)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    // Initialize Inputs
    x1 = 0;
    x2 = 0;

    #100 x1 = 1;  // Set x1
    #100 x2 = 1;  // Both active
    #100 x1 = 0;  // Set x2
    #100 x2 = 0;  // Back to inactive

    #100 $finish;
  end

  initial begin
    $monitor("Time(ns): %0d | x1: %b | x2: %b | q1: %b | q2: %b", $time, x1, x2, q1, q2);
  end

endmodule
