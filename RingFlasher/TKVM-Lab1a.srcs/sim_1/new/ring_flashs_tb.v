`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2025 09:33:56 AM
// Design Name: 
// Module Name: ring_flashs_tb
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


module ring_flashs_tb;
    reg clk, n_rst;
    wire [15:0]led;
    reg re;
ring_flasher uut(.clk(clk),.rst_n(n_rst),.led(led),.repeat_in(re)); 
//initial begin
//    clk=1'b0;
//end  
//always  begin
//   #5 clk=~clk;
//end
initial begin
    clk =0 ;
    forever #5 clk=~clk;
end
initial begin
    #5 n_rst=0;
    #5 n_rst=1;
    #5 re = 1;
    #50 re = 0;
    #200 re = 1;
    #30 re = 0;   
    #1000 re = 1;
    #200 re=0;
end    

initial begin
    #100 n_rst=0;
    #10 n_rst=1;
end 
    
endmodule
