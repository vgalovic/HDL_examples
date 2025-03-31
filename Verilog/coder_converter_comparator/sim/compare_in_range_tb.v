`timescale 1ns / 1ps

module compare_in_range_tb ();
  reg [3:0] a;
  wire in_range;

  compare_in_range dut (
      .a(a),
      .in_range(in_range)
  );

  initial begin
    $display("Simulation start\n");
    $display(" time(ns), a, in_range ");
    $monitor(" %0d,  %b,  %b ", $time, a, in_range);

    a = 4'h1;

    #100;
    a = 4'h3;

    #100;
    a = 4'h5;

    #100;
    a = 4'h7;

    #100;
    a = 4'h9;

    #100;

    $display("\nSimulation end");
    $finish;
  end
endmodule
