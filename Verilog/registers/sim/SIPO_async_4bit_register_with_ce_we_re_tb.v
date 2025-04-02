`timescale 1ns / 1ps

module SIPO_async_4bit_register_with_ce_we_re_tb ();

  reg clk;
  reg ce;
  reg we;
  reg re;
  reg clear;
  reg preset;
  reg d;
  wire [3:0] q;

  SIPO_async_4bit_register_with_ce_we_re DUT (
      .clk(clk),
      .ce(ce),
      .we(we),
      .re(re),
      .clear(clear),
      .preset(preset),
      .d(d),
      .q(q)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    clear = 0;
    preset = 0;
    ce = 0;
    we = 0;
    re = 0;
    d = 1;

    #100 ce = 1;
    #100 we = 1;
    #100 re = 1;
    #100 clear = 1;
    #100 clear = 0;
    #100 preset = 1;
    #100 preset = 0;
    #100 d = 0;
    #100 d = 1;
    #100 d = 0;

  end

  initial begin
    $monitor(
        "Time(ns): %0d | clock: %b | ce: %b  we: %b | re: %b | clear %b | preset: %b | d: %b | q: %b",
        $time, clk, ce, we, re, clear, preset, d, q);
  end

endmodule
