`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2025 02:38:59 PM
// Design Name: 
// Module Name: reset_testcase
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


module reset_testcase;
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
end    

initial begin
#5 n_rst=0;
#5 n_rst=1;
#100 n_rst=0;
#5 n_rst=1;
#1500 n_rst=0;
#30 n_rst=1;
end 
//main uut(.clk(clk),.reset_n(n_rst),.repeat_n(re),.led(led));  
ring_flasher uut(.clk(clk),.rst_n(n_rst),.led(led),.repeat_in(re));       
endmodule

