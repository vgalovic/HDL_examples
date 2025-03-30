`timescale 1ns / 1ps

module mux2to1_internal (
    input  wire x0,
    input  wire x1,
    input  wire sel,
    output wire y
);
  assign y = sel ? x1 : x0;

endmodule

module shift_right_structural (
    input  wire [3:0] x,
    input  wire       shift,
    output wire       k,
    output wire [3:0] y
);

  mux2to1_internal mux2to1_0 (
      .x0 (x[3]),
      .x1 (1'b0),
      .sel(shift),
      .y  (y[3])
  );

  mux2to1_internal mux2to1_1 (
      .x0 (x[2]),
      .x1 (x[3]),
      .sel(shift),
      .y  (y[2])
  );

  mux2to1_internal mux2to1_2 (
      .x0 (x[1]),
      .x1 (x[2]),
      .sel(shift),
      .y  (y[1])
  );

  mux2to1_internal mux2to1_3 (
      .x0 (x[0]),
      .x1 (x[1]),
      .sel(shift),
      .y  (y[0])
  );

  mux2to1_internal mux2to1_4 (
      .x0 (1'b0),
      .x1 (x[0]),
      .sel(shift),
      .y  (k)
  );

endmodule

module shift_right_behavioral (
    input  wire [3:0] x,
    input  wire       shift,
    output reg        k,
    output reg  [3:0] y
);

  always @(*) begin
    if (shift) begin
      y[3] = 1'b0;
      y[2] = x[3];
      y[1] = x[2];
      y[0] = x[1];
      k    = x[0];
    end else begin
      y[3] = x[3];
      y[2] = x[2];
      y[1] = x[1];
      y[0] = x[0];
      k    = 1'b0;
    end
  end

endmodule

module shift_right (
    input  wire [3:0] x,
    input  wire       shift,
    output reg        k_beh,
    output wire       k_struct,
    output reg  [3:0] y_beh,
    output wire [3:0] y_struct
);

  wire k_beh_w;
  wire [3:0] y_beh_w;

  shift_right_behavioral shift_right_behavioral0 (
      .x(x),
      .shift(shift),
      .k(k_beh_w),
      .y(y_beh_w)
  );

  shift_right_structural shift_right_structural0 (
      .x(x),
      .shift(shift),
      .k(k_struct),
      .y(y_struct)
  );


  always @(*) begin
    k_beh = k_beh_w;
    y_beh = y_beh_w;
  end


endmodule
