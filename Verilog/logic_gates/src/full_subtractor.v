`timescale 1ns / 1ps

module full_subtractor (
    input  wire A,    // Minuend
    input  wire B,    // Subtrahend
    input  wire Bin,  // Borrow-in
    output wire D,    // Difference
    output wire Bout  // Borrow-out
);

  wire x0, b0, b1;

  assign x0   = A ^ B;
  assign D    = x0 ^ Bin;

  assign b0   = ~A & B;
  assign b1   = ~x0 & Bin;

  assign Bout = b0 | b1;


endmodule
