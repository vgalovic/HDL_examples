`timescale 1ns / 1ps

module JK_flip_flop_with_rising_edge_tb ();

  reg  clk;
  reg  J;
  reg  K;
  wire Q;

  JK_flip_flop_with_rising_edge uut (
      .clk(clk),
      .J  (J),
      .K  (K),
      .Q  (Q)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    J = 0;
    K = 0;

    #100 J = 1;
    #100 K = 1;
    #100 K = 0;
    #100 J = 0;

    #100 $finish;
  end

  initial begin
    $monitor("Time(ns): %0d | J: %b | K: %b | Q: %b", $time, J, K, Q);
  end

endmodule
