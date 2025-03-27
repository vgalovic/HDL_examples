`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Vladimir Galović
//
// Create Date: 03/27/2025 04:00:09 PM
// Design Name:
// Module Name: half_adder
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module half_adder (
    input  wire a,  // Input A
    input  wire b,  // Input B
    output wire s,  // Sum output
    output wire c   // Carry output
);


  // Declare wires for the intermediate results
  wire and_out;  // Output of AND gate
  wire xor_out;  // Output of XOR gate

  // Instantiate AND gate (from and_cir.v)
  and_cir and0 (
      .a(a),
      .b(b),
      .f(and_out)
  );

  // Instantiate XOR gate (from xor_cir.v)
  xor_cir xor0 (
      .a(a),
      .b(b),
      .f(xor_out)
  );

  // Assign the outputs to the half-adder's sum and carry
  assign c = and_out;  // Carry is the AND output
  assign s = xor_out;  // Sum is the XOR output

endmodule
