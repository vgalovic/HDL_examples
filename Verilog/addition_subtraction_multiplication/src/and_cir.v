`timescale 1ns / 1ps

module and_cir (
    input  wire a,  // Input a
    input  wire b,  // Input b
    output wire f   // Output y
);

  assign f = a & b;

endmodule
