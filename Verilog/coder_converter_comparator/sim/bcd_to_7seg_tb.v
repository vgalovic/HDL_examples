`timescale 1ns / 1ps

module bcd_to_7seg_tb ();

  reg  [3:0] bcd;
  wire [6:0] seg;

  bcd_to_7seg dut (
      .bcd(bcd),
      .seg(seg)
  );

  initial begin
    $display("Simulation start\n");
    $display(" time(ns), bcd, a, b, c, d, e, f, g ");
    $monitor(" %0d,  %b,  %b,  %b,  %b,  %b,  %b,  %b, %b ", $time, bcd, seg[0], seg[1], seg[2],
             seg[3], seg[4], seg[5], seg[6]);

    bcd = 4'b0000;

    #100;
    bcd = 4'b0001;

    #100;
    bcd = 4'b0010;

    #100;
    bcd = 4'b0011;

    #100;
    bcd = 4'b0100;

    #100;
    bcd = 4'b0101;

    #100;
    bcd = 4'b0110;

    #100;
    bcd = 4'b0111;

    #100;
    bcd = 4'b1000;

    #100;
    bcd = 4'b1001;

    #100;
    bcd = 4'b1010;

    #100;

    $display("\nSimulation end");
    $finish;
  end

endmodule
