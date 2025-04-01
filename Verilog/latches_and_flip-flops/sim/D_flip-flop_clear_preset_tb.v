`timescale 1ns / 1ps

module D_flip_flop_clear_preset_tb ();

  reg  clk;
  reg  clear;
  reg  preset;
  reg  D;
  wire Q;

  D_flip_flop_clear_preset uut (
      .clk   (clk),
      .clear (clear),
      .preset(preset),
      .D     (D),
      .Q     (Q)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    clear = 0;
    preset = 0;
    D = 1;

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
    $monitor("Time(ns): %0d | clear: %b | preset: %b | D: %b | Q: %b", $time, clear, preset, D, Q);
  end

endmodule
