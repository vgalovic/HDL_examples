`timescale 1ns / 1ps

module mod_100_counter_down_tb ();

  reg clk;
  reg load;
  reg ce;
  reg en;
  reg [6:0] counter_value;
  wire [6:0] q;

  mod_100_counter_down dut (
      .clk(clk),
      .load(load),
      .ce(ce),
      .en(en),
      .counter_value(counter_value),
      .q(q)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    load = 0;
    ce = 0;
    en = 0;
    counter_value = 7'h5;

    #100 ce = 1;
    #100 en = 1;
    #200 load = 1;
    #100 load = 0;

    #500 $finish;
  end

  initial begin
    $monitor("Time(ns): %0d | clk: %b | load: %b | ce: %b | en: %b | counter_value: %b | q: %b",
             $time, clk, load, ce, en, counter_value, q);
  end

endmodule
