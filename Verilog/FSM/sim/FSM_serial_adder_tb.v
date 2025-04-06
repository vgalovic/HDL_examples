`timescale 1ns / 1ps

module FSM_serial_adder_tb ();

  reg  clk;
  reg  reset;
  reg  a;
  reg  b;
  wire s;

  FSM_serial_adder dut (
      .clk(clk),
      .reset(reset),
      .a(a),
      .b(b),
      .s(s)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    reset = 0;
    a = 0;
    b = 0;

    #100 a = 1;
    #100 b = 1;
    #100 a = 0;
    #100 b = 0;

    #100 reset = 1;
    #100 reset = 0;

    #100 a = 1;
    #100 b = 0;
    #100 a = 0;
    #100 b = 1;

    #100 $finish;
  end

  initial begin
    $monitor("Time(ns): %4d | clk: %b | reset: %b | a: %b | b: %b | s: %b", $time, clk, reset, a,
             b, s);
  end

endmodule
