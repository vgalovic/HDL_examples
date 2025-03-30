`timescale 1ns / 1ps

module mux4to1_internal (
    input wire x0,
    input wire x1,
    input wire x2,
    input wire x3,
    input wire [1:0] sel,
    output reg y
);

  always @(*) begin
    case (sel)
      2'b00:   y = x0;
      2'b01:   y = x1;
      2'b10:   y = x2;
      2'b11:   y = x3;
      default: ;
    endcase
  end

endmodule

module mux8to1 (
    input wire x0,
    input wire x1,
    input wire x2,
    input wire x3,
    input wire x4,
    input wire x5,
    input wire x6,
    input wire x7,
    input wire [2:0] sel,
    output reg y
);

  wire y0, y1;

  mux4to1_internal mux4to1_0 (
      .x0 (x0),
      .x1 (x1),
      .x2 (x2),
      .x3 (x3),
      .sel(sel[1:0]),
      .y  (y0)
  );

  mux4to1_internal mux4to1_1 (
      .x0 (x4),
      .x1 (x5),
      .x2 (x6),
      .x3 (x7),
      .sel(sel[1:0]),
      .y  (y1)
  );

  always @(*) begin
    case (sel[2])
      1'b0: y = y0;
      1'b1: y = y1;
      default: ;
    endcase
  end

endmodule
