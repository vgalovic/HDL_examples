`timescale 1ns / 1ps

module bcd_to_7seg (
    input  wire [3:0] bcd,
    output reg  [6:0] seg
);

  always @(*) begin
    case (bcd)
      4'b0000: seg = 7'b0111111;  // 0
      4'b0001: seg = 7'b0000110;  // 1
      4'b0010: seg = 7'b1011011;  // 2
      4'b0011: seg = 7'b1001111;  // 3
      4'b0100: seg = 7'b1100110;  // 4
      4'b0101: seg = 7'b1101101;  // 5
      4'b0110: seg = 7'b1111101;  // 6
      4'b0111: seg = 7'b0000111;  // 7
      4'b1000: seg = 7'b1111111;  // 8
      4'b1001: seg = 7'b1101111;  // 9
      default: seg = 7'b0000000;  //invalid input
    endcase
  end

  // Using the ternary operator (?:) to implement a combinational selection logic.
  // This ensures the described logic remains purely combinational.
  // If you want to use this implementation, make sure that `seg` is declared as `wire`
  // and not `reg`, since `reg` is only used for sequential logic outputs.
  //
  // assign seg = (bcd == 4'b0000) ? 7'b0111111 :  // 0
  //     (bcd == 4'b0001) ? 7'b0000110 :  // 1
  //     (bcd == 4'b0010) ? 7'b1011011 :  // 2
  //     (bcd == 4'b0011) ? 7'b1001111 :  // 3
  //     (bcd == 4'b0100) ? 7'b1100110 :  // 4
  //     (bcd == 4'b0101) ? 7'b1101101 :  // 5
  //     (bcd == 4'b0110) ? 7'b1111101 :  // 6
  //     (bcd == 4'b0111) ? 7'b0000111 :  // 7
  //     (bcd == 4'b1000) ? 7'b1111111 :  // 8
  //     (bcd == 4'b1001) ? 7'b1101111 :  // 9
  //     7'b0000000;  // Default (invalid input)


endmodule

