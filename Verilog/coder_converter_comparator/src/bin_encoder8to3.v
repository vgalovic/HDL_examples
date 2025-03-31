`timescale 1ns / 1ps

module bin_encoder8to3 (
    input  wire [7:0] x,
    output reg  [2:0] y
);

  always @(*) begin
    case (x)
      8'b00000001: y = 3'b000;
      8'b00000010: y = 3'b001;
      8'b00000100: y = 3'b010;
      8'b00001000: y = 3'b011;
      8'b00010000: y = 3'b100;
      8'b00100000: y = 3'b101;
      8'b01000000: y = 3'b110;
      8'b10000000: y = 3'b111;
      default: y = 3'b000;
    endcase
  end

endmodule
