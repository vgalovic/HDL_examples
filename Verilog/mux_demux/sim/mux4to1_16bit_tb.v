`timescale 1ns / 1ps

module mux4to1_16bit_tb ();

  reg  [15:0] x0;
  reg  [15:0] x1;
  reg  [15:0] x2;
  reg  [15:0] x3;
  reg  [ 1:0] sel;

  wire [15:0] y;

  mux4to1_16bit dut (
      .x0 (x0),
      .x1 (x1),
      .x2 (x2),
      .x3 (x3),
      .sel(sel),
      .y  (y)
  );

  initial begin

    x0  = 16'h1234;
    x1  = 16'h5678;
    x2  = 16'h9abc;
    x3  = 16'hdef0;

    sel = 2'b00;
    #100;
    sel = 2'b01;
    #100;
    sel = 2'b10;
    #100;
    sel = 2'b11;
    #100;

    $finish;
  end

endmodule
