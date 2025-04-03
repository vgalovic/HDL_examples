`timescale 1ns / 1ps

module BCD_to_7seg_based_on_rom #(
    parameter BCD_WIDTH = 4,
    parameter SEG_WIDTH = 7,
    parameter MEM_CAPACITY = 16
) (
    input  wire [BCD_WIDTH-1:0] bcd,
    output reg  [SEG_WIDTH-1:0] seg
);

  reg [SEG_WIDTH-1:0] rom[0:MEM_CAPACITY-1];

  initial begin
    rom[0]  = 7'b1111110;  // 0
    rom[1]  = 7'b0110000;  // 1
    rom[2]  = 7'b1101101;  // 2
    rom[3]  = 7'b1111001;  // 3
    rom[4]  = 7'b0110011;  // 4
    rom[5]  = 7'b1011011;  // 5
    rom[6]  = 7'b1011111;  // 6
    rom[7]  = 7'b1110000;  // 7
    rom[8]  = 7'b1111111;  // 8
    rom[9]  = 7'b1111011;  // 9
    rom[10] = 7'b0000000;  // Unused
    rom[11] = 7'b0000000;  // Unused
    rom[12] = 7'b0000000;  // Unused
    rom[13] = 7'b0000000;  // Unused
    rom[14] = 7'b0000000;  // Unused
    rom[15] = 7'b0000000;  // Unused
  end

  always @(*) begin
    seg = rom[bcd];
  end


  // This rom can be implemented with a case statement.
  // always @(*) begin
  //   case (bcd)
  //     4'b0000: seg = 7'b1111110;  // 0
  //     4'b0001: seg = 7'b0110000;  // 1
  //     4'b0010: seg = 7'b1101101;  // 2
  //     4'b0011: seg = 7'b1111001;  // 3
  //     4'b0100: seg = 7'b0110011;  // 4
  //     4'b0101: seg = 7'b1011011;  // 5
  //     4'b0110: seg = 7'b1011111;  // 6
  //     4'b0111: seg = 7'b1110000;  // 7
  //     4'b1000: seg = 7'b1111111;  // 8
  //     4'b1001: seg = 7'b1111011;  // 9
  //     default: seg = 7'b0;  // Unused
  //   endcase
  // end

endmodule
