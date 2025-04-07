`timescale 1ns / 1ps

module control_path (
    input wire clk,

    input wire count_0,
    input wire b_0,

    input wire start,
    input wire reset,

    output reg [1:0] sel,

    output reg ready
);

  localparam IDLE = 0, SHIFT = 1, ADD = 2;

  reg [1:0] state_reg = IDLE, state_next;

  always @(posedge clk) begin
    state_reg <= (reset) ? IDLE : state_next;
  end

  always @(*) begin
    state_next = state_reg;

    case (state_reg)
      IDLE: begin
        if (start) begin
          if (b_0) state_next = ADD;
          else state_next = SHIFT;
        end
      end
      ADD: state_next = SHIFT;
      SHIFT: begin
        if (count_0) state_next = IDLE;
        else if (b_0) state_next = ADD;
      end
      default: ;
    endcase
  end

  always @(*) begin
    sel   = 2'b00;
    ready = 1'b0;

    case (state_reg)
      IDLE: ready = 1'b1;
      ADD: sel = 2'b01;
      SHIFT: sel = 2'b10;
      default: ;
    endcase
  end
endmodule
