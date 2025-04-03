`timescale 1ns / 1ps

module reg_file_128x32_read_first_with_wclk_and_rclk_tb ();

  parameter DATA_WIDTH = 32;
  parameter ADDR_WIDTH = 7;
  parameter MEM_CAPACITY = 128;

  parameter CLK_PERIOD = 100;

  reg wclk;
  reg rclk;
  reg reset;
  reg ce;
  reg en;
  reg [ADDR_WIDTH-1:0] address;
  reg [DATA_WIDTH-1:0] wdata;
  wire [DATA_WIDTH-1:0] rdata;

  reg_file_128x32_read_first_with_wclk_and_rclk #(
      .DATA_WIDTH  (DATA_WIDTH),
      .ADDR_WIDTH  (ADDR_WIDTH),
      .MEM_CAPACITY(MEM_CAPACITY)
  ) dut (
      .wclk   (wclk),
      .rclk   (rclk),
      .reset  (reset),
      .ce     (ce),
      .en     (en),
      .address(address),
      .wdata  (wdata),
      .rdata  (rdata)
  );

  initial wclk = 0;
  always #(CLK_PERIOD / 2) wclk = ~wclk;

  initial rclk = 0;
  always #(CLK_PERIOD / 2) rclk = ~rclk;

  initial begin
    reset = 1;
    ce = 0;
    en = 0;
    address = 5;
    wdata = 88;

    #CLK_PERIOD reset = 0;
    address = 25;
    wdata   = 128;

    #CLK_PERIOD ce = 1;
    address = 3;
    wdata   = 64;

    #CLK_PERIOD en = 1;
    address = 35;
    wdata   = 255;

    #CLK_PERIOD address = 25;
    wdata = 16;
    #CLK_PERIOD address = 3;
    wdata = 42;
    #CLK_PERIOD address = 5;
    wdata = 228;
    #CLK_PERIOD address = 35;
    wdata = 186;
    #CLK_PERIOD address = 48;
    wdata = 152;
    #CLK_PERIOD address = 52;
    wdata = 100;

    #CLK_PERIOD en = 0;

    #CLK_PERIOD address = 25;
    #CLK_PERIOD address = 3;
    #CLK_PERIOD address = 5;
    #CLK_PERIOD address = 35;
    #CLK_PERIOD address = 48;
    #CLK_PERIOD address = 52;

    #CLK_PERIOD en = 1;
    #CLK_PERIOD address = 61;
    wdata = 246;
    #CLK_PERIOD address = 10;
    wdata = 123;

    #CLK_PERIOD $finish;
  end

  initial begin
    $monitor(
        "Time(ns): %0d |wclk: %b | rclk: %b | reset: %b | ce: %b | en: %b | address: %d | wdata: %d | rdata %d",
        $time, wclk, rclk, reset, ce, en, address, wdata, rdata);
  end

endmodule
