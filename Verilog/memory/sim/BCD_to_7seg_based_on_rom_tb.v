`timescale 1ns / 1ps

module BCD_to_7seg_based_on_rom_tb ();

  parameter BCD_WIDTH = 4;
  parameter SEG_WIDTH = 7;
  parameter MEM_CAPACITY = 16;

  reg  [BCD_WIDTH-1:0] bcd;
  wire [SEG_WIDTH-1:0] seg;

  BCD_to_7seg_based_on_rom #(
      .BCD_WIDTH(BCD_WIDTH),
      .SEG_WIDTH(SEG_WIDTH),
      .MEM_CAPACITY(MEM_CAPACITY)
  ) dut (
      .bcd(bcd),
      .seg(seg)
  );

  integer i;
  initial begin
    for (i = 0; i < MEM_CAPACITY; i = i + 1) begin
      bcd = i;
      #50;
    end

    $finish;
  end

  initial begin
    $monitor("Time(ns): %0d | bcd = %b | seg = %b", $time, bcd, seg);
  end

endmodule
