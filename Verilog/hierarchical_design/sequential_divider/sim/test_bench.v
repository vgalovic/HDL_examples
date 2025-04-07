`timescale 1ns / 1ps

module test_bench ();

  localparam WIDTH = 8, CLK_PERIOD = 50;

  reg clk, rst, start;
  reg [WIDTH-1:0] a_in, b_in;
  wire [WIDTH-1:0] quotient, remainder;
  wire last, ready;

  top #(
      .WIDTH(WIDTH)
  ) dut (
      .clk(clk),
      .rst(rst),

      .start(start),

      .a_in(a_in),
      .b_in(b_in),

      .quotient (quotient),
      .remainder(remainder),

      .last (last),
      .ready(ready)
  );

  initial clk = 0;
  always #50 clk = ~clk;


  initial begin
    a_in  = 8'h09;
    b_in  = 8'h03;

    rst   = 0;
    start = 0;

    start = 1;
    #CLK_PERIOD;

    start = 0;
    #(CLK_PERIOD * 4);

    start = 1;
    #CLK_PERIOD;
    start = 0;

    rst   = 0;
    #(CLK_PERIOD * 2);
    rst = 1;
    #CLK_PERIOD;
    rst = 0;

    #CLK_PERIOD start = 1;
    #(CLK_PERIOD * 2) start = 0;

    #450 $finish;
  end

  initial begin
    $monitor(
        "Time(ns)= %4d, clk= %b, rst= %b, start= %b, a_in= %3d, b_in= %3d, last= %b, ready= %b, quotient= %3d, remainder= %3d",
        $time, clk, rst, start, a_in, b_in, last, ready, quotient, remainder);
  end

endmodule
