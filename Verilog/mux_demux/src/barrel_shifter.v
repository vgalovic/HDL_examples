`timescale 1ns / 1ps

module mux4to1_for_bs (
    input  wire       x3,
    input  wire       x2,
    input  wire       x1,
    input  wire       x0,
    input  wire [1:0] sel,
    output reg        y
);

  always @(*) begin
    case (sel)
      2'b00:   y = x0;
      2'b01:   y = x1;
      2'b10:   y = x2;
      2'b11:   y = x3;
      default: ;
    endcase
  end

endmodule

module barrel_shifter_structural (
    input  wire [3:0] x,
    input  wire [1:0] sel,
    output wire [3:0] y
);

  mux4to1_for_bs mux4to1_3 (
      .x0 (x[3]),
      .x1 (x[0]),
      .x2 (x[1]),
      .x3 (x[2]),
      .sel(sel),
      .y  (y[3])
  );

  mux4to1_for_bs mux4to1_2 (
      .x0 (x[2]),
      .x1 (x[3]),
      .x2 (x[0]),
      .x3 (x[1]),
      .sel(sel),
      .y  (y[2])
  );

  mux4to1_for_bs mux4to1_1 (
      .x0 (x[1]),
      .x1 (x[2]),
      .x2 (x[3]),
      .x3 (x[0]),
      .sel(sel),
      .y  (y[1])
  );

  mux4to1_for_bs mux4to1_0 (
      .x0 (x[0]),
      .x1 (x[1]),
      .x2 (x[2]),
      .x3 (x[3]),
      .sel(sel),
      .y  (y[0])
  );

endmodule

module barrel_shifter_behavioral (
    input  wire [3:0] x,
    input  wire [1:0] sel,
    output reg  [3:0] y
);


  always @(*) begin
    case (sel)
      2'b00:   y = {x[3], x[2], x[1], x[0]};
      2'b01:   y = {x[0], x[3], x[2], x[1]};
      2'b10:   y = {x[1], x[0], x[3], x[2]};
      2'b11:   y = {x[2], x[1], x[0], x[3]};
      default: ;
    endcase
  end
endmodule

module barrel_shifter (
    input  wire [3:0] x,
    input  wire [1:0] sel,
    output wire [3:0] y_struct,
    output reg  [3:0] y_beh
);

  wire [3:0] y_beh_w;

  barrel_shifter_structural barrel_shifter_structural0 (
      .x  (x),
      .sel(sel),
      .y  (y_struct)
  );

  barrel_shifter_behavioral barrel_shifter_behavioral0 (
      .x  (x),
      .sel(sel),
      .y  (y_beh_w)
  );

  always @(*) begin
    y_beh = y_beh_w;
  end

endmodule

