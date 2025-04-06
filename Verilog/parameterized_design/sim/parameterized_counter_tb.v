`timescale 1ns / 1ps

module parameterized_counter_tb ();

  parameter WIDTH_8 = 8;
  parameter WIDTH_10 = 10;

  reg clk;
  reg reset;

  wire [WIDTH_8-1:0] q_8;
  wire [WIDTH_10-1:0] q_10;

  parameterized_counter #(
      .WIDTH(WIDTH_8)
  ) counter_8 (
      .clk(clk),
      .reset(reset),
      .q(q_8)
  );

  parameterized_counter #(
      .WIDTH(WIDTH_10)
  ) counter_10 (
      .clk(clk),
      .reset(reset),
      .q(q_10)
  );

  initial clk = 1'b0;
  always #50 clk = ~clk;

  initial begin
    reset = 1'b1;

    #100 reset = 1'b0;

    #900 $finish;
  end

  initial begin
    $monitor("Time(ns): %4d, clk: %b, reset: %b, q_8: %3d, q_10: %3d", $time, clk, reset, q_8,
             q_10);
  end

endmodule
