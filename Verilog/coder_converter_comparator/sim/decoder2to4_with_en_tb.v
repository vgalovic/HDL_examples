`timescale 1ns / 1ps

module decoder2to4_with_en_tb ();

  reg  [1:0] x;
  reg        en;
  wire [3:0] y;

  decoder2to4_with_en dut (
      .x (x),
      .en(en),
      .y (y)
  );

  initial begin
    $display("Simulation start\n");
    $display(" time(ns), en, x, y ");
    $monitor(" %0d,  %b,  %b,  %b ", $time, en, x, y);

    x  = 2'b00;
    en = 1'b1;

    #100;
    x = 2'b01;

    #100;
    x = 2'b10;

    #100;
    x = 2'b11;

    #100;
    en = 1'b0;

    #100;

    $display("\nSimulation finish");
    $finish;
  end

endmodule
