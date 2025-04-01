`timescale 1ns / 1ps

module D_flip_flop_set_reset_tb ();

  reg  clk;
  reg  set;
  reg  reset;
  reg  D;
  wire Q;

  D_flip_flop_set_reset uut (
      .clk  (clk),
      .set  (set),
      .reset(reset),
      .D    (D),
      .Q    (Q)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    set = 0;
    reset = 0;
    D = 1;

    #100 set = 1;
    #100 reset = 1;
    #100 set = 0;
    #100 reset = 0;
    #100 D = 0;
    #100 D = 1;
    #100 D = 0;

    #100 $finish;
  end

  initial begin
    $monitor("Time(ns): %0d | set: %b | reset: %b | D: %b | Q: %b", $time, set, reset, D, Q);
  end

endmodule
