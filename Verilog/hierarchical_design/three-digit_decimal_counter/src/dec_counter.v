`timescale 1ns / 1ps

module dec_counter (
    input wire clk,
    input wire reset,
    input wire en,

    output reg [3:0] q,
    output reg pulse
);

  always @(posedge clk) begin
    if (reset) begin
      q <= 4'b0;
      pulse <= 1'b0;
    end else if (en) begin
      if (q == 4'd8) pulse <= 1'b1;
      else pulse <= 1'b0;

      if (q == 4'd9) q <= 4'b0;
      else q <= q + 1;
    end
  end
endmodule
