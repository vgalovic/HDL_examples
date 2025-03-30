`timescale 1ns / 1ps

module mux4to1_tb ();

  // Declare inputs as reg and outputs as wire
  reg x0, x1, x2, x3;
  reg [1:0] sel;
  wire y0, y1;

  // Instantiate the Device Under Test (DUT)
  mux4to1 dut (
      .x0 (x0),
      .x1 (x1),
      .x2 (x2),
      .x3 (x3),
      .sel(sel),
      .y0 (y0),
      .y1 (y1)
  );

  // Initial block to apply stimulus
  initial begin
    // Apply initial values to inputs
    x0  = 0;
    x1  = 0;
    x2  = 0;
    x3  = 0;
    sel = 2'b00;

    // Wait for 100ns for stability
    #100;

    // Test all combinations of x0, x1, x2, x3
    // Test for each value of sel and monitor y0 and y1

    // Test with x0 = 1
    x0  = 1;
    x1  = 0;
    x2  = 0;
    x3  = 0;
    sel = 2'b00;
    #100;

    // Test with x1 = 1
    x0  = 0;
    x1  = 1;
    x2  = 0;
    x3  = 0;
    sel = 2'b01;
    #100;

    // Test with x2 = 1
    x0  = 0;
    x1  = 0;
    x2  = 1;
    x3  = 0;
    sel = 2'b10;
    #100;

    // Test with x3 = 1
    x0  = 0;
    x1  = 0;
    x2  = 0;
    x3  = 1;
    sel = 2'b11;
    #100;

    // Change selector values and observe output behavior
    sel = 2'b00;
    #100;
    sel = 2'b01;
    #100;
    sel = 2'b10;
    #100;
    sel = 2'b11;
    #100;

    $finish;
  end

endmodule

