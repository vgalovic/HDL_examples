`timescale 1ns / 1ps

module parameterized_reg_file #(
    parameter WIDTH = 8,
    parameter NUM_REGISTERS = 4,
    parameter ADR_BUS_WIDTH = 2
) (
    input wire clk,
    input wire reset,

    input wire [ADR_BUS_WIDTH-1:0] waddress0,
    input wire [WIDTH-1:0] wdata0,

    input wire [ADR_BUS_WIDTH-1:0] waddress1,
    input wire [WIDTH-1:0] wdata1,

    input wire [1:0] we,

    input wire [ADR_BUS_WIDTH-1:0] raddress0,
    output wire [WIDTH-1:0] rdata0,

    input wire [ADR_BUS_WIDTH-1:0] raddress1,
    output wire [WIDTH-1:0] rdata1
);
  reg [WIDTH-1:0] reg_file[0:NUM_REGISTERS-1];
  integer i;

  always @(posedge clk) begin
    if (reset) begin
      for (i = 0; i < NUM_REGISTERS; i = i + 1) begin
        reg_file[i] <= {WIDTH{1'b0}};
      end
    end else begin
      if (we[0]) reg_file[waddress0] <= wdata0;
      if (we[1]) reg_file[waddress1] <= wdata1;
    end
  end

  assign rdata0 = reg_file[raddress0];
  assign rdata1 = reg_file[raddress1];

endmodule
