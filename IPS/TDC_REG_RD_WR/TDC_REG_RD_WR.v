module TDC_REG_RD_WR(input clk, input resetn, 
        input sfWrFlag_in, input sfRdFlag_in, input [3:0] addr_in, 
        input EF1_in, input EF2_in,
        input [27:0] sfData_in, inout [27:0] tdcDataReg_inout,
        output csn_out, output wrn_out, output rdn_out, output [3:0] addr_out,
        output [31:0]timeData_out, output [31:0] sfData_out, output rdOverFlag_out);
    
        wire [27:0] dataWriteOut;
        wire csn_rd, csn_wr;
        wire [3:0] rd_addr;
        wire [3:0] wr_addr;
        wire EF1_toRead, rdLockFlag, efRdFlag;
        wire [1:0] rdStep;
    
        assign tdcDataReg_inout = dataWriteOut;
        assign csn_out =  sfWrFlag_in? csn_wr: csn_rd;
        assign addr_out =  sfWrFlag_in? wr_addr: rd_addr;
    
        RdAndWrSequenceCtrl rdAndWrCtrl(.clk(clk), .resetn(resetn),
            .sfRdFlag_in(sfRdFlag_in), .sfWrFlag_in(sfWrFlag_in),
            .EF1_in(EF1_in), .EF2_in(EF2_in), 
            .rdStep_in(rdStep), .rdLockFlag_in(rdLockFlag), 
            .EF1_out(EF1_toRead), .efRdFlag_out(efRdFlag));
    
        TdcRegRead tdcRegRead(.clk(clk), .resetn(resetn), 
            .EF1_in(EF1_toRead), .efFlag_in(efRdFlag), .sfRdFlag_in(sfRdFlag_in),
            .addr_in(addr_in), .data_in(tdcDataReg_inout),//addr_in[3:0], data_in[27:0] 
            .sfRdData_out(sfData_out), .timeData_out(timeData_out),//sfRdData_out[31:0], timeData_out[27:0] 
            .lockFlag_out(rdLockFlag), .step_out(rdStep),//step_out[1:0]
            .csn_out(csn_rd), .rdn_out(rdn_out), .addr_out(rd_addr),//addr_out[3:0] 
            .rdOverFlag_out(rdOverFlag_out));
    
        TdcRegWrite    tdcRegWrite(.clk(clk), .resetn(resetn),
            .sfWrFlag_in(sfWrFlag_in), .addr_in(addr_in), .data_in(sfData_in),
            .wrData_out(dataWriteOut), .csn_out(csn_wr), 
            .wrn_out(wrn_out), .addr_out(wr_addr));
endmodule
    
