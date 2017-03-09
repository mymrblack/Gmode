/*
frc_cal u1(
 .ref_clk( ),
 .sig_clk( ),
 .ref_c ( ),
 .sig_c ( ),
 .clr( ),
 .cal_en( )
);
*/
module frc_cal(
input ref_clk,
input sig_clk,
output reg [31:0] ref_c ,
output reg [31:0] sig_c , 
input clr,
input cal_en,
input B
);
reg cal_enr ; 

always @ (posedge sig_clk or posedge clr) begin
        if (clr) 
            cal_enr <= 0;
        else 
            cal_enr <= cal_en ;
    end
 
always @ (posedge ref_clk or posedge clr)begin
    if (clr)
        ref_c<=0;
    else if (cal_enr)
            ref_c <= ref_c + 1;
         else
            ref_c <= ref_c;
end
 
always @ (posedge sig_clk or posedge clr) begin
    if (clr)
       sig_c<=0;
    else  if (cal_enr) begin
       if(B)
          sig_c <= sig_c + 1;
       else if(~B)
          sig_c <= sig_c - 1;
       else
          sig_c <= sig_c;
    end 
end
endmodule
