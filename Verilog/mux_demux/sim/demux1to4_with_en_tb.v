`timescale 1ns / 1ps

module demux1to4_with_en_tb ();
  reg x;
  reg en;
  reg [1:0] sel;

  wire y0;
  wire y1;
  wire y2;
  wire y3;

  demux1to4_with_en dut (
      .x  (x),
      .en (en),
      .sel(sel),
      .y0 (y0),
      .y1 (y1),
      .y2 (y2),
      .y3 (y3)
  );

  initial begin
    x   = 0;
    en  = 0;
    sel = 2'b00;

    #100;
    x = 1;

    #100;
    en = 1;

    #100;
    sel = 2'b01;

    #100;
    sel = 2'b10;

    #100;
    sel = 2'b11;

    #100;
    x = 0;

    #100;

    $finish;
  end

endmodule
