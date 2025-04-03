`timescale 1ns / 1ps

module rom64x16 #(
    parameter ADDR_WIDTH   = 6,
    parameter DATA_WIDTH   = 16,
    parameter MEM_CAPACITY = 64
) (
    input  wire [ADDR_WIDTH-1:0] addr,
    output reg  [DATA_WIDTH-1:0] rdata
);

  reg [DATA_WIDTH-1:0] rom[0:MEM_CAPACITY-1];

  initial begin
    rom[0]  = 16'h0000;
    rom[1]  = 16'h0003;
    rom[2]  = 16'h0001;
    rom[3]  = 16'h0005;
    rom[4]  = 16'h0008;
    rom[5]  = 16'h0002;
    rom[6]  = 16'h0004;
    rom[7]  = 16'h000A;
    rom[8]  = 16'h0007;
    rom[9]  = 16'h000F;
    rom[10] = 16'h0009;
    rom[11] = 16'h000C;
    rom[12] = 16'h0010;
    rom[13] = 16'h0013;
    rom[14] = 16'h0012;
    rom[15] = 16'h0014;
    rom[16] = 16'h0011;
    rom[17] = 16'h0017;
    rom[18] = 16'h0015;
    rom[19] = 16'h0019;
    rom[20] = 16'h0021;
    rom[21] = 16'h0020;
    rom[22] = 16'h0024;
    rom[23] = 16'h0023;
    rom[24] = 16'h0026;
    rom[25] = 16'h0025;
    rom[26] = 16'h0028;
    rom[27] = 16'h0029;
    rom[28] = 16'h0030;
    rom[29] = 16'h0031;
    rom[30] = 16'h0034;
    rom[31] = 16'h0032;
    rom[32] = 16'h0035;
    rom[33] = 16'h0036;
    rom[34] = 16'h0037;
    rom[35] = 16'h0038;
    rom[36] = 16'h0033;
    rom[37] = 16'h0039;
    rom[38] = 16'h003A;
    rom[39] = 16'h003B;
    rom[40] = 16'h003C;
    rom[41] = 16'h003D;
    rom[42] = 16'h003E;
    rom[43] = 16'h003F;
    rom[44] = 16'h0040;
    rom[45] = 16'h0041;
    rom[46] = 16'h0042;
    rom[47] = 16'h0044;
    rom[48] = 16'h0045;
    rom[49] = 16'h0046;
    rom[50] = 16'h0047;
    rom[51] = 16'h0048;
    rom[52] = 16'h0049;
    rom[53] = 16'h004A;
    rom[54] = 16'h004B;
    rom[55] = 16'h004C;
    rom[56] = 16'h004D;
    rom[57] = 16'h004E;
    rom[58] = 16'h004F;
    rom[59] = 16'h0050;
    rom[60] = 16'h0051;
    rom[61] = 16'h0052;
    rom[62] = 16'h0053;
    rom[63] = 16'h0054;
  end

  always @(*) begin
    rdata = rom[addr];
  end

endmodule

