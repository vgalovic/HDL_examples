`timescale 1ns / 1ps

module bin_encoder4to2_with_logic_gates (
    input  wire [3:0] x,
    output wire [1:0] y
);

  assign y[0] = x[1] | x[3];
  assign y[1] = x[2] | x[3];

endmodule
