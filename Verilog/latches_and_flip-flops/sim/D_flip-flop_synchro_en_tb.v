`timescale 1ns / 1ps

module D_flip_flop_synchro_en_tb ();

  reg  clk;
  reg  reset;
  reg  set;
  reg  en;
  reg  D;
  wire Q;

  D_flip_flop_synchro_en uut (
      .clk  (clk),
      .reset(reset),
      .set  (set),
      .en   (en),
      .D    (D),
      .Q    (Q)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    reset = 0;
    set = 0;
    en = 0;
    D = 1;

    #100 en = 1;
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
    $monitor("Time(ns): %0d | reset: %b | set: %b | en: %b | D: %b | Q: %b", $time, reset, set, en,
             D, Q);
  end

endmodule
