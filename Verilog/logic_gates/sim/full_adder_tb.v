`timescale 1ns / 1ps

module full_adder_tb ();

  reg A, B, Cin;
  wire S, Cout;

  full_adder dut (
      .A(A),
      .B(B),
      .Cin(Cin),
      .S(S),
      .Cout(Cout)
  );

  // Initialize the inputs and generate the test vectors
  initial begin
    // Display the header
    $display("A B Cin | Sum Cout");

    // Apply test vectors with 100 ns interval
    A   = 0;
    B   = 0;
    Cin = 0;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

    A   = 0;
    B   = 1;
    Cin = 0;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

    A   = 1;
    B   = 0;
    Cin = 0;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

    A   = 0;
    B   = 0;
    Cin = 1;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

    A   = 1;
    B   = 2;
    Cin = 1;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b %b | %b %b", A, B, Cin, S, Cout);

    // End of simulation
    $finish;
  end

endmodule
