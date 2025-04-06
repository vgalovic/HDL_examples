`timescale 1ns / 1ps

module parameterized_demultiplexer_tb ();

  parameter WIDTH = 8;

  reg  [7:0] x;
  reg  [1:0] sel;
  wire [7:0] y0;
  wire [7:0] y1;
  wire [7:0] y2;
  wire [7:0] y3;

  parameterized_demultiplexer #(
      .WIDTH(WIDTH)
  ) dut (
      .x  (x),
      .sel(sel),
      .y0 (y0),
      .y1 (y1),
      .y2 (y2),
      .y3 (y3)
  );

  initial begin
    x   = 8'h08;
    sel = 2'b00;

    #100 x = 8'h19;
    sel = 2'b01;

    #100 x = 8'h25;
    sel = 2'b10;

    #100 x = 8'h39;
    sel = 2'b11;

    #100 $finish;
  end

  initial begin
    $monitor("Time(ns): %4d, x: %3d, sel: %1d, y0: %3d, y1: %3d, y2: %3d, y3: %3d", $time, x, sel,
             y0, y1, y2, y3);
  end

endmodule
