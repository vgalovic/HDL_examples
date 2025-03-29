`timescale 1ns / 1ps

module full_adder (
    input  wire A,
    input  wire B,
    input  wire Cin,
    output wire S,
    output wire Cout
);

  wire x0, a0, a1;

  xor_cir xor0 (
      .a(A),
      .b(B),
      .f(x0)
  );

  xor_cir xor1 (
      .a(x0),
      .b(Cin),
      .f(S)
  );

  and_cir and0 (
      .a(Cin),
      .b(x0),
      .f(a0)
  );

  and_cir and1 (
      .a(B),
      .b(A),
      .f(a1)
  );

  assign Cout = a0 ^ a1;

endmodule
