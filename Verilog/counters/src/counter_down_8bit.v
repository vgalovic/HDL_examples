`timescale 1ns / 1ps

module counter_down_8bit (
    input wire clk,
    input wire load,
    input wire ce,
    input wire en,
    input wire [7:0] counter_value,
    output reg [7:0] q
);

  initial q = {8{1'b1}};

  always @(posedge clk) begin
    if (ce) begin
      if (load) q <= counter_value;
      else if (en) q <= q - 1;
    end
  end

endmodule
