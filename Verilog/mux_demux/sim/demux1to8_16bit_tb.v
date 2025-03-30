`timescale 1ns / 1ps

module demux1to8_16bit_tb ();
  reg  [15:0] x;
  reg  [ 2:0] sel;

  wire [15:0] y0;
  wire [15:0] y1;
  wire [15:0] y2;
  wire [15:0] y3;
  wire [15:0] y4;
  wire [15:0] y5;
  wire [15:0] y6;
  wire [15:0] y7;

  demux1to8_16bit dut (
      .x  (x),
      .sel(sel),
      .y0 (y0),
      .y1 (y1),
      .y2 (y2),
      .y3 (y3),
      .y4 (y4),
      .y5 (y5),
      .y6 (y6),
      .y7 (y7)
  );

  initial begin
    x   = 16'b0;
    sel = 3'b000;

    #100;
    x = 16'h0001;

    #100;
    sel = 3'b001;

    #100;
    sel = 3'b010;

    #100;
    sel = 3'b011;

    #100;
    sel = 3'b100;

    #100;
    sel = 3'b101;

    #100;
    sel = 3'b110;

    #100;
    sel = 3'b111;

    #100;
    x = 16'h0000;

    #100;

    $finish;
  end
endmodule
