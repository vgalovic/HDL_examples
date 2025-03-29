`timescale 1ns / 1ps

module half_adder_tb ();

  reg a, b;
  wire s, c;

  half_adder dut (
      .a(a),
      .b(b),
      .s(s),
      .c(c)
  );

  // Initialize the inputs and generate the test vectors
  initial begin
    // Display the header
    $display("A B | Sum Carry");

    // Apply test vectors with 100 ns interval
    a = 0;
    b = 0;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b | %b %b", a, b, s, c);

    a = 0;
    b = 1;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b | %b %b", a, b, s, c);

    a = 1;
    b = 0;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b | %b %b", a, b, s, c);

    a = 1;
    b = 1;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b | %b %b", a, b, s, c);

    // End of simulation
    $finish;
  end

endmodule
