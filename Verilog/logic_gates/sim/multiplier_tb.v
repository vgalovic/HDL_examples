`timescale 1ns / 1ps

module multiplier_tb ();

  reg [1:0] A, B;  // 2-bit inputs
  wire [3:0] C;  // 4-bit output

  // Instantiate the multiplier module
  multiplier uut (
      .A(A),
      .B(B),
      .C(C)
  );

  // Initialize inputs and generate test vectors
  initial begin
    // Display header
    $display("A  B  |  C (Product)");

    // Iterate through all combinations of A and B (16 combinations)
    for (integer i = 0; i < 16; i = i + 1) begin
      {A, B} = i;  // Assign the test vector
      #50;  // Wait for 50 ns
      $display("%b  %b  |  %b", A, B, C);
    end

    // End of simulation
    $finish;
  end

endmodule
