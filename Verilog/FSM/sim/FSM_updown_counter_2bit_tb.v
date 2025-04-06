`timescale 1ns / 1ps

module FSM_updown_counter_2bit_tb ();

  reg clk;
  reg d;
  wire [1:0] q;

  FSM_updown_counter_2bit dut (
      .clk(clk),
      .d  (d),
      .q  (q)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    d = 0;

    #300 d = 1;

    #300 $finish;
  end

  initial begin
    $monitor("Time(ns): %4d | clk: %b | d: %b | q: %2b", $time, clk, d, q);
  end
endmodule
