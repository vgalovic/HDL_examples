`timescale 1ns / 1ps

module D_flip_flop_asynchro_en_tb ();
  reg  clk;
  reg  clear;
  reg  preset;
  reg  en;
  reg  D;
  wire Q;

  D_flip_flop_asynchro_en uut (
      .clk   (clk),
      .clear (clear),
      .preset(preset),
      .en    (en),
      .D     (D),
      .Q     (Q)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    clear = 0;
    preset = 0;
    en = 0;
    D = 1;

    #100 en = 1;
    #100 clear = 1;
    #100 preset = 1;
    #100 clear = 0;
    #100 preset = 0;
    #100 D = 0;
    #100 D = 1;
    #100 D = 0;

    #100 $finish;
  end

  initial begin
    $monitor("Time(ns): %0d | clear: %b | preset: %b | en: %b | D: %b | Q: %b", $time, clear,
             preset, en, D, Q);
  end

endmodule
