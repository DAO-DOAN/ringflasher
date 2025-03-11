`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2025 03:24:00 PM
// Design Name: 
// Module Name: reset_repeat_same
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reset_repeat_same;
    reg clk, n_rst;
//    reg active_in;
//    wire [3:0]position;
    wire [15:0]led;
    reg re;
//    wire active;
always  begin
   #5 clk=~clk;
end

initial begin
    clk=1;
    re=1;
    n_rst=0;
end    

initial begin
#5 re=0;n_rst=1;
#1000 re=1;n_rst=0;
#50 re=0;n_rst=1;
end 
//main uut(.clk(clk),.reset_n(n_rst),.repeat_n(re),.led(led));  
ring_flasher uut(.clk(clk),.rst_n(n_rst),.led(led),.repeat_in(re));
endmodule
