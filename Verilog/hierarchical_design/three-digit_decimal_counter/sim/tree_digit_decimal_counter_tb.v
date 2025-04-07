`timescale 1ns / 1ps

module tree_digit_decimal_counter_tb ();

  reg clk, reset;
  wire [3:0] q0, q1, q2;

  tree_digit_decimal_counter dut (
      .clk(clk),
      .reset(reset),
      .q0(q0),
      .q1(q1),
      .q2(q2)
  );

  initial clk = 1'b0;
  always #50 clk = ~clk;

  initial begin
    reset = 1'b1;
    #100 reset = 1'b0;

    #400 reset = 1'b1;
    #100 reset = 1'b0;

    #100 $finish;
  end

endmodule
