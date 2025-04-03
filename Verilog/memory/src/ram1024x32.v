`timescale 1ns / 1ps

module ram1024x32 #(
    parameter ADDR_WIDTH = 10,
    parameter DATA_WIDTH = 32
) (
    input wire clk,

    input wire [ADDR_WIDTH-1:0] address,

    input wire [DATA_WIDTH-1:0] wdata,
    input wire write,

    output wire [DATA_WIDTH-1:0] rdata
);

  reg [DATA_WIDTH-1:0] reg_array[0:2**ADDR_WIDTH-1];

  // Initialize memory with zeros
  integer i;
  initial begin
    for (i = 0; i < 2 ** ADDR_WIDTH; i = i + 1) begin
      reg_array[i] = 0;
    end
  end

  always @(posedge clk) begin
    if (write) reg_array[address] <= wdata;

    // Synchronous read
    // NOTE: rdata must be `reg` to be synchronous, because `wire` is used only
    // in combinational logic
    //
    // rdata <= reg_array[address];
  end

  // Asynchronous memory
  assign rdata = reg_array[address];

endmodule
