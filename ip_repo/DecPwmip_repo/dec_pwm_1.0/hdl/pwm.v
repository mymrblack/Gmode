
/*

output [7:0] LED ,

*/


 /*
 
 pwm LED0( .clk( clk ) , .pwm_val( slv_reg0[7:0] ) , .pwm_pin( LED[0] )  );
 pwm LED1( .clk( clk ) , .pwm_val( slv_reg1[7:0] ) , .pwm_pin( LED[1] )  );
 pwm LED2( .clk( clk ) , .pwm_val( slv_reg2[7:0] ) , .pwm_pin( LED[2] )  );
 pwm LED3( .clk( clk ) , .pwm_val( slv_reg3[7:0] ) , .pwm_pin( LED[3] )  );
 pwm LED4( .clk( clk ) , .pwm_val( slv_reg4[7:0] ) , .pwm_pin( LED[4] )  );
 pwm LED5( .clk( clk ) , .pwm_val( slv_reg5[7:0] ) , .pwm_pin( LED[5] )  );
 pwm LED6( .clk( clk ) , .pwm_val( slv_reg6[7:0] ) , .pwm_pin( LED[6] )  );
 pwm LED7( .clk( clk ) , .pwm_val( slv_reg7[7:0] ) , .pwm_pin( LED[7] )  );
 
 */

/* 

 pwm u1(
        .clk( ) ,
        .pwm_val( ) ,
        .pwm_pin( )
    );

*/

`define DELAY_BITS 6 

/*
// 1 - wire DAC 
module pwm(
        input clk,
        input [7:0] pwm_val ,
        output reg pwm_pin
    );
 
    reg [`DELAY_BITS+7:0] runner =0 ;
 
    always @ (posedge clk)     runner <= runner+1 ;	
    always @ (posedge clk) pwm_pin <=  runner[7+`DELAY_BITS:`DELAY_BITS] < pwm_val ;
	
endmodule

module pwm1(
        input clk,
        input [7:0] pwm_val ,
        output reg pwm_pin
    );

    reg [6:0] delay_cntr  = 0;
    reg [7:0] runner =0 ;

    always @ (posedge clk)  delay_cntr <= delay_cntr + 1  ;
    always @ (posedge clk) if (delay_cntr ==0)     runner <= runner+1 ;	
    always @ (posedge clk) pwm_pin <=  runner  < pwm_val ;
 
endmodule

*/

module pwm (
        input clk,
        input [7:0] pwm_val ,
        input [31:0] divide_num,
        input pwm_en,
        output reg pwm_pin
    );

    reg [31:0] delay_cntr;
    reg [7:0] runner =0 ;   
    
// 100M/500   => 0,1,....499 
    always @ (posedge clk)
    begin 
         if ( delay_cntr == divide_num ) 
             delay_cntr <= 0;
         else
             delay_cntr <= delay_cntr + 1  ;
    end
    
    always @ (posedge clk) 
    begin
        if ( delay_cntr == 0   )   
             runner <= runner + 1 ;	
    end
    
    always @ (posedge clk)
    begin
        if(~pwm_en)
            pwm_pin <= 0;
        else
            pwm_pin <= ( runner < pwm_val );
    end
 
endmodule

/*
module sim_pwm ;

reg clk;
wire led ; 
reg [7:0] pwm_val ;

always #5 clk = ~clk ; //100M CLOCK

initial begin 
clk=0;  pwm_val=0;
#6553600  pwm_val=128;
#6553600  pwm_val=255;
#6553600  ;
$stop ; 
end 

 pwm u1(
        .clk(clk ) ,
        .pwm_val(pwm_val ) ,
        .pwm_pin(led )
    );


endmodule 
*/




