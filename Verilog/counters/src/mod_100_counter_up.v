`timescale 1ns / 1ps

module mod_100_counter_up #(
    parameter integer M = 100,
    parameter integer WIDTH = clog2(M)  // log2(M); log2(100) = 7
) (
    input wire clk,
    input wire reset,
    input wire ce,
    input wire en,
    output reg [WIDTH-1:0] q
);

  // Function to calculate ceil(log2(M))
  function automatic integer clog2;
    input integer value;
    integer i;
    begin
      clog2 = 0;
      for (i = value - 1; i > 0; i = i >> 1) clog2 = clog2 + 1;
    end
  endfunction

  initial q = {WIDTH{1'b0}};

  always @(posedge clk) begin
    if (reset) q <= {WIDTH{1'b0}};
    else if (ce && en) begin
      if (q == M - 1) q <= {WIDTH{1'b0}};
      else q <= q + 1;
    end
  end

endmodule
