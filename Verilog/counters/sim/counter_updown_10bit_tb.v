`timescale 1ns / 1ps

module counter_updown_10bit_tb ();

  reg clk;
  reg ce;
  reg en;
  reg load;
  reg updown;
  reg [9:0] counter_value;
  wire [9:0] q;
  wire overflow;

  counter_updown_10bit dut (
      .clk(clk),
      .ce(ce),
      .en(en),
      .load(load),
      .updown(updown),
      .counter_value(counter_value),
      .q(q),
      .overflow(overflow)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    load = 0;
    ce = 0;
    en = 0;
    updown = 0;
    counter_value = 10'h5;
    #100 ce = 1;
    #100 en = 1;
    #200 load = 1;
    #100 load = 0;
    #100 updown = 1;

    #500 $finish;
  end

  initial begin
    $monitor(
        "Time(ns): %0d | clk: %b | load: %b | ce: %b | en: %b | updown: %b | counter_value: %b | q: %b | overflow: %b",
        $time, clk, load, ce, en, updown, counter_value, q, overflow);
  end
endmodule
