`timescale 1ns / 1ps

module register_file_with_async_reading_tb ();


  // Parameters for the register file
  parameter M = 32;  // Number of registers
  parameter WIDTH = 8;  // Bit width of each register
  parameter ADDR_WIDTH = 5;  // Address width (log2(M))

  // Inputs to the register file
  reg clk;
  reg reset;

  reg ce;
  reg en;

  reg [ADDR_WIDTH-1:0] waddress1;
  reg [WIDTH-1:0] wdata1;

  reg [ADDR_WIDTH-1:0] waddress2;
  reg [WIDTH-1:0] wdata2;

  reg [1:0] we;

  reg [ADDR_WIDTH-1:0] raddress1;
  wire [WIDTH-1:0] rdata1;

  reg [ADDR_WIDTH-1:0] raddress2;
  wire [WIDTH-1:0] rdata2;

  // Instantiate the register file module
  register_file_with_async_reading #(
      .M(M),
      .WIDTH(WIDTH),
      .ADDR_WIDTH(ADDR_WIDTH)
  ) dut (
      .clk(clk),
      .reset(reset),
      .ce(ce),
      .en(en),
      .waddress1(waddress1),
      .wdata1(wdata1),
      .waddress2(waddress2),
      .wdata2(wdata2),
      .we(we),
      .raddress1(raddress1),
      .rdata1(rdata1),
      .raddress2(raddress2),
      .rdata2(rdata2)
  );

  initial clk = 0;
  always #25 clk = ~clk;

  initial begin
    reset = 1;
    ce = 0;
    en = 0;
    we = 2'b00;
    waddress1 = 0;
    wdata1 = 8'h00;
    waddress2 = 1;
    wdata2 = 8'h00;
    raddress1 = 0;
    raddress2 = 1;

    #50 reset = 0;  // Deassert reset

    // TEST: write with ce=0, en=1 (should NOT write)
    ce = 0;
    en = 1;
    we = 2'b01;
    waddress1 = 5;
    wdata1 = 8'hAA;
    #50;

    // TEST: write with ce=1, en=0 (should NOT write)
    ce = 1;
    en = 0;
    we = 2'b01;
    waddress1 = 5;
    wdata1 = 8'hBB;
    #50;

    // TEST: valid write with ce=1, en=1, we=2'b01
    ce = 1;
    en = 1;
    we = 2'b01;
    waddress1 = 5;
    wdata1 = 8'hCC;
    #50;

    // TEST: valid write with ce=1, en=1, we=2'b10
    ce = 1;
    en = 1;
    we = 2'b10;
    waddress2 = 6;
    wdata2 = 8'hDD;
    #50;

    // TEST: simultaneous write to both addresses with we=2'b11
    ce = 1;
    en = 1;
    we = 2'b11;
    waddress1 = 7;
    wdata1 = 8'hEE;
    waddress2 = 8;
    wdata2 = 8'hFF;
    #50;

    // Read back values
    raddress1 = 5;
    raddress2 = 6;
    #50;
    raddress1 = 7;
    raddress2 = 8;
    #50;

    $finish;
  end

  initial begin
    $monitor(
        "Time(ns): %0d | clk: %b | reset: %b | ce: %b | en: %b | we: %b | wadddress1: %b | wdata1: %b | waddress2: %b |wdata2: %b | raddress1: %b | rdata1: %b | raddress2: %b | rdata2: %b",
        $time, clk, reset, ce, en, we, waddress1, wdata1, waddress2, wdata2, raddress1, rdata1,
        raddress2, rdata2);
  end

endmodule
