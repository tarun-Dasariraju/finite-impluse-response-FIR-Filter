`timescale 1ns / 1ps
///finite impluse response (FIR) filter
module fir_filter(
    input clk,
    input reset,
    input signed [7:0] x,
    output reg signed [15:0] y
);

parameter h0 = 1;
parameter h1 = 2;
parameter h2 = 3;
parameter h3 = 4;

reg signed [7:0] d0, d1, d2, d3;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        d0 <= 0;
        d1 <= 0;
        d2 <= 0;
        d3 <= 0;
        y <= 0;
    end

    else
    begin
        d3 <= d2;
        d2 <= d1;
        d1 <= d0;
        d0 <= x;

        y <= (h0*d0) + (h1*d1) + (h2*d2) + (h3*d3);
    end
end

endmodule
