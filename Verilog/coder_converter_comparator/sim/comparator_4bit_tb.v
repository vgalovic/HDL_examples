`timescale 1ns / 1ps

module comparator_4bit_tb ();
  reg [3:0] a;
  reg [3:0] b;
  wire eq;
  wire gt;
  wire lt;

  comparator_4bit dut (
      .a (a),
      .b (b),
      .eq(eq),
      .gt(gt),
      .lt(lt)
  );

  initial begin
    $display("Simulation start\n");
    $display(" time(ns), a, b, lt, eq, gt ");
    $monitor(" %0d,  %b,  %b,  %b,  %b,  %b ", $time, a, b, lt, eq, gt);

    a = 4'b0010;
    b = 4'b0010;

    #100;
    b = 4'b0110;

    #100;
    a = 4'b1100;

    #100;

    $display("\nSimulation end");
    $finish;
  end
endmodule
