`timescale 1ns / 1ps

module demux1to4_with_en (
    input wire x,
    input wire en,
    input wire [1:0] sel,
    output reg y0,
    output reg y1,
    output reg y2,
    output reg y3
);

  always @(*) begin
    y0 = 1'b0;
    y1 = 1'b0;
    y2 = 1'b0;
    y3 = 1'b0;

    if (en) begin
      case (sel)
        2'b00:   y0 = x;
        2'b01:   y1 = x;
        2'b10:   y2 = x;
        2'b11:   y3 = x;
        default: ;
      endcase
    end
  end

endmodule
