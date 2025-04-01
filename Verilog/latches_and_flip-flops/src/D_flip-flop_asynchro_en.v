`timescale 1ns / 1ps

module D_flip_flop_asynchro_en (
    input  wire clk,
    input  wire clear,
    input  wire preset,
    input  wire en,
    input  wire D,
    output reg  Q
);

  always @(posedge clk or posedge clear or posedge preset) begin
    if (clear) Q <= 0;
    else if (preset) Q <= 1;
    else if (en) Q <= D;
  end

endmodule
