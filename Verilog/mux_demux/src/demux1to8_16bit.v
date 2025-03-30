`timescale 1ns / 1ps

module demux1to8_16bit (
    input  wire [15:0] x,
    input  wire [ 2:0] sel,
    output reg  [15:0] y0,
    output reg  [15:0] y1,
    output reg  [15:0] y2,
    output reg  [15:0] y3,
    output reg  [15:0] y4,
    output reg  [15:0] y5,
    output reg  [15:0] y6,
    output reg  [15:0] y7
);

  always @(*) begin
    y0 = 16'b0;
    y1 = 16'b0;
    y2 = 16'b0;
    y3 = 16'b0;
    y4 = 16'b0;
    y5 = 16'b0;
    y6 = 16'b0;
    y7 = 16'b0;

    case (sel)
      3'b000:  y0 = x;
      3'b001:  y1 = x;
      3'b010:  y2 = x;
      3'b011:  y3 = x;
      3'b100:  y4 = x;
      3'b101:  y5 = x;
      3'b110:  y6 = x;
      3'b111:  y7 = x;
      default: ;
    endcase
  end

endmodule
