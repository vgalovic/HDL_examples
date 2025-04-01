`timescale 1ns / 1ps

module D_flip_flop_synchro_en (
    input  wire clk,
    input  wire reset,
    input  wire set,
    input  wire en,
    input  wire D,
    output reg  Q
);

  always @(posedge clk) begin
    if (reset) Q <= 0;
    else if (set) Q <= 1;
    else if (en) Q <= D;
  end

endmodule
