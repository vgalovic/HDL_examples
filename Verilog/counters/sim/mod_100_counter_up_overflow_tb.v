`timescale 1ns / 1ps

module mod_100_counter_up_overflow_tb ();

  reg clk;
  reg en;
  reg load;
  reg [6:0] counter_value;
  wire [6:0] q;
  wire overflow;

  mod_100_counter_up_overflow dut (
      .clk(clk),
      .en(en),
      .load(load),
      .counter_value(counter_value),
      .q(q),
      .overflow(overflow)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    load = 0;
    en = 0;

    counter_value = 7'h5f;

    #100 en = 1;
    #200 load = 1;
    #100 load = 0;
    #500 $finish;
  end

  initial begin
    $monitor(
        "Time(ns): %0d | clk: %b | load: %b | en: %b | counter_value: %b | q: %b | overflow: %b",
        $time, clk, load, en, counter_value, q, overflow);
  end

endmodule
