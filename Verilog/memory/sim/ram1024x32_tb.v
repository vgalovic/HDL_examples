`timescale 1ns / 1ps

module ram1024x32_tb ();

  parameter ADDR_WIDTH = 10;
  parameter DATA_WIDTH = 32;
  parameter CLK_PERIOD = 100;

  reg clk;
  reg [ADDR_WIDTH-1:0] address;
  reg [DATA_WIDTH-1:0] wdata;
  reg write;

  wire [DATA_WIDTH-1:0] rdata;

  ram1024x32 #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) dut (
      .clk(clk),
      .address(address),
      .wdata(wdata),
      .write(write),
      .rdata(rdata)
  );

  initial clk = 0;
  always #(CLK_PERIOD / 2) clk = ~clk;

  initial begin
    // Initialize inputs
    address = 0;
    wdata   = 0;
    write   = 1;

    // Write test data to memory
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

    // Stop writing
    #CLK_PERIOD write = 0;
    #CLK_PERIOD address = 52;  // Read operation

    #CLK_PERIOD $finish;
  end

  initial begin
    $monitor("Time(ns): %0d | clk: %b | address: %d | wdata: %d | rdata: %d", $time, clk, address,
             wdata, rdata);
  end

endmodule
