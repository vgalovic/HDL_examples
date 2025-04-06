`timescale 1ns / 1ps

module pipo_register_beh #(
    parameter WIDTH = 16
) (
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);

  always @(posedge clk) begin
    if (rst) q <= {WIDTH{1'b0}};
    else q <= d;
  end

endmodule

module pipo_registe_struct #(
    parameter WIDTH = 32
) (
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);

  genvar i;
  generate
    for (i = 0; i < WIDTH; i = i + 1) begin : gen_reg
      always @(posedge clk) begin
        if (rst) q[i] <= 1'b0;
        else q[i] <= d[i];
      end
    end
  endgenerate

endmodule

module parameterized_pipo_register #(
    parameter WIDTH_BEH = 16,
    parameter WIDTH_STR = 32
) (
    input wire clk,
    input wire rst,

    input wire [WIDTH_BEH-1:0] d_beh,
    input wire [WIDTH_STR-1:0] d_str,

    output wire [WIDTH_BEH-1:0] q_beh,
    output wire [WIDTH_STR-1:0] q_str
);

  pipo_register_beh #(
      .WIDTH(WIDTH_BEH)
  ) pipo_reg_beh (
      .clk(clk),
      .rst(rst),
      .d  (d_beh),
      .q  (q_beh)
  );

  pipo_registe_struct #(
      .WIDTH(WIDTH_STR)
  ) pipo_reg_struct (
      .clk(clk),
      .rst(rst),
      .d  (d_str),
      .q  (q_str)
  );

endmodule

