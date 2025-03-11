module repeat_testcase;
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
    n_rst=0;
    #5 n_rst=1;
end    

initial begin
    #10 re=1;
    #5 re=0;
    #1000 re=1;
    #10 re=0;
end 
//main uut(.clk(clk),.reset_n(n_rst),.repeat_n(re),.led(led));  
ring_flasher uut(.clk(clk),.rst_n(n_rst),.led(led),.repeat_in(re));       
endmodule
