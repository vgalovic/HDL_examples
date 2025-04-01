`timescale 1ns / 1ps

module d_latch_tb ();
  reg  d;
  reg  g;
  wire q;

  d_latch dut (
      .d(d),
      .g(g),
      .q(q)
  );

  initial begin
    $display("Simulation start\n");
    $display(" time(ns), d, g, q ");
    $monitor(" %0d,  %b,  %b,  %b ", $time, d, g, q);

    d = 0;
    g = 0;

    #100 g = 1;
    #100 d = 1;
    #100 d = 0;
    #100 d = 1;
    #100 g = 0;

    #100 $display("\nSimulation end");
    $finish;

  end

endmodule
