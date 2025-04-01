`timescale 1ns / 1ps

module D_flip_flop_set_reset (
    input  wire clk,
    input  wire set,
    input  wire reset,
    input  wire D,
    output reg  Q
);

  always @(posedge clk) begin
    if (reset) Q <= 0;
    else if (set) Q <= 1;
    else Q <= D;
  end

endmodule
