`timescale 1ns / 1ps

module reg_files_64x16_write_first #(
    parameter DATA_WIDTH   = 16,
    parameter ADDR_WIDTH   = 6,
    parameter MEM_CAPACITY = 64
) (
    input wire clk,
    input wire reset,
    input wire ce,
    input wire en,
    input wire [ADDR_WIDTH-1:0] address,
    input wire [DATA_WIDTH-1:0] wdata,
    output reg [DATA_WIDTH-1:0] rdata
);

  reg [DATA_WIDTH-1:0] reg_array[0:MEM_CAPACITY-1];
  integer i;

  always @(posedge clk) begin
    if (reset) begin
      for (i = 0; i < MEM_CAPACITY; i = i + 1) begin
        reg_array[i] <= 0;
      end
    end else if (ce && en) reg_array[address] <= wdata;

    rdata <= reg_array[address];
  end

endmodule