`define IS_TIME_DATA   (addr_out == 8) | (addr_out == 9)
`define RESET      4'b1xxx
`define READ_STEP1 4'b0100
`define READ_STEP2 4'b0101
`define READ_STEP3 4'b0110
`define READ_STEP4 4'b0111
module TdcRegRead (input clk, input resetn, 
        input EF1_in, input efFlag_in, input sfRdFlag_in, 
        input [3:0] addr_in, input [27:0]data_in,
        output reg[31:0] sfRdData_out, output reg [31:0]timeData_out, 
        output reg csn_out, output lockFlag_out, output [1:0]step_out,
        output reg rdn_out, output reg [3:0] addr_out, output reg rdOverFlag_out);
    
        wire sfRdTrig, efTrig, lockFlag, rdTrig;
        wire [1:0] step;
    
        assign lockFlag_out = lockFlag;
        assign step_out = step;
        assign rdTrig = (sfRdTrig | efTrig)? 1'b1: 1'b0; 
     
        always@(posedge clk) begin
            casex({!resetn, lockFlag, step}) 
                `RESET: begin
                    csn_out <= 1'b1;
                    rdn_out <= 1'b1;
                    addr_out <= 4'b1111;
                    sfRdData_out <= 32'b0;
                    timeData_out <= 32'b0;
                    rdOverFlag_out <= 1'b0;
                    end
                `READ_STEP1: begin
                    if(sfRdFlag_in)
                      addr_out <= addr_in;
                    else begin
                      if(EF1_in)
                        addr_out <= 4'h8;
                      else
                        addr_out <= 4'h9;
                    end
                  end
                `READ_STEP2: begin
                    csn_out <= 1'b0;
                    rdn_out <= 1'b0;
                    end
                `READ_STEP3: begin
                    csn_out <= 1'b0;
                    rdn_out <= 1'b0;
                    end
                `READ_STEP4: begin
                    csn_out <= 1'b1;
                    rdn_out <= 1'b1;
                    if(sfRdFlag_in) 
                        sfRdData_out <= {addr_out, data_in};
                    if(`IS_TIME_DATA) begin
                        timeData_out <= {addr_out, data_in};
                        rdOverFlag_out <= 1'b1;
                    end                   
                    else begin
                        timeData_out <= timeData_out;
                    end
                    addr_out <= 4'hf;
                   end
                default : begin
                    csn_out <= csn_out;
                    rdn_out <= rdn_out;
                    addr_out <= addr_out;
                    timeData_out <= timeData_out;
                    rdOverFlag_out <= 1'b0;
                    if(sfRdFlag_in)
                        sfRdData_out <= sfRdData_out;
                    else
                        sfRdData_out <= 32'b0;
                end
            endcase
        end
    
        GetSyncSignal_Sync  getEfTrigger(.clk(clk), .resetn(resetn), 
            .signal_in(efFlag_in), .signal_out(efTrig));
    
        GetSyncSignal_Sync  getsfRdTrigger(.clk(clk), .resetn(resetn), 
            .signal_in(sfRdFlag_in), .signal_out(sfRdTrig));
    
        TimingStepGenerator    getTimingStep(.clk(clk), .resetn(resetn), 
            .trigger(rdTrig), .step_out(step));
    
        TimingFlagGenerator getTimingFlag(.clk(clk), .resetn(resetn), 
            .trigger(rdTrig), .step(step), .flag_out(lockFlag));
endmodule

