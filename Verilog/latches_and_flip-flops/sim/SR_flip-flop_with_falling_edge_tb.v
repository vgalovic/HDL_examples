`timescale 1ns / 1ps

module SR_flip_flop_with_falling_edge_tb ();

  reg  clk;
  reg  S;
  reg  R;
  wire Q;

  SR_flip_flop_with_falling_edge dut (
      .clk(clk),
      .S  (S),
      .R  (R),
      .Q  (Q)
  );

  // Ensure clk starts with a defined value
  initial clk = 0;

  // Clock generation: Period = 100 ns (Toggles every 50 ns)
  always #50 clk = ~clk;

  initial begin
    // Initialize signals
    S = 0;
    R = 0;

    // Apply test cases
    #100 S = 1;
    R = 0;  // Set condition
    #100 S = 0;
    R = 0;  // Hold condition
    #100 S = 0;
    R = 1;  // Reset condition
    #100 S = 1;
    R = 1;  // Invalid state
    #100 S = 1;
    R = 0;  // Set condition

    // Finish simulation
    #200 $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time = %0d | clk = %b | S = %b | R = %b | Q = %b", $time, clk, S, R, Q);
  end

endmodule
