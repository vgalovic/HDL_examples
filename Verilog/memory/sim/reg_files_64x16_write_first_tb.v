`timescale 1ns / 1ps

module reg_files_64x16_write_first_tb ();

  parameter DATA_WIDTH = 16;
  parameter ADDR_WIDTH = 6;
  parameter MEM_CAPACITY = 64;

  parameter CLK_PERIOD = 100;

  reg clk;
  reg reset;
  reg ce;
  reg en;
  reg [ADDR_WIDTH-1:0] address;
  reg [DATA_WIDTH-1:0] wdata;
  wire [DATA_WIDTH-1:0] rdata;

  reg_files_64x16_write_first #(
      .DATA_WIDTH  (DATA_WIDTH),
      .ADDR_WIDTH  (ADDR_WIDTH),
      .MEM_CAPACITY(MEM_CAPACITY)
  ) dut (
      .clk    (clk),
      .reset  (reset),
      .ce     (ce),
      .en     (en),
      .address(address),
      .wdata  (wdata),
      .rdata  (rdata)
  );

  initial clk = 0;
  always #(CLK_PERIOD / 2) clk = ~clk;

  initial begin
    reset = 1;
    ce = 0;
    en = 0;
    address = 0;
    wdata = 0;

    #CLK_PERIOD reset = 0;
    #CLK_PERIOD ce = 1;
    #CLK_PERIOD en = 1;

    #CLK_PERIOD address = 25;
    #CLK_PERIOD wdata = 16;
    #CLK_PERIOD address = 3;
    #CLK_PERIOD wdata = 42;
    #CLK_PERIOD address = 5;
    #CLK_PERIOD wdata = 228;
    #CLK_PERIOD address = 35;
    #CLK_PERIOD wdata = 186;
    #CLK_PERIOD address = 48;
    #CLK_PERIOD wdata = 152;
    #CLK_PERIOD address = 52;

    #CLK_PERIOD en = 0;

    #CLK_PERIOD wdata = 58;
    #CLK_PERIOD address = 61;
    #CLK_PERIOD wdata = 246;

    #CLK_PERIOD $finish;
  end

  initial begin
    $monitor(
        "Time(ns): %0d |clk: %b | reset: %b | ce: %b | en: %b | address: %d | wdata: %d | rdata %d",
        $time, clk, reset, ce, en, address, wdata, rdata);
  end

endmodule
