`timescale 1ns / 1ps

module priority_encoder8to3_tb ();

  reg  [7:0] x;
  wire [2:0] y;
  wire       z;

  priority_encoder8to3 dut (
      .x(x),
      .y(y),
      .z(z)
  );

  initial begin
    $display("Simulation start\n");
    $display(" time(ns), x, y, z ");
    $monitor(" %0d,  %b,  %b,  %b ", $time, x, y, z);

    x = 8'b10000100;

    #100;
    x = 8'b01000001;

    #100;
    x = 8'b00100010;

    #100;
    x = 8'b00010100;

    #100;
    x = 8'b00001000;

    #100;
    x = 8'b00000101;

    #100;
    x = 8'b00000010;

    #100;
    x = 8'b00000001;

    #100;
    x = 8'b00000000;

    #100;

    $display("\nSimulation end");
    $finish;
  end

endmodule
