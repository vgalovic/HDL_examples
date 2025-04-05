`timescale 1ns / 1ps

module counter_up_8bit_tb ();
  reg clk;
  reg reset;
  reg ce;
  reg en;
  wire [7:0] q;

  counter_up_8bit dut (
      .clk(clk),
      .reset(reset),
      .ce(ce),
      .en(en),
      .q(q)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    reset = 0;
    ce = 0;
    en = 0;

    #100 ce = 1;
    #100 en = 1;
    #200 reset = 1;
    #100 reset = 0;

    #500 $finish;
  end

  initial begin
    $monitor("Time(ns): %0d | clk: %b | reset: %b | ce: %b | en: %b | q: %b", $time, clk, reset,
             ce, en, q);
  end

endmodule
