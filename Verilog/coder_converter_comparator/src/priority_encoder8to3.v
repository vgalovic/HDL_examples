`timescale 1ns / 1ps

module priority_encoder8to3 (
    input wire [7:0] x,
    output reg [2:0] y,
    output reg z
);

  always @(*) begin
    y = 3'b000;
    z = 1'b1;
    if (x[7]) y = 3'b111;
    else if (x[6]) y = 3'b110;
    else if (x[5]) y = 3'b101;
    else if (x[4]) y = 3'b100;
    else if (x[3]) y = 3'b011;
    else if (x[2]) y = 3'b010;
    else if (x[1]) y = 3'b001;
    else if (x[0]) y = 3'b000;
    else z = 1'b0;
  end

endmodule
