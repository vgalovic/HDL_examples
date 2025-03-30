`timescale 1ns / 1ps

module shift_right_tb ();

  reg [3:0] x;
  reg shift;

  wire k_beh;
  wire k_struct;
  wire [3:0] y_beh;
  wire [3:0] y_struct;

  shift_right dut (
      .x(x),
      .shift(shift),
      .k_beh(k_beh),
      .k_struct(k_struct),
      .y_beh(y_beh),
      .y_struct(y_struct)
  );

  initial begin
    x = 4'b0001;
    shift = 0;

    #100;
    x = 4'b0010;
    shift = 1;

    #100;
    x = 4'b0100;

    #100;
    x = 4'b1000;

    #100;
    x = 4'b0001;

    #100;

    $finish;
  end

endmodule
