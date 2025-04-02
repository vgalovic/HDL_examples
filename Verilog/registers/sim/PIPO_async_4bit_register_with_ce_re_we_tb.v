`timescale 1ns / 1ps

module PIPO_async_4bit_register_with_ce_re_we_tb ();

  reg clk;
  reg ce;
  reg re;
  reg we;
  reg clear;
  reg preset;
  reg [3:0] d;
  wire [3:0] q;

  PIPO_async_4bit_register_with_ce_re_we DUT (
      .clk(clk),
      .ce(ce),
      .re(re),
      .we(we),
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
    #100 d = 2;
    #100 d = 3;
    #100 d = 4;

  end

  initial begin
    $monitor(
        "Time(ns): %0d | clock: %b | ce: %b  we: %b | re: %b | clear %b | preset: %b | d: %b | q: %b",
        $time, clk, ce, we, re, clear, preset, d, q);
  end
endmodule
