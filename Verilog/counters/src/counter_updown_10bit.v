`timescale 1ns / 1ps

module counter_updown_10bit (
    input wire clk,
    input wire ce,
    input wire en,
    input wire load,
    input wire updown,
    input wire [9:0] counter_value,
    output reg [9:0] q,
    output reg overflow

);

  initial q = 10'b0;

  always @(posedge clk) begin
    if (ce) begin
      if (load) q <= counter_value;
      else if (en) begin
        if (updown) q <= q - 1;
        else q <= q + 1;
      end
    end
  end

  always @(*) begin
    if (updown) overflow = (q == 10'b0);
    else overflow = (q == {10{1'b1}});
  end

endmodule
