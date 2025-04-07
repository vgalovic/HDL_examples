`timescale 1ns / 1ps

module tree_digit_decimal_counter (
    input wire clk,
    input wire reset,

    output wire [3:0] q0,
    output wire [3:0] q1,
    output wire [3:0] q2
);

  wire pulse0, pulse1, pulse2;

  dec_counter dc0 (
      .clk(clk),
      .reset(reset),
      .en(1'b1),
      .q(q0),
      .pulse(pulse0)
  );

  dec_counter dc1 (
      .clk(clk),
      .reset(reset),
      .en(pulse0),
      .q(q1),
      .pulse(pulse1)
  );

  dec_counter dc2 (
      .clk(clk),
      .reset(reset),
      .en(pulse0 && pulse1),
      .q(q2),
      .pulse()
  );

endmodule
