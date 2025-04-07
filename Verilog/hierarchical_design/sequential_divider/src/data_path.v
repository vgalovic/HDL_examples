`timescale 1ns / 1ps

module data_path #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst,

    input wire [WIDTH-1:0] a_in,
    input wire [WIDTH-1:0] b_in,

    input wire [1:0] sel,

    output reg [WIDTH-1:0] n_n,

    output wire [WIDTH-1:0] quotient,
    output wire [WIDTH-1:0] remainder
);

  reg [WIDTH-1:0] a_n, a_r;
  reg [WIDTH-1:0] b_n, b_r;
  reg [WIDTH-1:0] n_r;
  reg [WIDTH-1:0] r_n, r_r;
  wire [WIDTH-1:0] r_temp;

  wire q_bit;

  wire [WIDTH-1:0] sh_l_0;
  wire [WIDTH-1:0] sh_l_1;

  compare_and_subtract #(
      .WIDTH(WIDTH)
  ) compare_and_subtract_0 (
      .b_r(b_r),
      .r_r(r_r),

      .q_bit (q_bit),
      .r_temp(r_temp)
  );

  always @(posedge clk) begin
    if (rst) begin
      a_r <= {WIDTH{1'b0}};
      b_r <= {WIDTH{1'b0}};
      n_r <= {WIDTH{1'b0}};
      r_r <= {WIDTH{1'b0}};
    end else begin
      a_r <= a_n;
      b_r <= b_n;
      n_r <= n_n;
      r_r <= r_n;
    end
  end

  assign sh_l_0 = {a_r[WIDTH-2:0], q_bit};
  assign sh_l_1 = {r_temp[WIDTH-2:0], a_r[WIDTH-1]};

  always @(*) begin
    a_n = a_r;
    b_n = b_r;
    n_n = n_r;
    r_n = r_r;

    case (sel)
      2'b00: begin
        a_n = a_in;
        b_n = b_in;
        n_n = WIDTH + 1;
        r_n = {WIDTH{1'b0}};
      end
      2'b01: begin
        a_n = sh_l_0;
        n_n = n_r - 1;
        r_n = sh_l_1;
      end
      2'b10: begin
        a_n = sh_l_0;
        r_n = r_temp;
      end
      default: ;
    endcase
  end

  assign quotient  = a_r;
  assign remainder = r_r;

endmodule
