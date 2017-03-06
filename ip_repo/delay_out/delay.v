module DELAY_OUT (input clk, input resetn, input [31:0] tstart_count,
    input init, input tdc_data_flag, input [14:0] tdc_data,
    input [14:0] cycle, input [13:0] tstart_width, 
    input [14:0] delay_1, input [13:0] out_1_width, 
    input [14:0] delay_2, input [13:0] out_2_width, 
    input [14:0] delay_3, input [13:0] out_3_width, 
    input [14:0] delay_4, input [13:0] out_4_width, 
    output tstart, output out_1, output out_2,
    output out_3, output out_4, output ch1);

    reg [14:0] out_1_delay;
    wire [14:0] out_2_delay;
    wire [14:0] out_3_delay;
    wire [14:0] out_4_delay;

    reg [31:0] time_counter;
    always @(posedge clk) begin
        if(!resetn)
            time_counter <= 0;
        else if(time_counter == cycle)
            time_counter <= 1;
        else
            time_counter <= time_counter + 1;
    end
    
    always @ (posedge clk) begin
        if(!resetn)
            out_1_delay <= 0;
        else if(init)
            out_1_delay <= delay_1;
        else if(tdc_data_flag)
            out_1_delay <= tdc_data;
        else
            out_1_delay <= out_1_delay;
    end

    assign out_2_delay = out_1_delay + delay_2;
    assign out_3_delay = out_1_delay + delay_3;
    assign out_4_delay = out_1_delay + delay_4;

    assign tstart = (time_counter <= tstart_width)? 1'b1 : 1'b0;
    assign out_1 = ((time_counter > out_1_delay) && (time_counter <= out_1_delay + out_1_width))? 1'b1 : 1'b0; 
    assign out_2 = ((time_counter > out_2_delay) && (time_counter <= out_2_delay + out_2_width))? 1'b1 : 1'b0; 
    assign out_3 = ((time_counter > out_3_delay) && (time_counter <= out_3_delay + out_3_width))? 1'b1 : 1'b0; 
    assign out_4 = ((time_counter > out_4_delay) && (time_counter <= out_4_delay + out_4_width))? 1'b1 : 1'b0; 
    mock_ch1 mock( clk,  resetn, tstart_count,  data_flag,
   time_counter,  ch1);
endmodule

module mock_ch1(input clk, input resetn, input [31:0] tstart_count, input data_flag,
  input [31:0] time_counter, output ch1);
  reg [14:0] delay;
      always @(posedge clk) begin
        if(!resetn)
            delay <= 0;
        else begin
          if(tstart_count <= 500)
            delay <= 10_00;
          else if(tstart_count == 1000)
            delay <= 30_00;
          else if(tstart_count == 1500)
            delay <= 20_00; 
          else if(tstart_count == 2000)
            delay <= 40_00;
          else if(tstart_count == 2500)
            delay <= 60_00;
          else if(tstart_count == 3000)
            delay <= 50_00;
          else if(tstart_count == 4000)
            delay <= 70_00;
          else if(tstart_count == 5000)
            delay <= 90_00;
          else if(tstart_count == 6000)
            delay <= 80_00;
          else if(tstart_count == 7000)
            delay <= 110_00;          
          else
            delay <= delay + 1;
        end
    end
     assign ch1 = ((time_counter > delay) && (time_counter <= delay + 3))? 1'b1 : 1'b0;    
endmodule
