`timescale 1ns / 1ps

module SIPO_sync_4bit_register_with_ce_we (
    input wire clk,
    input wire ce,
    input wire we,
    input wire set,
    input wire reset,
    input wire d,
    output reg [3:0] q
);

  always @(posedge clk) begin
    if (reset) q <= 4'b0;
    else if (set) q <= {4{1'b1}};
    else if (ce && we)
      q <= {q[2:0], d};  // Shift left, serial input `d` goes to LSB  (more common in SIPO)
    // else if (ce && we) q <= {d, q[3:1]}; // Shift right, serial input `d` goes to MSB
  end

endmodule
