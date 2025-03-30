`timescale 1ns / 1ps

module mux4to1_16bit (
    input wire [15:0] x0,
    input wire [15:0] x1,
    input wire [15:0] x2,
    input wire [15:0] x3,
    input wire [ 1:0] sel,

    output reg [15:0] y
);

  always @(*) begin
    case (sel)
      2'b00:   y = x0;
      2'b01:   y = x1;
      2'b10:   y = x2;
      2'b11:   y = x3;
      default: ;
    endcase
  end

endmodule
