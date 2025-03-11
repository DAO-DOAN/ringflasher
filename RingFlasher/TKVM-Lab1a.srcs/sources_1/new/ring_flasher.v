
module ring_flasher(
    input clk,rst_n,
    input repeat_in,
    output reg [15:0]led
);
reg [3:0]position;
reg [1:0]state;
reg [3:0] counter;
   
localparam INIT=2'b00;
localparam CLOCKWISE=2'b01;
localparam ANTICLOCKWISE=2'b10;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state<=INIT;
        led<=16'b0;
        counter<=0;
        position<=4'b0;
    end
    else begin
        case (state)
            INIT: begin
                if (repeat_in) begin
                    state<=CLOCKWISE;
                    counter<=0;
                end 
                else begin
                    state<=INIT;
                end   
            end
            CLOCKWISE: begin
                    led[position]<=~led[position];
                    if (counter>=7) begin
                        state<=ANTICLOCKWISE;
                        counter<=0;
                    end
                    else begin
                        counter<=counter+1;
                        position<=position+1'b1;
                    end
            end
            ANTICLOCKWISE: begin
                    led[position]<=~led[position];            
                    if (counter>=3) begin
                        if (led=={15'b0,1'b1}) begin
                            state<=INIT;
                        end
                        else begin
                            state<=CLOCKWISE;
                            counter<=0;  
                        end
                    
                    end
                    else begin
                        counter<=counter+1;
                        position<=position-1'b1;
                    end

            end            
            default: begin
                state<=INIT;
            end
        endcase
    end  
end
endmodule 