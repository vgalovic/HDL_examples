`timescale 1ns / 1ps

module JK_flip_flop_with_rising_edge (
    input  wire clk,
    input  wire J,
    input  wire K,
    output reg  Q
);

  always @(posedge clk) begin
    if (J == 1'b0 && K == 1'b0) Q <= Q;  // Hold state (no change)
    else if (J == 1'b0 && K == 1'b1) Q <= 1'b0;  // Reset state (Q = 0)
    else if (J == 1'b1 && K == 1'b0) Q <= 1'b1;  // Set state (Q = 1)
    else if (J == 1'b1 && K == 1'b1) Q <= ~Q;  // Toggle state (Q flips)
  end

  // The same flip-flop logic can be implemented using a case statement:

  // always @(posedge clk) begin
  //   case ({
  //     J, K
  //   })
  //     2'b00:   Q <= Q;  // Hold state (no change)
  //     2'b01:   Q <= 1'b0;  // Reset state (Q = 0)
  //     2'b10:   Q <= 1'b1;  // Set state (Q = 1)
  //     2'b11:   Q <= ~Q;  // Toggle state (Q flips)
  //     default;
  //   endcase
  // end

endmodule
