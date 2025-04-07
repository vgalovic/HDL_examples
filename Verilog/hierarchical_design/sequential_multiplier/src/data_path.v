`timescale 1ns / 1ps

module data_path #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire [1:0] sel,

    input wire [WIDTH-1:0] a_in,
    input wire [WIDTH-1:0] b_in,

    output reg [2*WIDTH-1:0] r_out,

    output reg b_0,
    output reg count_0
);

  reg [2*WIDTH-1:0] a_reg, a_next;
  reg [WIDTH-1:0] b_reg, b_next;
  reg [WIDTH-1:0] n_reg, n_next;
  reg [2*WIDTH-1:0] p_reg, p_next;

  always @(posedge clk) begin
    a_reg <= a_next;
    b_reg <= b_next;
    n_reg <= n_next;
    p_reg <= p_next;
  end

  always @(*) begin
    case (sel)
      2'b00: begin
        a_next = {{(WIDTH) {1'b0}}, a_in};
        b_next = b_in;
        n_next = WIDTH;
        p_next = {WIDTH{1'b0}};
      end
      2'b01: begin
        a_next = a_reg;
        b_next = b_reg;
        n_next = n_reg;
        p_next = p_reg + a_reg;
      end
      2'b10: begin
        a_next = a_reg << 1;
        b_next = b_reg >> 1;
        n_next = n_reg - 1;
        p_next = p_reg;
      end
      2'b11: begin
        a_next = {WIDTH{1'b0}};
        b_next = {WIDTH{1'b0}};
        n_next = {WIDTH{1'b0}};
        p_next = {WIDTH{1'b0}};
      end
      default: ;
    endcase
  end

  always @(*) begin
    b_0 = b_next[0];
    count_0 = (n_next == 0);
    r_out = p_reg;
  end

endmodule
