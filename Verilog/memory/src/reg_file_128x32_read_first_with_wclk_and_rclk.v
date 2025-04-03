`timescale 1ns / 1ps

module reg_file_128x32_read_first_with_wclk_and_rclk #(
    parameter DATA_WIDTH   = 32,
    parameter ADDR_WIDTH   = 7,
    parameter MEM_CAPACITY = 128
) (
    input wire wclk,
    input wire rclk,
    input wire reset,
    input wire ce,
    input wire en,
    input wire [ADDR_WIDTH-1:0] address,
    input wire [DATA_WIDTH-1:0] wdata,
    output reg [DATA_WIDTH-1:0] rdata
);

  reg [DATA_WIDTH-1:0] reg_array[0:MEM_CAPACITY-1];
  integer i;

  always @(posedge wclk) begin
    if (reset) begin
      for (i = 0; i < MEM_CAPACITY; i = i + 1) begin
        reg_array[i] <= 0;
      end
    end else if (ce && en) reg_array[address] <= wdata;
  end

  always @(posedge rclk) begin
    rdata <= reg_array[address];
  end

endmodule
