`timescale 1ns / 1ps

module decoder3to8_tb ();
  reg  [2:0] x;
  wire [7:0] y;

  decoder3to8 dut (
      .x(x),
      .y(y)
  );

  initial begin
    $display("Simulation start\n");
    $display(" time(ns), x, y ");
    $monitor(" %0d,  %b,  %b ", $time, x, y);

    x = 3'b000;
    #100;
    x = 3'b001;
    #100;
    x = 3'b010;
    #100;
    x = 3'b011;
    #100;
    x = 3'b100;
    #100;
    x = 3'b101;
    #100;
    x = 3'b110;
    #100;
    x = 3'b111;
    #100;

    $display("\nSimulation end");
    $finish;
  end

endmodule
