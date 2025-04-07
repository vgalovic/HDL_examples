`timescale 1ns / 1ps

module top #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire start,
    input wire reset,

    input wire [WIDTH-1:0] a_in,
    input wire [WIDTH-1:0] b_in,

    output wire ready,

    output wire [2*WIDTH-1:0] r_out
);

  wire [1:0] sel;
  wire count_0;
  wire b_0;

  control_path control_path_0 (
      .clk(clk),

      .count_0(count_0),
      .b_0(b_0),

      .start(start),
      .reset(reset),

      .sel(sel),

      .ready(ready)
  );

  data_path #(
      .WIDTH(WIDTH)
  ) data_path_0 (
      .clk(clk),
      .sel(sel),

      .a_in(a_in),
      .b_in(b_in),

      .r_out(r_out),

      .b_0(b_0),
      .count_0(count_0)
  );

endmodule
