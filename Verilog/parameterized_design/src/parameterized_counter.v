`timescale 1ns / 1ps

module parameterized_counter #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire reset,
    output reg [WIDTH-1:0] q
);

  always @(posedge clk) begin
    if (reset) q <= {WIDTH{1'b0}};
    else q <= q + 1;
  end

endmodule
