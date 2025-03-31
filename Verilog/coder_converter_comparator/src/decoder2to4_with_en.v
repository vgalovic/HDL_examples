`timescale 1ns / 1ps

module decoder2to4_with_en (
    input  wire [1:0] x,
    input  wire       en,
    output reg  [3:0] y
);

  always @(*) begin
    if (en) begin
      case (x)
        2'b00:   y = 4'b1000;
        2'b01:   y = 4'b0100;
        2'b10:   y = 4'b0010;
        2'b11:   y = 4'b0001;
        default: y = 4'b0000;
      endcase
    end else y = 4'b0000;
  end

endmodule
