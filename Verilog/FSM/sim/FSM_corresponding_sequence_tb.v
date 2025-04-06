`timescale 1ns / 1ps

module FSM_corresponding_sequence_tb ();

  reg  clk;
  reg  w;
  wire z;

  FSM_corresponding_sequence dut (
      .clk(clk),
      .w  (w),
      .z  (z)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    w = 0;
    #100 w = 1;
    #100 w = 0;
    #100 w = 1;
    #100 w = 0;

    #200 $finish;
  end

  initial begin
    $monitor("Time(ns): %4d | clk: %b | w: %b | z: %b", $time, clk, w, z);
  end

endmodule
