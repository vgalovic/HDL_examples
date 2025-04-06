`timescale 1ns / 1ps

module parameterized_reg_file_tb ();

  parameter WIDTH_32 = 32;
  parameter NUM_REGISTERS_32 = 32;
  parameter ADR_BUS_WIDTH_32 = 5;

  parameter WIDTH_64 = 64;
  parameter NUM_REGISTERS_64 = 16;
  parameter ADR_BUS_WIDTH_64 = 4;

  reg clk;
  reg reset;

  reg [1:0] we;

  reg [ADR_BUS_WIDTH_32-1:0] waddress0_32;
  reg [WIDTH_32-1:0] wdata0_32;

  reg [ADR_BUS_WIDTH_32-1:0] waddress1_32;
  reg [WIDTH_32-1:0] wdata1_32;


  reg [ADR_BUS_WIDTH_32-1:0] raddress0_32;
  wire [WIDTH_32-1:0] rdata0_32;

  reg [ADR_BUS_WIDTH_32-1:0] raddress1_32;
  wire [WIDTH_32-1:0] rdata1_32;

  reg [ADR_BUS_WIDTH_64-1:0] waddress0_64;
  reg [WIDTH_64-1:0] wdata0_64;

  reg [ADR_BUS_WIDTH_64-1:0] waddress1_64;
  reg [WIDTH_64-1:0] wdata1_64;

  reg [ADR_BUS_WIDTH_64-1:0] raddress0_64;
  wire [WIDTH_64-1:0] rdata0_64;

  reg [ADR_BUS_WIDTH_64-1:0] raddress1_64;
  wire [WIDTH_64-1:0] rdata1_64;

  // Instantiate 32-bit register file
  parameterized_reg_file #(
      .WIDTH(WIDTH_32),
      .NUM_REGISTERS(NUM_REGISTERS_32),
      .ADR_BUS_WIDTH(ADR_BUS_WIDTH_32)
  ) reg_file_32 (
      .clk(clk),
      .reset(reset),
      .waddress0(waddress0_32),
      .wdata0(wdata0_32),
      .waddress1(waddress1_32),
      .wdata1(wdata1_32),
      .we(we),
      .raddress0(raddress0_32),
      .rdata0(rdata0_32),
      .raddress1(raddress1_32),
      .rdata1(rdata1_32)
  );

  // Instantiate 64-bit register file
  parameterized_reg_file #(
      .WIDTH(WIDTH_64),
      .NUM_REGISTERS(NUM_REGISTERS_64),
      .ADR_BUS_WIDTH(ADR_BUS_WIDTH_64)
  ) reg_file_64 (
      .clk(clk),
      .reset(reset),
      .waddress0(waddress0_64),
      .wdata0(wdata0_64),
      .waddress1(waddress1_64),
      .wdata1(wdata1_64),
      .we(we),
      .raddress0(raddress0_64),
      .rdata0(rdata0_64),
      .raddress1(raddress1_64),
      .rdata1(rdata1_64)
  );

  // Clock generation
  initial clk = 1'b0;
  always #25 clk = ~clk;
  // Inital input values of registers files
  initial begin
    we = 2'b00;

    waddress0_32 = 5'h00;
    waddress1_32 = 5'h00;

    waddress0_64 = 4'h00;
    waddress1_64 = 4'h00;

    wdata0_32 = 32'h00000000;
    wdata1_32 = 32'h00000000;
    wdata0_64 = 64'h0000000000000000;
    wdata1_64 = 64'h0000000000000000;

    raddress0_32 = 5'h00;
    raddress1_32 = 5'h00;

    raddress0_64 = 4'h00;
    raddress1_64 = 4'h00;

    reset = 1'b1;
    #50 reset = 1'b0;

    // TEST: 32-bit register file

    #50 we = 2'b01;

    waddress0_32 = 5'h01;
    wdata0_32 = 32'h00000256;

    #50 waddress0_32 = 5'h03;
    wdata0_32 = 32'h00004531;

    #50 we = 2'b10;

    waddress1_32 = 5'h02;
    wdata1_32 = 32'h00000023;

    #50 waddress1_32 = 5'h04;
    wdata1_32 = 32'h00004567;

    #50 raddress0_32 = 5'h01;
    raddress1_32 = 5'h02;

    #50 raddress0_32 = 5'h03;
    raddress1_32 = 5'h04;

    // TEST: 64-bit register file

    we = 2'b01;

    waddress0_64 = 4'h01;
    wdata0_64 = 64'h0000025600000000;

    #50 waddress0_64 = 4'h03;
    wdata0_64 = 64'h000045350000000;

    #50 we = 2'b10;

    waddress1_64 = 4'h02;
    wdata1_64 = 64'h0000002300000000;

    #50 waddress1_64 = 4'h04;
    wdata1_64 = 64'h0000456700000000;

    #50 raddress0_64 = 4'h01;
    raddress1_64 = 4'h02;

    #50 raddress0_64 = 4'h03;
    raddress1_64 = 4'h04;

    #50 $finish;
  end

endmodule
