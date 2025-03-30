`timescale 1ns / 1ps

module mux2to1_with_logic_gates (
    input  wire x0,
    input  wire x1,
    input  wire sel,
    output wire y
);

  wire and0, and1;

  assign and0 = x0 & ~sel;
  assign and1 = x1 & sel;

  assign y = and0 | and1;
endmodule
