`timescale 1ns / 1ps

module comparator_8bit_tb ();
  reg [7:0] a;
  reg [7:0] b;
  wire neq;
  wire gte;
  wire lte;

  comparator_8bit dut (
      .a  (a),
      .b  (b),
      .neq(neq),
      .gte(gte),
      .lte(lte)
  );

  initial begin
    $display("Simulation start\n");
    $display(" time(ns), a, b, lte, neq, gte ");
    $monitor(" %0d,  %b,  %b,  %b,  %b,  %b ", $time, a, b, lte, neq, gte);

    a = 8'h9;
    b = 8'h9;

    #100;
    a = 8'h5;

    #100;
    b = 8'h2;

    #100;

    $display("\nSimulation end");
    $finish;
  end

endmodule
