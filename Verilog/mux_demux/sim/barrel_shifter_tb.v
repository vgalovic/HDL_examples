`timescale 1ns / 1ps

module barrel_shifter_tb ();

  reg  [3:0] x;
  reg  [1:0] sel;

  wire [3:0] y_beh;
  wire [3:0] y_struct;

  barrel_shifter dut (
      .x(x),
      .sel(sel),
      .y_beh(y_beh),
      .y_struct(y_struct)
  );

  initial begin
    x   = 4'b0001;
    sel = 2'b00;

    #100;
    sel = 2'b01;

    #100;
    sel = 2'b10;

    #100;
    sel = 2'b11;

    #100;

    $finish;
  end

endmodule
