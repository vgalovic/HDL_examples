`timescale 1ns / 1ps

module FSM_from_state_diagram_tb ();

  reg  clk;
  reg  C;
  wire Y;

  FSM_from_state_diagram dut (
      .clk(clk),
      .C  (C),
      .Y  (Y)
  );

  initial clk = 0;
  always #50 clk = ~clk;

  initial begin
    C = 0;

    #100 C = 1;
    #100 C = 0;
    #200 C = 1;
    #200 C = 0;
    #100 C = 1;

    #200 $finish;
  end

  initial begin
    $monitor("Time(ns): %4d | clk: %b | C: %b | Y: %b", $time, clk, C, Y);
  end
endmodule
