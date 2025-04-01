`timescale 1ns / 1ps

module SR_flip_flop_with_falling_edge (
    input  wire clk,
    input  wire R,
    input  wire S,
    output reg  Q
);

  always @(negedge clk) begin
    if (S == 1'b0 && R == 1'b0) Q <= Q;  // Hold state (retain Q)
    else if (S == 1'b1 && R == 1'b0) Q <= 1'b1;  // Set state (Q = 1)
    else if (S == 1'b0 && R == 1'b1) Q <= 1'b0;  // Reset state (Q = 0)
    else if (S == 1'b1 && R == 1'b1) Q <= 1'bX;  // Invalid state (Q = X), Unknown
  end

endmodule

