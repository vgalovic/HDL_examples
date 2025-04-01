`timescale 1ns / 1ps

module D_flip_flop_clear_preset (
    input  wire clk,
    input  wire clear,
    input  wire preset,
    input  wire D,
    output reg  Q
);

  always @(posedge clk or posedge clear or posedge preset) begin
    if (clear) Q <= 0;
    else if (preset) Q <= 1;
    else Q <= D;
  end

endmodule
