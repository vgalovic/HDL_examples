`timescale 1ns / 1ps

module bin_encoder4to2_with_logic_gates_tb ();

  reg  [3:0] x;
  wire [1:0] y;

  bin_encoder4to2_with_logic_gates dut (
      .x(x),
      .y(y)
  );

  initial begin
    $display("Simulation start");
    $display("-----------------");
    $display(" time(ns), x, y ");
    $monitor(" %0d,  %b,  %b ", $time, x, y);

    x = 4'b1010;

    #100;
    x = 4'b0101;

    #100;
    x = 4'b1101;

    #100;
    x = 4'b1111;

    #100;

    $display("-----------------");
    $display("Simulation finish");
    $finish;
  end

endmodule
