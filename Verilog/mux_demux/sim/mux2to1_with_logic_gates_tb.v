`timescale 1ns / 1ps

module mux2to1_with_logic_gates_tb ();

  reg x0, x1, sel;
  wire y;

  mux2to1_with_logic_gates dut (
      .x0 (x0),
      .x1 (x1),
      .sel(sel),
      .y  (y)
  );

  initial begin
    x0  = 0;
    x1  = 0;
    sel = 0;

    #100;
    x0 = 1;
    #100;
    x1 = 1;
    #100;
    sel = 1;
    #100;
    x0 = 0;
    #100;
    x1 = 0;
    #100;

    $finish;
  end

endmodule
