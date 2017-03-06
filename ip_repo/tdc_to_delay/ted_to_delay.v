module TDC_TO_DELAY (input clk, input resetn, 
    input [21:0] timedata, input data_flag, 
    output data_out_flag, output reg [14:0] delaydata);
    always@(clk) begin
        if(!resetn)
            delaydata <= 0;
        else begin
            if(data_flag) begin
                if(timedata < 2570) 
                    delaydata <= timedata[21:8];
                else if(timedata < 7690)
                    delaydata <= timedata[21:8] - 1;
                else if(timedata < 12810)
                    delaydata <= timedata[21:8] - 2;
                else if(timedata < 17940)
                    delaydata <= timedata[21:8] - 3;
                else if(timedata < 23060)
                    delaydata <= timedata[21:8] - 4;
                else if(timedata < 28180)
                    delaydata <= timedata[21:8] - 5;
                else if(timedata < 33300)
                    delaydata <= timedata[21:8] - 6;
                else if(timedata < 38430)
                    delaydata <= timedata[21:8] - 7;
                else if(timedata < 43550)
                    delaydata <= timedata[21:8] - 8;
                else if(timedata < 48670)
                    delaydata <= timedata[21:8] - 9;
                else if(timedata < 53800)
                    delaydata <= timedata[21:8] - 10;
                else if(timedata < 58920)
                    delaydata <= timedata[21:8] - 11;
                else if(timedata < 64040)
                    delaydata <= timedata[21:8] - 12;
                else if(timedata < 69170)
                    delaydata <= timedata[21:8] - 13;
                else if(timedata < 74290)
                    delaydata <= timedata[21:8] - 14;
                else if(timedata < 79410)
                    delaydata <= timedata[21:8] - 15;
                else if(timedata < 84540)
                    delaydata <= timedata[21:8] - 16;
                else if(timedata < 89660)
                    delaydata <= timedata[21:8] - 17;
                else if(timedata < 94780)
                    delaydata <= timedata[21:8] - 18;
                else if(timedata < 99900)
                    delaydata <= timedata[21:8] - 19;
                else
                    delaydata <= timedata[21:8] - 20;
            end
            else
                delaydata <= delaydata;
        end
    end
    GetSyncSignal_Async get_out_flag(clk, resetn, data_flag, data_out_flag);
endmodule
module GetSyncSignal_Async(input clk, input resetn, input signal_in, output signal_out);
        reg signal_temp1;
        reg signal_temp2;
        reg signal_temp3;
    
        always@(posedge clk) begin
            if(!resetn) begin
                signal_temp1 <=0;
                signal_temp2 <=0;
                signal_temp3 <=0;
            end
            else begin
                signal_temp1 <= signal_in;
                signal_temp2 <= signal_temp1;
                signal_temp3 <= signal_temp2;
            end
        end
    
        assign signal_out = signal_temp2 &(~signal_temp3);
endmodule
