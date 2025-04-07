`timescale 1ns / 1ps

module top #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst,

    input wire start,

    input wire [WIDTH-1:0] a_in,
    input wire [WIDTH-1:0] b_in,

    output wire last,
    output wire ready,

    output wire [WIDTH-1:0] quotient,
    output wire [WIDTH-1:0] remainder
);

  wire [WIDTH-1:0] n_n;
  wire [1:0] sel;

  control_path #(
      .WIDTH(WIDTH)
  ) control_path_0 (
      .clk(clk),
      .rst(rst),

      .start(start),

      .n_n(n_n),

      .last (last),
      .ready(ready),

      .sel(sel)
  );

  data_path #(
      .WIDTH(WIDTH)
  ) data_path_0 (
      .clk(clk),
      .rst(rst),

      .a_in(a_in),
      .b_in(b_in),

      .sel(sel),

      .n_n(n_n),

      .quotient (quotient),
      .remainder(remainder)
  );

endmodule
