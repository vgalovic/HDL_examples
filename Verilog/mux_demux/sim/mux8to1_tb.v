`timescale 1ns / 1ps

module mux8to1_tb ();

  reg x0, x1, x2, x3, x4, x5, x6, x7;
  reg [2:0] sel;
  wire y;

  mux8to1 dut (
      .x0 (x0),
      .x1 (x1),
      .x2 (x2),
      .x3 (x3),
      .x4 (x4),
      .x5 (x5),
      .x6 (x6),
      .x7 (x7),
      .sel(sel),
      .y  (y)
  );

  initial begin
    x0  = 1;
    x1  = 0;
    x2  = 0;
    x3  = 0;
    x4  = 0;
    x5  = 0;
    x6  = 0;
    x7  = 0;
    sel = 3'b000;

    #50;
    x0  = 0;
    x1  = 1;
    sel = 3'b001;

    #50;
    x1  = 0;
    x2  = 1;
    sel = 3'b010;

    #50;
    x2  = 0;
    x3  = 1;
    sel = 3'b011;

    #50;
    x3  = 0;
    x4  = 1;
    sel = 3'b100;

    #50;
    x4  = 0;
    x5  = 1;
    sel = 3'b101;

    #50;
    x5  = 0;
    x6  = 1;
    sel = 3'b110;

    #50;
    x6  = 0;
    x7  = 1;
    sel = 3'b111;

    #50;
    x7 = 0;
    #50;

    $finish;
  end

endmodule
