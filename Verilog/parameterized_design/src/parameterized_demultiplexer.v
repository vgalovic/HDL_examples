`timescale 1ns / 1ps

module parameterized_demultiplexer #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] x,
    input wire [1:0] sel,
    output reg [WIDTH-1:0] y0,
    output reg [WIDTH-1:0] y1,
    output reg [WIDTH-1:0] y2,
    output reg [WIDTH-1:0] y3
);

  always @(*) begin
    y0 = {WIDTH{1'b0}};
    y1 = {WIDTH{1'b0}};
    y2 = {WIDTH{1'b0}};
    y3 = {WIDTH{1'b0}};

    case (sel)
      2'b00:   y0 = x;
      2'b01:   y1 = x;
      2'b10:   y2 = x;
      2'b11:   y3 = x;
      default: ;
    endcase
  end

endmodule
