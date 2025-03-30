`timescale 1ns / 1ps

module demux1to2_with_logic_gates (
    input  wire x,
    input  wire sel,
    output wire y0,
    output wire y1
);


  assign y0 = (~sel) & x;
  assign y1 = sel & x;

endmodule
