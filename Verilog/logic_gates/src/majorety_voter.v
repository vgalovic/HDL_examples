`timescale 1ns / 1ps

module majorety_voter (
    input  x,
    input  y,
    input  z,
    output v
);

  wire a0, a1, a2;

  assign a0 = ~(x & y);
  assign a1 = ~(y & z);
  assign a2 = ~(x & z);

  assign v  = ~(a0 & a1 & a2);

endmodule
