`timescale 1ns / 1ps

module test_bench ();

  localparam WIDTH = 8, CLK_PERIOD = 100;

  reg clk, start, reset;
  reg [WIDTH-1:0] a_in, b_in;
  wire ready;
  wire [2*WIDTH-1:0] r_out;

  top #(
      .WIDTH(WIDTH)
  ) dut (
      .a_in(a_in),
      .b_in(b_in),

      .clk  (clk),
      .start(start),
      .reset(reset),

      .ready(ready),

      .r_out(r_out)
  );

  initial clk = 1'b0;
  always #(CLK_PERIOD / 2) clk = ~clk;

  initial begin
    // Initialize inputs
    a_in  = 8'h05;
    b_in  = 8'h06;

    reset = 1'b1;
    start = 1'b0;

    #(CLK_PERIOD * 2);
    reset = 1'b0;

    #(CLK_PERIOD);
    start = 1'b1;
    #(CLK_PERIOD * 4);
    start = 1'b0;

    #(CLK_PERIOD * 20);
    $finish;
  end

  initial begin
    $monitor("Time(ns)= %4d, clk = %b, a_in = %3d, b_in = %3d, ready = %b, r_out = %5d", $time,
             clk, a_in, b_in, ready, r_out);
  end

endmodule
