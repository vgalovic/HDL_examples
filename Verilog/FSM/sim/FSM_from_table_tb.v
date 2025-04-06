`timescale 1ns / 1ps

module FSM_from_table_tb ();

  reg clk, x, y;
  wire o;

  FSM_from_table dut (
      .clk(clk),
      .x  (x),
      .y  (y),
      .o  (o)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    x = 0;
    y = 0;

    #100 x = 1;
    #100 y = 1;
    #100 x = 0;
    #100 y = 0;
    #100 x = 1;
    #100 y = 1;
    #100 x = 0;

    #100 $finish;
  end

  initial begin
    $monitor("Time(ns): %0d | x: %b | y: %b | o: %b", $time, x, y, o);
  end

endmodule
