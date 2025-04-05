`timescale 1ns / 1ps

module mod_counter_up_with_range_13_to_89_tb ();

  reg clk;
  reg en;
  reg load;
  reg reset;
  reg [6:0] counter_value;
  wire [6:0] q;
  wire overflow;

  mod_counter_up_with_range_13_to_89 dut (
      .clk(clk),
      .en(en),
      .load(load),
      .reset(reset),
      .counter_value(counter_value),
      .q(q),
      .overflow(overflow)
  );

  initial clk = 0;
  always #25 clk = ~clk;

  initial begin
    load = 0;
    en = 0;
    reset = 0;

    counter_value = 7'h5f;

    #50 en = 1;
    #50 load = 1;
    #50 load = 0;
    #50 reset = 1;
    #50 reset = 0;
    counter_value = 7'h5;
    #50 load = 1;
    #50 load = 0;
    counter_value = 7'h55;
    #50 load = 1;
    #50 load = 0;

    #300 $finish;
  end

  initial begin
    $monitor(
        "Time(ns): %0d | clk: %b | load: %b | en: %b | reset: %b | counter_value: %b | q: %b | overflow: %b",
        $time, clk, load, en, reset, counter_value, q, overflow);
  end
endmodule
