`define TEST_TIME 150_00 
`define TEST_PERIOD 200_00 
module TDC_CTRL_G(input clk, input resetn, input tstart_tri,
    output stopDis1, output stopDis2, output stopDis3, output stopDis4,
    output masterRst, output dataCanBeSave);
    wire [31:0] timeCount;

    TimeCounter timeCounter(.clk(clk), .resetn(resetn), 
        .triSignal(tstart_tri), .out_reg(timeCount));

    assign stopDis1 = ((timeCount > `TEST_TIME) && (timeCount <= `TEST_PERIOD))? 1'b1: 1'b0;
    assign stopDis2 = ((timeCount > `TEST_TIME) && (timeCount <= `TEST_PERIOD))? 1'b1: 1'b0;
    assign stopDis3 = ((timeCount > `TEST_TIME) && (timeCount <= `TEST_PERIOD))? 1'b1: 1'b0;
    assign stopDis4 = ((timeCount > `TEST_TIME) && (timeCount <= `TEST_PERIOD))? 1'b1: 1'b0;
    assign dataCanBeSave = (timeCount == `TEST_TIME + 1_00)? 1'b1: 1'b0;
    assign masterRst = ((timeCount >= 160_00) && (timeCount < 160_30))? 1'b1: 1'b0;
    
endmodule

`define FIFO_SIZE 8192
module TstartCounter(input clk, input resetn, 
    input plusSignal, 
    output reg [31:0] out_reg);
  
    wire overSignal;

    always@(posedge clk) begin
        casex({!resetn, plusSignal, overSignal}) 
            3'b1xx: out_reg <= 31'b0;
            3'b011: out_reg <= 31'b0;
            3'b010: out_reg <= out_reg + 1'b1;
            3'b00x: out_reg <= out_reg;
        endcase
    end
    assign overSignal = (out_reg ==  `FIFO_SIZE - 1)? 1'b1: 1'b0;
endmodule

//tested.
module TimeCounter(input clk, input resetn, 
    input triSignal, output reg [31:0] out_reg);
    always@(posedge clk) begin
        if(!resetn)
            out_reg <= 0;
        else begin
            if(triSignal)
                out_reg <= 1;
            else if(out_reg == `TEST_PERIOD)
                out_reg <= 0;
            else if(out_reg == 0)
                out_reg <= out_reg;
            else 
                out_reg <= out_reg + 1;
        end
    end
endmodule