`define WRITE_STEP1 4'b0100
`define WRITE_STEP2 4'b0101
`define WRITE_STEP3 4'b0110
`define WRITE_STEP4 4'b0111
`define HIGH_Z        28'hzzzz

module TdcRegWrite (input clk, input resetn, input sfWrFlag_in, input [3:0] addr_in, input [27:0]data_in,
    output [27:0] wrData_out, output reg csn_out, output reg wrn_out, output reg [3:0] addr_out);

    reg [27:0] data_out;
    wire [1:0] step;
    wire wrFlag;
    wire wrTrig;

    always@(posedge clk) begin
        casex({!resetn, wrFlag, step}) 
            `RESET: begin
                csn_out <= 1'b1;
                wrn_out <= 1'b1;
                addr_out <= 4'b1111;
                data_out <= 28'b0;
            end
            `WRITE_STEP1: begin
                addr_out <= addr_in;
                data_out <= data_in;
            end
            `WRITE_STEP2: begin
                csn_out <= 1'b0;
                wrn_out <= 1'b0;
            end
            `WRITE_STEP3: begin
                csn_out <= 1'b1;
                wrn_out <= 1'b1;
            end
            `WRITE_STEP4: data_out <= 28'b0;
            default : begin
                csn_out <= csn_out;
                wrn_out <= wrn_out;
                addr_out <= addr_out;
                data_out <= data_in;
            end
        endcase
    end

    assign wrData_out = wrFlag? data_out:`HIGH_Z;//TDC data reg is a inout pin, so if write is no use, keep it in high_z

    GetSyncSignal_Sync  getWrTrigger(.clk(clk), .resetn(resetn), .signal_in(sfWrFlag_in), .signal_out(wrTrig));
    TimingStepGenerator    getTimingStep(.clk(clk), .resetn(resetn), .trigger(wrTrig), .step_out(step));
    TimingFlagGenerator getTimingFlag(.clk(clk), .resetn(resetn), .trigger(wrTrig), .step(step), .flag_out(wrFlag));

endmodule

`define IS_IN_READ_STEP4  rdLockFlag_in& (rdStep_in == 2'b11) 
module RdAndWrSequenceCtrl(input clk, input resetn,
    input sfRdFlag_in, input sfWrFlag_in,
    input EF1_in, input EF2_in,  input [1:0] rdStep_in, input rdLockFlag_in, 
    output reg EF1_out, output reg efRdFlag_out);
    
    reg EF2;
        
        /*********************************************************
        * Handle with the EF1_out and EF2 signal.
        * It get these two signal in one time, after read the FIFO1(FIFO2)data,
        * the EF1_out(EF2) should be reset. 
        * The sfRdFlag has the highest priority, so when it come, 
        * EF1_out and EF2 will be ignored. 
        * The handle in (`IS_IN_READ_STEP4) is because
        * the EF1_out and EF2 should be read sequencely(when EF1_out and EF2 were both set) ,
        * so the data in both two fifo can't be lost.This is 
        * very important so it should be handled like this.
        * *********************************************************/   
        always@(posedge clk) begin
            if(!resetn | sfRdFlag_in | sfWrFlag_in) begin
                EF1_out <= 1'b0;
                EF2 <= 1'b0;
            end
            else begin
                if(!rdLockFlag_in & !EF1_out & !EF2) begin
                    EF1_out <= EF1_in;
                    EF2 <= EF2_in;
                end
                else begin
                    if(`IS_IN_READ_STEP4) begin
                        if(EF1_out) 
                            EF1_out <= 1'b0;
                        else 
                            EF2 <= 1'b0;
                    end
                    else begin
                        EF1_out <= EF1_out;
                        EF2 <= EF2;     
                    end           
                end
            end
        end 
        /************************ END ***************************/
    
        /*********************************************************
        * Get the efRdFlag_out to trigger the Read timing sequence.
        * The handle in (`IS_IN_READ_STEP4& EF1_out& EF2) is because
        * the EF1_out and EF2 should be read sequencely(when EF1_out and EF2 were both set) ,
        * so the data in both two fifo can't be lost.
        * *********************************************************/
        always@(posedge clk)begin
           if(!resetn)
               efRdFlag_out <= 1'b0;
           else begin
               if(!rdLockFlag_in)begin
                   efRdFlag_out <= (EF1_out|EF2);
               end
               else begin
                   if(`IS_IN_READ_STEP4& EF1_out& EF2)
                       efRdFlag_out <= 1'b1;
                   else
                       efRdFlag_out <= 0;
               end
           end
       end
        /************************ END ***************************/
    
       assign rdFlag_out = sfRdFlag_in;
       assign wrFlag_out = sfWrFlag_in;
endmodule

module TimingStepGenerator(input clk, input resetn, input trigger, output reg [1:0] step_out);
        always@(posedge clk)
            if(!resetn| trigger| (step_out == 2'b11)) 
                step_out <= 2'b00;
            else
                step_out <= step_out + 1;
endmodule
        
module TimingFlagGenerator(input clk, input resetn, input trigger, input [1:0] step, output reg flag_out);
        always@(posedge clk) begin
            if(!resetn)
                flag_out <= 1'b0;
            else if(trigger == 1'b1)
                    flag_out <= 1'b1;
                else if (step == 2'b11)
                        flag_out <= 1'b0;
                     else
                        flag_out <= flag_out;
        end
endmodule
    
    
module GetSyncSignal_Sync(input clk, input resetn, input signal_in, output signal_out);
        reg signal_temp1;
        always@(posedge clk) begin
            if(!resetn) 
                signal_temp1 <= 1'b0;
            else 
                signal_temp1 <= signal_in;
        end
    
        assign signal_out = signal_in &(~signal_temp1);
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
