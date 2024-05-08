module tb_seq_detector;

reg x, clk, reset;
wire z;

// Instantiate the seq_detector module
seq_detector dut (
    .x(x),
    .clk(clk),
    .reset(reset),
    .z(z)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    // Initialize inputs
    x = 0;
    clk = 0;
    reset = 1;

    // Reset sequence detector
    #10 reset = 0;

    // Test case 1: Test sequence 1010
    #20 x = 1; #10 x = 0; #10 x = 1; #10 x = 0; // Input sequence 1010

    // Test case 2: Test sequence 1110
    #20 x = 1; #10 x = 1; #10 x = 1; #10 x = 0; // Input sequence 1110

    // Add more test cases as needed...

    // End simulation
    #100 $finish;
end

endmodule


