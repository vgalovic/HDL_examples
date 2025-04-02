`timescale 1ns / 1ps

module PIPO_sync_4bit_register_with_ce_we (
    input wire clk,
    input wire ce,
    input wire we,
    input wire set,
    input wire reset,
    input wire [3:0] d,
    output reg [3:0] q
);

  always @(posedge clk) begin
    if (reset) q <= 4'b0;
    else if (set) q <= {4{1'b1}};
    else if (ce && we) q <= d;
  end

endmodule
