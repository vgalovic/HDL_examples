`timescale 1ns / 1ps

module bin_encoder8to3_tb ();

  reg  [7:0] x;
  wire [2:0] y;

  bin_encoder8to3 dut (
      .x(x),
      .y(y)
  );

  initial begin
    $display("Simulation start\n");
    $display(" time(ns), x, y ");
    $monitor(" %0d,  %b,  %b ", $time, x, y);

    x = 8'b00000000;

    #100;
    x = 8'b00000001;

    #100;
    x = 8'b00000010;

    #100;
    x = 8'b00000100;

    #100;
    x = 8'b00001000;

    #100;
    x = 8'b00010000;

    #100;
    x = 8'b00100000;

    #100;
    x = 8'b01000000;

    #100;
    x = 8'b10000000;

    #100;
    x = 8'b11000100;

    #100;

    $display("\nSimulation finish");
    $finish;
  end
endmodule
