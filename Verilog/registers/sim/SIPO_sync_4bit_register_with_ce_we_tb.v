`timescale 1ns / 1ps

module SIPO_sync_4bit_register_with_ce_we_tb ();

  reg clk;
  reg ce;
  reg we;
  reg set;
  reg reset;
  reg d;
  wire [3:0] q;

  SIPO_sync_4bit_register_with_ce_we DUT (
      .clk(clk),
      .ce(ce),
      .we(we),
      .set(set),
      .reset(reset),
      .d(d),
      .q(q)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    set = 0;
    reset = 1;
    ce = 0;
    we = 0;
    d = 1;

    #100 reset = 0;
    #100 ce = 1;
    #100 we = 1;
    #100 set = 1;
    #100 set = 0;
    #100 d = 1;
    #100 d = 0;
    #100 d = 1;
    #100 d = 0;

  end

  initial begin
    $monitor("Time(ns): %0d | clock: %b | ce: %b  we: %b | set %b | reset: %b | d: %b | q: %b",
             $time, clk, ce, we, set, reset, d, q);
  end

endmodule
