`timescale 1ns / 1ps

module parameterized_pipo_register_tb ();

  reg clk;
  reg rst;

  reg [15:0] d_beh;
  reg [31:0] d_str;

  wire [15:0] q_beh;
  wire [31:0] q_str;

  parameterized_pipo_register #(
      .WIDTH_BEH(16),
      .WIDTH_STR(32)
  ) dut (
      .clk  (clk),
      .rst  (rst),
      .d_beh(d_beh),
      .d_str(d_str),
      .q_beh(q_beh),
      .q_str(q_str)
  );

  initial clk = 1'b0;
  always #50 clk = ~clk;

  initial begin
    rst   = 1'b1;
    d_beh = 16'h0000;
    d_str = 32'h00000000;

    #100 rst = 1'b0;

    d_beh = 16'h0019;
    d_str = 32'h00000191;

    #100 d_beh = 16'h0025;
    d_str = 32'h00000250;

    #100 d_beh = 16'h0039;
    d_str = 32'h00000390;

    #100 d_beh = 16'h0050;
    d_str = 32'h00000500;

    #100 $finish;
  end

  initial begin
    $monitor("Time(ns): %4d, clk: %b, rst: %b, d_beh: %3d, d_str: %3d, q_beh: %3d, q_str: %3d",
             $time, clk, rst, d_beh, d_str, q_beh, q_str);
  end
endmodule
