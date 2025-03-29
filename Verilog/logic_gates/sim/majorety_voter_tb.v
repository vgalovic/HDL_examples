`timescale 1ns / 1ps

module majorety_voter_tb ();

  reg x, y, z;
  wire v;

  majorety_voter dut (
      .x(x),
      .y(y),
      .z(z),
      .v(v)
  );

  // Initialize the inputs and generate the test vectors
  initial begin
    // Display the header
    $display("X Y Z | Vote");

    // Apply test vectors with 100 ns interval
    x = 0;
    y = 0;
    z = 0;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b %b | %b", x, y, z, v);

    x = 0;
    y = 0;
    z = 1;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b %b | %b", x, y, z, v);

    x = 0;
    y = 1;
    z = 0;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b %b | %b", x, y, z, v);

    x = 1;
    y = 1;
    z = 0;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b %b | %b", x, y, z, v);

    x = 1;
    y = 1;
    z = 1;
    #100;  // Wait 100 time units (100 ns)
    $display("%b %b %b | %b", x, y, z, v);

    // End of simulation
    $finish;
  end
endmodule
