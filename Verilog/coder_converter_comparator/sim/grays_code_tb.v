`timescale 1ns / 1ps

module grays_code_tb ();
  reg  [2:0] b;
  wire [2:0] g;

  grays_code dut (
      .b(b),
      .g(g)
  );

  initial begin
    $display("Simulation start\n");
    $display(" time(ns), b, g ");
    $monitor(" %0d,  %b,  %b ", $time, b, g);

    b = 3'b000;

    #100;
    b = 3'b001;

    #100;
    b = 3'b010;

    #100;
    b = 3'b011;

    #100;
    b = 3'b100;

    #100;
    b = 3'b101;

    #100;
    b = 3'b110;

    #100;
    b = 3'b111;

    #100;

    $display("\nSimulation end");
    $finish;
  end

endmodule
