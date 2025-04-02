`timescale 1ns / 1ps

module register_file_with_async_reading #(
    parameter M          = 32,  // Number of registers
    parameter WIDTH      = 8,   // Bit width of each register
    parameter ADDR_WIDTH = 5    // Address width (log2(m)), should be 5 for m=32
) (
    input wire clk,
    input wire reset,

    input wire ce,
    input wire en,

    input wire [ADDR_WIDTH-1:0] waddress1,
    input wire [WIDTH-1:0] wdata1,

    input wire [ADDR_WIDTH-1:0] waddress2,
    input wire [WIDTH-1:0] wdata2,

    input wire [1:0] we,

    input wire [ADDR_WIDTH-1:0] raddress1,
    output wire [WIDTH-1:0] rdata1,

    input wire [ADDR_WIDTH-1:0] raddress2,
    output wire [WIDTH-1:0] rdata2
);

  // Declare the register file as a 2D register array
  reg [WIDTH-1:0] reg_file[0:M-1];
  integer i;  // Declare integer variable outside the always block

  // Reset logic: set all registers to zero when reset is asserted
  always @(posedge clk) begin
    if (reset) begin
      for (i = 0; i < M; i = i + 1) begin
        reg_file[i] <= {WIDTH{1'b0}};  // Reset each register to zero
      end
    end else if (ce && en) begin
      // Write to register file if enabled
      if (we[0]) reg_file[waddress1] <= wdata1;
      if (we[1]) reg_file[waddress2] <= wdata2;
    end
  end

  // Asynchronous read logic
  assign rdata1 = reg_file[raddress1];
  assign rdata2 = reg_file[raddress2];

endmodule
