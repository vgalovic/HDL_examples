`timescale 1ns / 1ps

module counter_up_16bit_overflow_tb ();

  reg clk;
  reg ce;
  reg en;
  reg load;
  wire overflow;
  reg [15:0] counter_value;
  reg [15:0] overflow_value;
  wire [15:0] q;

  counter_up_16bit_overflow dut (
      .clk(clk),
      .ce(ce),
      .en(en),
      .load(load),
      .overflow(overflow),
      .counter_value(counter_value),
      .overflow_value(overflow_value),
      .q(q)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    load = 0;
    ce = 0;
    en = 0;
    counter_value = 16'h5;
    overflow_value = 16'ha;
    #100 ce = 1;
    #100 en = 1;
    #200 load = 1;
    #100 load = 0;
    #500 $finish;
  end

  initial begin
    $monitor(
        "Time(ns): %0d | clk: %b | load: %b | ce: %b | en: %b | counter_value: %b | overflow_value: %b | q: %b | overflow: %b",
        $time, clk, load, ce, en, counter_value, overflow_value, q, overflow);
  end
endmodule
