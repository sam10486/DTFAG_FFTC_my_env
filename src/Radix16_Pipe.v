`include "define.v"
//5-th pipeline                                                          
module Radix16_Pipe(RA0_out,                                             
			        RA1_out,                                              
			        RA2_out,                                              
			        RA3_out,                                              
			        RA4_out,                                              
			        RA5_out,                                              
			        RA6_out,                                              
			        RA7_out,                                              
			        RA8_out,                                              
			        RA9_out,                                              
			        RA10_out,                                             
			        RA11_out,                                             
			        RA12_out,                                             
			        RA13_out,                                             
			        RA14_out,                                             
			        RA15_out,                                             
                    RA0_in,                                              
			        RA1_in,                                               
			        RA2_in,                                               
			        RA3_in,                                               
			        RA4_in,                                               
			        RA5_in,                                               
			        RA6_in,                                               
			        RA7_in,                                               
			        RA8_in,                                               
			        RA9_in,                                               
			        RA10_in,                                              
			        RA11_in,                                              
			        RA12_in,                                              
			        RA13_in,                                              
			        RA14_in,                                              
			        RA15_in,                                              
		            N_in,                                                 
                    rst_n,                                               
                    clk                                                  
                    ) ;                                                  
                                                                         
parameter P_WIDTH     = 64 ;  
parameter P_ZERO  	  = 64'd0;    
                             
                                                                         
output[P_WIDTH-1:0] RA0_out ;                                            
output[P_WIDTH-1:0] RA1_out ;                                            
output[P_WIDTH-1:0] RA2_out ;                                            
output[P_WIDTH-1:0] RA3_out ;                                            
output[P_WIDTH-1:0] RA4_out ;                                            
output[P_WIDTH-1:0] RA5_out ;                                            
output[P_WIDTH-1:0] RA6_out ;                                            
output[P_WIDTH-1:0] RA7_out ;                                            
output[P_WIDTH-1:0] RA8_out ;                                            
output[P_WIDTH-1:0] RA9_out ;                                            
output[P_WIDTH-1:0] RA10_out ;                                           
output[P_WIDTH-1:0] RA11_out ;                                           
output[P_WIDTH-1:0] RA12_out ;                                           
output[P_WIDTH-1:0] RA13_out ;                                           
output[P_WIDTH-1:0] RA14_out ;                                           
output[P_WIDTH-1:0] RA15_out ;                                           
                                                                         
input [P_WIDTH-1:0] RA0_in ;                                             
input [P_WIDTH-1:0] RA1_in ;                                             
input [P_WIDTH-1:0] RA2_in ;                                             
input [P_WIDTH-1:0] RA3_in ;                                             
input [P_WIDTH-1:0] RA4_in ;                                             
input [P_WIDTH-1:0] RA5_in ;                                             
input [P_WIDTH-1:0] RA6_in ;                                             
input [P_WIDTH-1:0] RA7_in ;                                             
input [P_WIDTH-1:0] RA8_in ;                                             
input [P_WIDTH-1:0] RA9_in ;                                             
input [P_WIDTH-1:0] RA10_in ;                                            
input [P_WIDTH-1:0] RA11_in ;                                            
input [P_WIDTH-1:0] RA12_in ;                                            
input [P_WIDTH-1:0] RA13_in ;                                            
input [P_WIDTH-1:0] RA14_in ;                                            
input [P_WIDTH-1:0] RA15_in ;                                            
input [P_WIDTH-1:0] N_in ;                                               
input               rst_n ;                                              
input               clk ;                                                
                                                                         
//stage0                                                                 
wire  [P_WIDTH-1:0] BU_S0_0_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_0_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_1_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_1_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_2_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_2_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_3_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_3_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_4_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_4_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_5_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_5_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_6_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_6_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_7_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S0_7_R1_out_wire;                                 
reg  [P_WIDTH-1:0] R0_0;                                                
reg  [P_WIDTH-1:0] R1_0;                                                
reg  [P_WIDTH-1:0] R2_0;                                                
reg  [P_WIDTH-1:0] R3_0;                                                
reg  [P_WIDTH-1:0] R4_0;                                                
reg  [P_WIDTH-1:0] R5_0;                                                
reg  [P_WIDTH-1:0] R6_0;                                                
reg  [P_WIDTH-1:0] R7_0;                                                
reg  [P_WIDTH-1:0] R8_0;                                                
//wire  [P_WIDTH-1:0] R9_0;                                                
//wire  [P_WIDTH-1:0] R10_0;                                               
//wire  [P_WIDTH-1:0] R11_0;                                               
//wire  [P_WIDTH-1:0] R12_0;                                               
//wire  [P_WIDTH-1:0] R13_0;                                               
//wire  [P_WIDTH-1:0] R14_0;                                               
//wire  [P_WIDTH-1:0] R15_0;                                               
 //---------------------                                                 
 //STAGE 1   
reg  [P_WIDTH-1:0] R0_0_D_tmp;                                              
reg  [P_WIDTH-1:0] R1_0_D_tmp;                                              
reg  [P_WIDTH-1:0] R2_0_D_tmp;                                              
reg  [P_WIDTH-1:0] R3_0_D_tmp;                                              
reg  [P_WIDTH-1:0] R4_0_D_tmp;                                              
reg  [P_WIDTH-1:0] R5_0_D_tmp;                                              
reg  [P_WIDTH-1:0] R6_0_D_tmp;                                              
reg  [P_WIDTH-1:0] R7_0_D_tmp;                                              
reg  [P_WIDTH-1:0] R8_0_D_tmp;

reg  [P_WIDTH-1:0] R0_0_D;                                              
reg  [P_WIDTH-1:0] R1_0_D;                                              
reg  [P_WIDTH-1:0] R2_0_D;                                              
reg  [P_WIDTH-1:0] R3_0_D;                                              
reg  [P_WIDTH-1:0] R4_0_D;                                              
reg  [P_WIDTH-1:0] R5_0_D;                                              
reg  [P_WIDTH-1:0] R6_0_D;                                              
reg  [P_WIDTH-1:0] R7_0_D;                                              
reg  [P_WIDTH-1:0] R8_0_D;                                              
wire  [P_WIDTH-1:0] R9_0_D;                                              
wire  [P_WIDTH-1:0] R10_0_D;                                             
wire  [P_WIDTH-1:0] R11_0_D;                                             
wire  [P_WIDTH-1:0] R12_0_D;                                             
wire  [P_WIDTH-1:0] R13_0_D;                                             
wire  [P_WIDTH-1:0] R14_0_D;                                             
wire  [P_WIDTH-1:0] R15_0_D;                                             
wire  [P_WIDTH-1:0] BU_S1_0_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_0_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_1_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_1_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_2_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_2_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_3_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_3_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_4_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_4_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_5_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_5_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_6_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_6_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_7_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S1_7_R1_out_wire;                                 
reg  [P_WIDTH-1:0] R0_1;                                                
reg  [P_WIDTH-1:0] R1_1;                                                
reg  [P_WIDTH-1:0] R2_1;                                                
reg  [P_WIDTH-1:0] R3_1;                                                
reg  [P_WIDTH-1:0] R4_1;                                                
//wire  [P_WIDTH-1:0] R5_1;                                                
//wire  [P_WIDTH-1:0] R6_1;                                                
//wire  [P_WIDTH-1:0] R7_1;                                                
reg  [P_WIDTH-1:0] R8_1;                                                
reg  [P_WIDTH-1:0] R9_1;                                                
reg  [P_WIDTH-1:0] R10_1;                                               
reg  [P_WIDTH-1:0] R11_1;                                               
reg  [P_WIDTH-1:0] R12_1;                                               
//wire  [P_WIDTH-1:0] R13_1;                                               
//wire  [P_WIDTH-1:0] R14_1;                                               
//wire  [P_WIDTH-1:0] R15_1;                                               
 //STAGE 2        
reg  [P_WIDTH-1:0] R0_1_D_tmp;                                              
reg  [P_WIDTH-1:0] R1_1_D_tmp;                                              
reg  [P_WIDTH-1:0] R2_1_D_tmp;                                              
reg  [P_WIDTH-1:0] R3_1_D_tmp;                                              
reg  [P_WIDTH-1:0] R4_1_D_tmp; 

reg  [P_WIDTH-1:0] R8_1_D_tmp;                                              
reg  [P_WIDTH-1:0] R9_1_D_tmp;                                              
reg  [P_WIDTH-1:0] R10_1_D_tmp;                                             
reg  [P_WIDTH-1:0] R11_1_D_tmp;                                             
reg  [P_WIDTH-1:0] R12_1_D_tmp;


reg  [P_WIDTH-1:0] R0_1_D;                                              
reg  [P_WIDTH-1:0] R1_1_D;                                              
reg  [P_WIDTH-1:0] R2_1_D;                                              
reg  [P_WIDTH-1:0] R3_1_D;                                              
reg  [P_WIDTH-1:0] R4_1_D;                                              
wire  [P_WIDTH-1:0] R5_1_D;                                              
wire  [P_WIDTH-1:0] R6_1_D;                                              
wire  [P_WIDTH-1:0] R7_1_D;                                              
reg  [P_WIDTH-1:0] R8_1_D;                                              
reg  [P_WIDTH-1:0] R9_1_D;                                              
reg  [P_WIDTH-1:0] R10_1_D;                                             
reg  [P_WIDTH-1:0] R11_1_D;                                             
reg  [P_WIDTH-1:0] R12_1_D;                                             
wire  [P_WIDTH-1:0] R13_1_D;                                             
wire  [P_WIDTH-1:0] R14_1_D;                                             
wire  [P_WIDTH-1:0] R15_1_D;                                             
wire  [P_WIDTH-1:0] BU_S2_0_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_0_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_1_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_1_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_2_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_2_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_3_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_3_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_4_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_4_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_5_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_5_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_6_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_6_R1_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_7_R0_out_wire;                                 
wire  [P_WIDTH-1:0] BU_S2_7_R1_out_wire;                                 
reg  [P_WIDTH-1:0] R0_2;                                                
reg  [P_WIDTH-1:0] R1_2;                                                
reg  [P_WIDTH-1:0] R2_2;                                                
//wire  [P_WIDTH-1:0] R3_2;                                                
reg  [P_WIDTH-1:0] R4_2;                                                
reg  [P_WIDTH-1:0] R5_2;                                                
reg  [P_WIDTH-1:0] R6_2;                                                
//wire  [P_WIDTH-1:0] R7_2;                                                
reg  [P_WIDTH-1:0] R8_2;                                                
reg  [P_WIDTH-1:0] R9_2;                                                
reg  [P_WIDTH-1:0] R10_2;                                               
//wire  [P_WIDTH-1:0] R11_2;                                               
reg  [P_WIDTH-1:0] R12_2;                                               
reg  [P_WIDTH-1:0] R13_2;                                               
reg  [P_WIDTH-1:0] R14_2;                                               
//wire  [P_WIDTH-1:0] R15_2;                                               
 //STAGE 3     
reg  [P_WIDTH-1:0] R0_2_D_tmp;                                              
reg  [P_WIDTH-1:0] R1_2_D_tmp;                                              
reg  [P_WIDTH-1:0] R2_2_D_tmp; 
reg  [P_WIDTH-1:0] R4_2_D_tmp;                                              
reg  [P_WIDTH-1:0] R5_2_D_tmp;                                              
reg  [P_WIDTH-1:0] R6_2_D_tmp;
reg  [P_WIDTH-1:0] R8_2_D_tmp;                                              
reg  [P_WIDTH-1:0] R9_2_D_tmp;                                              
reg  [P_WIDTH-1:0] R10_2_D_tmp;  
reg  [P_WIDTH-1:0] R12_2_D_tmp;                                             
reg  [P_WIDTH-1:0] R13_2_D_tmp;                                             
reg  [P_WIDTH-1:0] R14_2_D_tmp; 

reg  [P_WIDTH-1:0] R0_2_D;                                              
reg  [P_WIDTH-1:0] R1_2_D;                                              
reg  [P_WIDTH-1:0] R2_2_D;                                              
wire  [P_WIDTH-1:0] R3_2_D;                                              
reg  [P_WIDTH-1:0] R4_2_D;                                              
reg  [P_WIDTH-1:0] R5_2_D;                                              
reg  [P_WIDTH-1:0] R6_2_D;                                              
wire  [P_WIDTH-1:0] R7_2_D;                                              
reg  [P_WIDTH-1:0] R8_2_D;                                              
reg  [P_WIDTH-1:0] R9_2_D;                                              
reg  [P_WIDTH-1:0] R10_2_D;                                             
wire  [P_WIDTH-1:0] R11_2_D;                                             
reg  [P_WIDTH-1:0] R12_2_D;                                             
reg  [P_WIDTH-1:0] R13_2_D;                                             
reg  [P_WIDTH-1:0] R14_2_D;                                             
wire  [P_WIDTH-1:0] R15_2_D;                                             
wire  [P_WIDTH-1:0] R0_3;                                                
wire  [P_WIDTH-1:0] R1_3;                                                
wire  [P_WIDTH-1:0] R2_3;                                                
wire  [P_WIDTH-1:0] R3_3;                                                
wire  [P_WIDTH-1:0] R4_3;                                                
wire  [P_WIDTH-1:0] R5_3;                                                
wire  [P_WIDTH-1:0] R6_3;                                                
wire  [P_WIDTH-1:0] R7_3;                                                
wire  [P_WIDTH-1:0] R8_3;                                                
wire  [P_WIDTH-1:0] R9_3;                                                
wire  [P_WIDTH-1:0] R10_3;                                               
wire  [P_WIDTH-1:0] R11_3;                                               
wire  [P_WIDTH-1:0] R12_3;                                               
wire  [P_WIDTH-1:0] R13_3;                                               
wire  [P_WIDTH-1:0] R14_3;                                               
wire  [P_WIDTH-1:0] R15_3;                                            	  
 //stage4                                                                
wire  [P_WIDTH-1:0] R0_3_D;                                              
wire  [P_WIDTH-1:0] R1_3_D;                                              
wire  [P_WIDTH-1:0] R2_3_D;                                              
wire  [P_WIDTH-1:0] R3_3_D;                                              
wire  [P_WIDTH-1:0] R4_3_D;                                              
wire  [P_WIDTH-1:0] R5_3_D;                                              
wire  [P_WIDTH-1:0] R6_3_D;                                              
wire  [P_WIDTH-1:0] R7_3_D;                                              
wire  [P_WIDTH-1:0] R8_3_D;                                              
wire  [P_WIDTH-1:0] R9_3_D;                                              
wire  [P_WIDTH-1:0] R10_3_D;                                             
wire  [P_WIDTH-1:0] R11_3_D;                                             
wire  [P_WIDTH-1:0] R12_3_D;                                             
wire  [P_WIDTH-1:0] R13_3_D;                                             
wire  [P_WIDTH-1:0] R14_3_D;                                             
wire  [P_WIDTH-1:0] R15_3_D;                                             
//stage 0                                                                
BU BU_S0_0(.R0_out(BU_S0_0_R0_out_wire),                              
              .R1_out(BU_S0_0_R1_out_wire),                              
              .R0_in(RA0_in),                                            
              .R1_in(RA8_in),
              .N_in(N_in)                                       
              );                                                         
BU BU_S0_1(.R0_out(BU_S0_1_R0_out_wire),                              
              .R1_out(BU_S0_1_R1_out_wire),                              
              .R0_in(RA1_in),                                            
              .R1_in(RA9_in),
              .N_in(N_in)                                       
              );                                                         
BU BU_S0_2(.R0_out(BU_S0_2_R0_out_wire),                              
              .R1_out(BU_S0_2_R1_out_wire),                              
              .R0_in(RA2_in),                                            
              .R1_in(RA10_in),
              .N_in(N_in)                                            
              );                                                         
BU BU_S0_3(.R0_out(BU_S0_3_R0_out_wire),                              
              .R1_out(BU_S0_3_R1_out_wire),                              
              .R0_in(RA3_in),                                            
              .R1_in(RA11_in),
              .N_in(N_in)                                          
              );                                                         
BU BU_S0_4(.R0_out(BU_S0_4_R0_out_wire),                              
              .R1_out(BU_S0_4_R1_out_wire),                              
              .R0_in(RA4_in),                                            
              .R1_in(RA12_in),
              .N_in(N_in)                                            
              );                                                         
BU BU_S0_5(.R0_out(BU_S0_5_R0_out_wire),                              
              .R1_out(BU_S0_5_R1_out_wire),                              
              .R0_in(RA5_in),                                            
              .R1_in(RA13_in),
              .N_in(N_in)                                            
              );                                                         
BU BU_S0_6(.R0_out(BU_S0_6_R0_out_wire),                              
              .R1_out(BU_S0_6_R1_out_wire),                              
              .R0_in(RA6_in),                                            
              .R1_in(RA14_in),
              .N_in(N_in)                                             
              );                                                         
BU BU_S0_7(.R0_out(BU_S0_7_R0_out_wire),                              
              .R1_out(BU_S0_7_R1_out_wire),                              
              .R0_in(RA7_in),                                            
              .R1_in(RA15_in),
              .N_in(N_in)                                            
              );                                                         
                                                                         

 always@(posedge clk)begin       
   if(~rst_n)begin               
     R0_0  		<= P_ZERO;          
     R1_0  		<= P_ZERO;          
     R2_0  		<= P_ZERO;          
     R3_0  		<= P_ZERO;          
     R4_0  		<= P_ZERO;          
     R5_0  		<= P_ZERO;          
     R6_0  		<= P_ZERO;          
     R7_0  		<= P_ZERO;          
     R8_0  		<= P_ZERO;
     R0_0_D_tmp  	<= P_ZERO;          
     R1_0_D_tmp  	<= P_ZERO;          
     R2_0_D_tmp  	<= P_ZERO;          
     R3_0_D_tmp  	<= P_ZERO;          
     R4_0_D_tmp  	<= P_ZERO;          
     R5_0_D_tmp  	<= P_ZERO;          
     R6_0_D_tmp  	<= P_ZERO;          
     R7_0_D_tmp  	<= P_ZERO;          
     R8_0_D_tmp  	<= P_ZERO; 


     R0_0_D  	<= P_ZERO;          
     R1_0_D  	<= P_ZERO;          
     R2_0_D  	<= P_ZERO;          
     R3_0_D  	<= P_ZERO;          
     R4_0_D  	<= P_ZERO;          
     R5_0_D  	<= P_ZERO;          
     R6_0_D  	<= P_ZERO;          
     R7_0_D  	<= P_ZERO;          
     R8_0_D  	<= P_ZERO;        
   end                           
   else begin                    
     R0_0  		<= BU_S0_0_R0_out_wire;           
     R1_0  		<= BU_S0_1_R0_out_wire;           
     R2_0  		<= BU_S0_2_R0_out_wire;           
     R3_0  		<= BU_S0_3_R0_out_wire;           
     R4_0  		<= BU_S0_4_R0_out_wire;           
     R5_0  		<= BU_S0_5_R0_out_wire;           
     R6_0  		<= BU_S0_6_R0_out_wire;           
     R7_0  		<= BU_S0_7_R0_out_wire;           
     R8_0  		<= BU_S0_0_R1_out_wire;   

     R0_0_D_tmp  	<= R0_0;          
     R1_0_D_tmp  	<= R1_0;          
     R2_0_D_tmp  	<= R2_0;          
     R3_0_D_tmp  	<= R3_0;          
     R4_0_D_tmp  	<= R4_0;          
     R5_0_D_tmp  	<= R5_0;          
     R6_0_D_tmp  	<= R6_0;          
     R7_0_D_tmp  	<= R7_0;          
     R8_0_D_tmp  	<= R8_0;  


     R0_0_D  	<= R0_0_D_tmp;          
     R1_0_D  	<= R1_0_D_tmp;          
     R2_0_D  	<= R2_0_D_tmp;          
     R3_0_D  	<= R3_0_D_tmp;          
     R4_0_D  	<= R4_0_D_tmp;          
     R5_0_D  	<= R5_0_D_tmp;          
     R6_0_D  	<= R6_0_D_tmp;          
     R7_0_D  	<= R7_0_D_tmp;          
     R8_0_D  	<= R8_0_D_tmp;   
   end                           
 end 
 
 MulMod128 MulMod0(   
                .S_out  (R9_0_D              ), 
                .A_in   (BU_S0_1_R1_out_wire ),       
                .B_in   (`W_1_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
			   
 MulMod128 MulMod1(             
                .S_out  (R10_0_D             ), 
                .A_in   (BU_S0_2_R1_out_wire ),       
                .B_in   (`W_2_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
 
 MulMod128 MulMod2(    
                .S_out  (R11_0_D             ), 
                .A_in   (BU_S0_3_R1_out_wire ),       
                .B_in   (`W_3_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
 
 MulMod128 MulMod3(
                .S_out  (R12_0_D             ), 
                .A_in   (BU_S0_4_R1_out_wire ),       
                .B_in   (`W_4_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
			   
 MulMod128 MulMod4(          
                .S_out  (R13_0_D             ), 
                .A_in   (BU_S0_5_R1_out_wire ),       
                .B_in   (`W_5_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
 
 MulMod128 MulMod5(           
                .S_out  (R14_0_D             ), 
                .A_in   (BU_S0_6_R1_out_wire ),       
                .B_in   (`W_6_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
 
 MulMod128 MulMod6(     
                .S_out  (R15_0_D             ), 
                .A_in   (BU_S0_7_R1_out_wire ),       
                .B_in   (`W_7_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
                                                                         
 //Stage1                                                  
 BU BU_S1_0(.R0_out(BU_S1_0_R0_out_wire),                                
            .R1_out(BU_S1_0_R1_out_wire),                                
            .R0_in(R0_0_D),                                              
            .R1_in(R4_0_D),
            .N_in(N_in)                                                
           );                                                            
                                                                         
 BU BU_S1_1(.R0_out(BU_S1_1_R0_out_wire),                                
            .R1_out(BU_S1_1_R1_out_wire),                                
            .R0_in(R1_0_D),                                              
            .R1_in(R5_0_D),
            .N_in(N_in)                                                
           );                                                            
                                                                         
 BU BU_S1_2(.R0_out(BU_S1_2_R0_out_wire),                                
            .R1_out(BU_S1_2_R1_out_wire),                                
            .R0_in(R2_0_D),                                              
            .R1_in(R6_0_D),
            .N_in(N_in)                                             
           );                                                            
                                                                         
 BU BU_S1_3(.R0_out(BU_S1_3_R0_out_wire),                                
            .R1_out(BU_S1_3_R1_out_wire),                                
            .R0_in(R3_0_D),                                              
            .R1_in(R7_0_D),
            .N_in(N_in)                                                
           );                                                            
                                                                         
 BU BU_S1_4(.R0_out(BU_S1_4_R0_out_wire),                                
            .R1_out(BU_S1_4_R1_out_wire),                                
            .R0_in(R8_0_D),                                              
            .R1_in(R12_0_D),
            .N_in(N_in)                                      
           );                                                            
                                                                         
 BU BU_S1_5(.R0_out(BU_S1_5_R0_out_wire),                                
            .R1_out(BU_S1_5_R1_out_wire),                                
            .R0_in(R9_0_D),                                              
            .R1_in(R13_0_D),
            .N_in(N_in)                                             
           );                                                            
                                                                         
 BU BU_S1_6(.R0_out(BU_S1_6_R0_out_wire),                                
            .R1_out(BU_S1_6_R1_out_wire),                                
            .R0_in(R10_0_D),                                             
            .R1_in(R14_0_D),
            .N_in(N_in)                                              
           );                                                            
                                                                         
 BU BU_S1_7(.R0_out(BU_S1_7_R0_out_wire),                                
            .R1_out(BU_S1_7_R1_out_wire),                                
            .R0_in(R11_0_D),                                             
            .R1_in(R15_0_D),
            .N_in(N_in)                                              
           );                                                                            
																		 
 always@(posedge clk)begin       
   if(~rst_n)begin               
     R0_1  		<= P_ZERO;          
     R1_1  		<= P_ZERO;          
     R2_1  		<= P_ZERO;          
     R3_1  		<= P_ZERO;          
     R4_1  		<= P_ZERO;          
     R8_1   	<= P_ZERO;          
     R9_1   	<= P_ZERO;          
     R10_1  	<= P_ZERO;          
     R11_1  	<= P_ZERO;  
	 R12_1  	<= P_ZERO; 

     R0_1_D_tmp   	<= P_ZERO;          
     R1_1_D_tmp   	<= P_ZERO;          
     R2_1_D_tmp   	<= P_ZERO;          
     R3_1_D_tmp   	<= P_ZERO;          
     R4_1_D_tmp   	<= P_ZERO;          
     R8_1_D_tmp   	<= P_ZERO;          
     R9_1_D_tmp   	<= P_ZERO;          
     R10_1_D_tmp  	<= P_ZERO;          
     R11_1_D_tmp  	<= P_ZERO;      
	 R12_1_D_tmp  	<= P_ZERO;	

     R0_1_D   	<= P_ZERO;          
     R1_1_D   	<= P_ZERO;          
     R2_1_D   	<= P_ZERO;          
     R3_1_D   	<= P_ZERO;          
     R4_1_D   	<= P_ZERO;          
     R8_1_D   	<= P_ZERO;          
     R9_1_D   	<= P_ZERO;          
     R10_1_D  	<= P_ZERO;          
     R11_1_D  	<= P_ZERO;      
	 R12_1_D  	<= P_ZERO;	 
   end                           
   else begin                    
     R0_1   	<= BU_S1_0_R0_out_wire;           
     R1_1   	<= BU_S1_1_R0_out_wire;           
     R2_1   	<= BU_S1_2_R0_out_wire;           
     R3_1   	<= BU_S1_3_R0_out_wire;           
     R4_1   	<= BU_S1_0_R1_out_wire;           
     R8_1   	<= BU_S1_4_R0_out_wire;           
     R9_1   	<= BU_S1_5_R0_out_wire;           
     R10_1  	<= BU_S1_6_R0_out_wire;           
     R11_1  	<= BU_S1_7_R0_out_wire; 
	 R12_1  	<= BU_S1_4_R1_out_wire;

     R0_1_D_tmp    	<= R0_1 ;          
     R1_1_D_tmp    	<= R1_1 ;          
     R2_1_D_tmp    	<= R2_1 ;          
     R3_1_D_tmp    	<= R3_1 ;          
     R4_1_D_tmp    	<= R4_1 ;          
     R8_1_D_tmp    	<= R8_1 ;          
     R9_1_D_tmp    	<= R9_1 ;          
     R10_1_D_tmp   	<= R10_1;          
     R11_1_D_tmp   	<= R11_1;  
	 R12_1_D_tmp   	<= R12_1;

     R0_1_D    	<= R0_1_D_tmp ;          
     R1_1_D    	<= R1_1_D_tmp ;          
     R2_1_D    	<= R2_1_D_tmp ;          
     R3_1_D    	<= R3_1_D_tmp ;          
     R4_1_D    	<= R4_1_D_tmp ;          
     R8_1_D    	<= R8_1_D_tmp ;          
     R9_1_D    	<= R9_1_D_tmp ;          
     R10_1_D   	<= R10_1_D_tmp;          
     R11_1_D   	<= R11_1_D_tmp;  
	 R12_1_D   	<= R12_1_D_tmp;
   end                           
 end
 
 MulMod128 MulMod7(        
                .S_out  (R5_1_D              ), 
                .A_in   (BU_S1_1_R1_out_wire ),       
                .B_in   (`W_2_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
			   
 MulMod128 MulMod8(                          
                .S_out  (R6_1_D              ), 
                .A_in   (BU_S1_2_R1_out_wire ),       
                .B_in   (`W_4_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
 
 MulMod128 MulMod9(          
                .S_out  (R7_1_D              ), 
                .A_in   (BU_S1_3_R1_out_wire ),       
                .B_in   (`W_6_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
 
 MulMod128 MulMod10( 
                .S_out  (R13_1_D              ), 
                .A_in   (BU_S1_5_R1_out_wire ),       
                .B_in   (`W_2_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
			   
 MulMod128 MulMod11(         
                .S_out  (R14_1_D              ), 
                .A_in   (BU_S1_6_R1_out_wire ),       
                .B_in   (`W_4_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );
 
 MulMod128 MulMod12(              
                .S_out  (R15_1_D              ), 
                .A_in   (BU_S1_7_R1_out_wire ),       
                .B_in   (`W_6_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )    
			   );                                                    
                                                                         
//stage2                                                               
 BU BU_S2_0(.R0_out(BU_S2_0_R0_out_wire),                                
            .R1_out(BU_S2_0_R1_out_wire),                                
            .R0_in(R0_1_D),                                              
            .R1_in(R2_1_D),
            .N_in(N_in)                                                
           );                                                            
                                                                         
 BU BU_S2_1(.R0_out(BU_S2_1_R0_out_wire),                                
            .R1_out(BU_S2_1_R1_out_wire),                                
            .R0_in(R1_1_D),                                              
            .R1_in(R3_1_D),
            .N_in(N_in)                                                
           );                                                            
                                                                         
 BU BU_S2_2(.R0_out(BU_S2_2_R0_out_wire),                                
            .R1_out(BU_S2_2_R1_out_wire),                                
            .R0_in(R4_1_D),                                              
            .R1_in(R6_1_D),
            .N_in(N_in)                                               
           );                                                            
                                                                         
 BU BU_S2_3(.R0_out(BU_S2_3_R0_out_wire),                                
            .R1_out(BU_S2_3_R1_out_wire),                                
            .R0_in(R5_1_D),                                              
            .R1_in(R7_1_D),
            .N_in(N_in)                                                
           );                                                            
                                                                         
 BU BU_S2_4(.R0_out(BU_S2_4_R0_out_wire),                                
            .R1_out(BU_S2_4_R1_out_wire),                                
            .R0_in(R8_1_D),                                              
            .R1_in(R10_1_D),
            .N_in(N_in)                                               
           );                                                            
                                                                         
 BU BU_S2_5(.R0_out(BU_S2_5_R0_out_wire),                                
            .R1_out(BU_S2_5_R1_out_wire),                                
            .R0_in(R9_1_D),                                              
            .R1_in(R11_1_D),
            .N_in(N_in)                                               
           );                                                            
                                                                         
 BU BU_S2_6(.R0_out(BU_S2_6_R0_out_wire),                                
            .R1_out(BU_S2_6_R1_out_wire),                                
            .R0_in(R12_1_D),                                             
            .R1_in(R14_1_D),
            .N_in(N_in)                                              
           );                                                            
                                                                         
 BU BU_S2_7(.R0_out(BU_S2_7_R0_out_wire),                                
            .R1_out(BU_S2_7_R1_out_wire),                                
            .R0_in(R13_1_D),                                             
            .R1_in(R15_1_D),
            .N_in(N_in)                                               
           );                                         

 always@(posedge clk)begin       
   if(~rst_n)begin               
     R0_2  		<= P_ZERO;          
     R1_2  		<= P_ZERO;          
     R2_2  		<= P_ZERO;          
     R4_2  		<= P_ZERO;          
     R5_2  		<= P_ZERO;          
     R6_2   	<= P_ZERO;          
     R8_2   	<= P_ZERO;          
     R9_2   	<= P_ZERO;          
     R10_2  	<= P_ZERO;  
	 R12_2  	<= P_ZERO;
	 R13_2  	<= P_ZERO;  
	 R14_2  	<= P_ZERO;	 
     R0_2_D  	<= P_ZERO;          
     R1_2_D  	<= P_ZERO;          
     R2_2_D  	<= P_ZERO;          
     R4_2_D  	<= P_ZERO;          
     R5_2_D  	<= P_ZERO;          
     R6_2_D  	<= P_ZERO;          
     R8_2_D  	<= P_ZERO;          
     R9_2_D  	<= P_ZERO;          
     R10_2_D 	<= P_ZERO;      
	 R12_2_D 	<= P_ZERO;
	 R13_2_D 	<= P_ZERO;      
	 R14_2_D 	<= P_ZERO;
   end                           
   else begin                    
     R0_2  		<= BU_S2_0_R0_out_wire;           
     R1_2  		<= BU_S2_1_R0_out_wire;           
     R2_2  		<= BU_S2_0_R1_out_wire;           
     R4_2  		<= BU_S2_2_R0_out_wire;           
     R5_2  		<= BU_S2_3_R0_out_wire;           
     R6_2   	<= BU_S2_2_R1_out_wire;           
     R8_2   	<= BU_S2_4_R0_out_wire;           
     R9_2   	<= BU_S2_5_R0_out_wire;           
     R10_2  	<= BU_S2_4_R1_out_wire; 
	 R12_2  	<= BU_S2_6_R0_out_wire;
	 R13_2  	<= BU_S2_7_R0_out_wire; 
	 R14_2  	<= BU_S2_6_R1_out_wire;
     
     R0_2_D_tmp   	<= R0_2 ;          
     R1_2_D_tmp   	<= R1_2 ;          
     R2_2_D_tmp   	<= R2_2 ;
     R4_2_D_tmp   	<= R4_2 ;          
     R5_2_D_tmp   	<= R5_2 ;          
     R6_2_D_tmp   	<= R6_2 ;
     R8_2_D_tmp   	<= R8_2 ;          
     R9_2_D_tmp   	<= R9_2 ;          
     R10_2_D_tmp  	<= R10_2;
     R12_2_D_tmp 	<= R12_2;
	 R13_2_D_tmp 	<= R13_2;  
	 R14_2_D_tmp 	<= R14_2;

     R0_2_D   	<= R0_2_D_tmp ;          
     R1_2_D   	<= R1_2_D_tmp ;          
     R2_2_D   	<= R2_2_D_tmp ;          
     R4_2_D   	<= R4_2_D_tmp ;          
     R5_2_D   	<= R5_2_D_tmp ;          
     R6_2_D   	<= R6_2_D_tmp ; 
     R8_2_D   	<= R8_2_D_tmp ;          
     R9_2_D   	<= R9_2_D_tmp ;          
     R10_2_D  	<= R10_2_D_tmp;  
	 R12_2_D  	<= R12_2_D_tmp;
	 R13_2_D  	<= R13_2_D_tmp;  
	 R14_2_D  	<= R14_2_D_tmp;
   end                           
 end
 
 MulMod128 MulMod13(    
                .S_out  (R3_2_D              ), 
                .A_in   (BU_S2_1_R1_out_wire ),       
                .B_in   (`W_4_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )   
			   );
			   
 MulMod128 MulMod14(         
                .S_out  (R7_2_D              ), 
                .A_in   (BU_S2_3_R1_out_wire ),       
                .B_in   (`W_4_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )   
			   );
 
 MulMod128 MulMod15(             
                .S_out  (R11_2_D              ), 
                .A_in   (BU_S2_5_R1_out_wire ),       
                .B_in   (`W_4_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )   
			   );
 
 MulMod128 MulMod16(          
                .S_out  (R15_2_D              ), 
                .A_in   (BU_S2_7_R1_out_wire ),       
                .B_in   (`W_4_16              ),        
                .N_in   (N_in                ),         
                .rst_n  (rst_n               ),            
                .clk    (clk                 )   
			   );
                 
//stage3                                         
 BU BU_S3_0(.R0_out(R0_3),                   
            .R1_out(R1_3),                   
            .R0_in(R0_2_D),                  
            .R1_in(R1_2_D),
            .N_in(N_in)                    
           );                                
                                             
 BU BU_S3_1(.R0_out(R2_3),                   
            .R1_out(R3_3),                   
            .R0_in(R2_2_D),                  
            .R1_in(R3_2_D),
            .N_in(N_in)                   
           );                                
                                             
 BU BU_S3_2(.R0_out(R4_3),                   
            .R1_out(R5_3),                   
            .R0_in(R4_2_D),                  
            .R1_in(R5_2_D),
            .N_in(N_in)                    
           );                                
                                             
 BU BU_S3_3(.R0_out(R6_3),                   
            .R1_out(R7_3),                   
            .R0_in(R6_2_D),                  
            .R1_in(R7_2_D),
            .N_in(N_in)                    
           );                                
                                             
 BU BU_S3_4(.R0_out(R8_3),                   
            .R1_out(R9_3),                   
            .R0_in(R8_2_D),                  
            .R1_in(R9_2_D),
            .N_in(N_in)                    
           );                                
                                             
 BU BU_S3_5(.R0_out(R10_3),                  
            .R1_out(R11_3),                  
            .R0_in(R10_2_D),                 
            .R1_in(R11_2_D),
            .N_in(N_in)                   
           );                                
                                             
 BU BU_S3_6(.R0_out(R12_3),                  
            .R1_out(R13_3),                  
            .R0_in(R12_2_D),                 
            .R1_in(R13_2_D),
            .N_in(N_in)                  
           );                                
                                             
 BU BU_S3_7(.R0_out(R14_3),                  
            .R1_out(R15_3),                  
            .R0_in(R14_2_D),                 
            .R1_in(R15_2_D),
            .N_in(N_in)                 
           );	                              
                                             
                                             
 Pipe Pipe_STAGE_3(.R0_out(R0_3_D),          
                   .R1_out(R1_3_D),          
                   .R2_out(R2_3_D),          
                   .R3_out(R3_3_D),          
                   .R4_out(R4_3_D),          
                   .R5_out(R5_3_D),          
                   .R6_out(R6_3_D),          
                   .R7_out(R7_3_D),          
                   .R8_out(R8_3_D),          
                   .R9_out(R9_3_D),          
                   .R10_out(R10_3_D),        
                   .R11_out(R11_3_D),        
                   .R12_out(R12_3_D),        
                   .R13_out(R13_3_D),        
                   .R14_out(R14_3_D),        
                   .R15_out(R15_3_D),        
                   .R0_in(R0_3),             
                   .R1_in(R1_3),             
                   .R2_in(R2_3),             
                   .R3_in(R3_3),             
                   .R4_in(R4_3),             
                   .R5_in(R5_3),             
                   .R6_in(R6_3),             
                   .R7_in(R7_3),             
                   .R8_in(R8_3),             
                   .R9_in(R9_3),             
                   .R10_in(R10_3),           
                   .R11_in(R11_3),           
                   .R12_in(R12_3),           
                   .R13_in(R13_3),           
                   .R14_in(R14_3),           
                   .R15_in(R15_3),           
                   .clk(clk),                
                   .rst_n(rst_n)	          
                   ); 
 
 assign	RA0_out 	= R0_3_D;
 assign	RA8_out 	= R1_3_D;
 assign	RA4_out 	= R2_3_D;
 assign	RA12_out 	= R3_3_D;
 assign	RA2_out 	= R4_3_D;
 assign	RA10_out 	= R5_3_D;
 assign	RA6_out 	= R6_3_D;
 assign	RA14_out 	= R7_3_D;
 assign	RA1_out 	= R8_3_D;
 assign	RA9_out 	= R9_3_D;
 assign	RA5_out 	= R10_3_D;
 assign	RA13_out 	= R11_3_D;
 assign	RA3_out 	= R12_3_D;
 assign	RA11_out 	= R13_3_D;
 assign	RA7_out 	= R14_3_D;
 assign	RA15_out 	= R15_3_D;
                                             	                  
endmodule                                    
