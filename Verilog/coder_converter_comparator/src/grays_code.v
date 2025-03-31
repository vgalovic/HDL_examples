`timescale 1ns / 1ps

module grays_code (
    input  wire [2:0] b,
    output reg  [2:0] g
);

  always @(*) begin
    case (b)
      3'b000:  g = 3'b000;
      3'b001:  g = 3'b001;
      3'b010:  g = 3'b011;
      3'b011:  g = 3'b010;
      3'b100:  g = 3'b110;
      3'b101:  g = 3'b111;
      3'b110:  g = 3'b101;
      3'b111:  g = 3'b100;
      default: g = 3'b000;
    endcase
  end
endmodule
