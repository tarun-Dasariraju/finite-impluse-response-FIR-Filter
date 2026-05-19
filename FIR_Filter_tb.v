`timescale 1ns / 1ps
///testbench
module fir_filter_tb;

reg clk;
reg reset;
reg signed [7:0] x;
wire signed [15:0] y;

fir_filter uut(
    .clk(clk),
    .reset(reset),
    .x(x),
    .y(y)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    x = 0;

    #10 reset = 0;

    #10 x = 1;
    #10 x = 2;
    #10 x = 3;
    #10 x = 4;
    #10 x = 5;
    #10 x = 6;
    #10 x = 7;
    #10 x = 8;

    #50 $finish;
end

initial
begin
    $monitor("Time=%0t Input=%d Output=%d", $time, x, y);
end

endmodule
