`timescale 1ns / 1ps

module parameterized_comparator_tb ();
  parameter WIDTH_16 = 16;
  parameter WIDTH_32 = 32;

  reg [WIDTH_16-1:0] a_16;
  reg [WIDTH_16-1:0] b_16;
  wire lt_16;
  wire eq_16;
  wire gt_16;

  reg [WIDTH_32-1:0] a_32;
  reg [WIDTH_32-1:0] b_32;
  wire lt_32;
  wire eq_32;
  wire gt_32;

  parameterized_comparator #(
      .WIDTH(WIDTH_16)
  ) comparator_16 (
      .a (a_16),
      .b (b_16),
      .lt(lt_16),
      .eq(eq_16),
      .gt(gt_16)
  );

  parameterized_comparator #(
      .WIDTH(WIDTH_32)
  ) comparator_32 (
      .a (a_32),
      .b (b_32),
      .lt(lt_32),
      .eq(eq_32),
      .gt(gt_32)
  );

  initial begin
    a_16 = 16'h0000;
    b_16 = 16'h0019;

    a_32 = 32'h00000000;
    b_32 = 32'h00000191;

    // TEST: 16-bit

    #100 a_16 = 16'h0019;
    #100 a_16 = 16'h0025;

    // TEST: 32-bit

    #100 a_32 = 32'h00000191;
    #100 a_32 = 32'h00000250;

    #100 $finish;
  end

endmodule
