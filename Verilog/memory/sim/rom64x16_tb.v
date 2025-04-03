`timescale 1ns / 1ps

module rom64x16_tb ();

  parameter ADDR_WIDTH = 6;
  parameter DATA_WIDTH = 16;
  parameter MEM_CAPACITY = 64;

  reg  [ADDR_WIDTH-1:0] addr;
  wire [DATA_WIDTH-1:0] rdata;

  rom64x16 #(
      .ADDR_WIDTH  (ADDR_WIDTH),
      .DATA_WIDTH  (DATA_WIDTH),
      .MEM_CAPACITY(MEM_CAPACITY)
  ) dut (
      .addr (addr),
      .rdata(rdata)
  );

  initial begin
    // Create a VCD (Value Change Dump) file to store simulation waveforms.
    // This file can be opened in waveform viewers like GTKWave or Vivado.
    $dumpfile("rom64x16_tb.vcd");

    // Dump all signals of the testbench module `rom64x16_tb` into the VCD file.
    // This records all changes in signal values during simulation.
    $dumpvars(0, rom64x16_tb);
  end

  integer i;

  initial begin
    for (i = 0; i < MEM_CAPACITY; i = i + 1) begin
      addr = i;
      #10;
    end

    $finish;
  end

  initial begin
    $monitor("Time(ns): %0d | addr = %b | data = %b", $time, addr, rdata);
  end

endmodule
