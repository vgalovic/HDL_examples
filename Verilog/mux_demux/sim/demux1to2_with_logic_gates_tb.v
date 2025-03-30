`timescale 1ns / 1ps

module demux1to2_with_logic_gates_tb ();
  reg  x;
  reg  sel;

  wire y0;
  wire y1;

  demux1to2_with_logic_gates dut (
      .x  (x),
      .sel(sel),
      .y0 (y0),
      .y1 (y1)
  );

  initial begin
    x   = 0;
    sel = 0;

    #100;
    x = 1;

    #100;
    sel = 1;

    #100;
    x = 0;

    #100;

    $finish;
  end

endmodule
