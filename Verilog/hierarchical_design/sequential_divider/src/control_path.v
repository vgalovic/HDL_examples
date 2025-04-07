`timescale 1ns / 1ps

module control_path #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst,

    input wire start,

    input wire [WIDTH-1:0] n_n,

    output reg last,
    output reg ready,

    output reg [1:0] sel
);

  localparam [1:0] IDLE = 0, OP = 1, FINAL = 2, DONE = 3;
  reg [1:0] state_reg = IDLE, state_next;

  always @(posedge clk) begin
    state_reg <= (rst) ? IDLE : state_next;
  end

  always @(*) begin
    state_next = state_reg;

    case (state_reg)
      IDLE: if (start) state_next = OP;
      OP: if (n_n <= 1) state_next = FINAL;
      FINAL: state_next = DONE;
      DONE: state_next = IDLE;
      default: ;
    endcase
  end

  always @(*) begin
    last  = 0;
    ready = 0;

    sel   = 2'b00;

    case (state_reg)
      IDLE: ready = 1;
      OP: sel = 2'b01;
      FINAL: sel = 2'b10;
      DONE: begin
        sel  = 2'b11;
        last = 1;
      end
      default: ;
    endcase
  end
endmodule
