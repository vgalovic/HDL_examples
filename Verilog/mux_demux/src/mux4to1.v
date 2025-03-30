`timescale 1ns / 1ps

module mux4to1_behavioral (
    input  wire       x0,
    input  wire       x1,
    input  wire       x2,
    input  wire       x3,
    input  wire [1:0] sel,
    output reg        y
);

  always @(*) begin
    case (sel)
      2'b00:   y = x0;
      2'b01:   y = x1;
      2'b10:   y = x2;
      2'b11:   y = x3;
      default: y = 1'b0;
    endcase
  end

endmodule

module mux2to1 (
    input  wire x0,
    input  wire x1,
    input  wire sel,
    output wire y
);
  assign y = sel ? x1 : x0;
endmodule

module mux4to1_structural (
    input  wire       x0,
    input  wire       x1,
    input  wire       x2,
    input  wire       x3,
    input  wire [1:0] sel,
    output wire       y
);

  wire y0, y1;

  mux2to1 mux1 (
      .x0 (x0),
      .x1 (x1),
      .sel(sel[0]),
      .y  (y0)
  );
  mux2to1 mux2 (
      .x0 (x2),
      .x1 (x3),
      .sel(sel[0]),
      .y  (y1)
  );
  mux2to1 mux3 (
      .x0 (y0),
      .x1 (y1),
      .sel(sel[1]),
      .y  (y)
  );

endmodule


module mux4to1 (
    input  wire       x0,
    input  wire       x1,
    input  wire       x2,
    input  wire       x3,
    input  wire [1:0] sel,
    output reg        y0,
    output wire       y1
);

  // reg (y0) can't connect directly to module output;
  // wire (y0_w) acts as intermediary for procedural assignment
  wire y0_w;

  mux4to1_behavioral mux4to1_behavioral0 (
      .x0 (x0),
      .x1 (x1),
      .x2 (x2),
      .x3 (x3),
      .sel(sel),
      .y  (y0_w)
  );

  mux4to1_structural mux4to1_structural0 (
      .x0 (x0),
      .x1 (x1),
      .x2 (x2),
      .x3 (x3),
      .sel(sel),
      .y  (y1)
  );

  // Assign the value of internal wire y0_w to reg y0 in procedural block
  always @(*) begin
    y0 = y0_w;
  end

endmodule


