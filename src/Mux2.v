`timescale 1 ns/1 ps                                                                                   
module Mux2(RA0_out,                                                                                   
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
		      BN0_MEM0_in,                                                                               
			  BN0_MEM1_in,                                                                               
			  BN0_MEM2_in,                                                                               
			  BN0_MEM3_in,                                                                               
			  BN0_MEM4_in,                                                                               
			  BN0_MEM5_in,                                                                               
			  BN0_MEM6_in,                                                                               
			  BN0_MEM7_in,                                                                               
			  BN1_MEM0_in,                                                                               
			  BN1_MEM1_in,                                                                               
			  BN1_MEM2_in,                                                                               
			  BN1_MEM3_in,                                                                               
			  BN1_MEM4_in,                                                                               
			  BN1_MEM5_in,                                                                               
			  BN1_MEM6_in,                                                                               
			  BN1_MEM7_in,                                                                               
			  BN_sel                                                                                     
			  ) ;                                                                                        
			                                                                                             
			                                                                                             
parameter SD_WIDTH  = 128 ;                                                                            
parameter P_WIDTH   = 64 ;                                                                             
parameter SEG1      = 64 ;                                                                             
parameter SEG2      = 128 ;                                                                            
                                                                                                       
                                                                                                       
output [P_WIDTH-1:0] RA0_out ;                                                                         
output [P_WIDTH-1:0] RA1_out ;                                                                         
output [P_WIDTH-1:0] RA2_out ;                                                                         
output [P_WIDTH-1:0] RA3_out ;                                                                         
output [P_WIDTH-1:0] RA4_out ;                                                                         
output [P_WIDTH-1:0] RA5_out ;                                                                         
output [P_WIDTH-1:0] RA6_out ;                                                                         
output [P_WIDTH-1:0] RA7_out ;                                                                         
output [P_WIDTH-1:0] RA8_out ;                                                                         
output [P_WIDTH-1:0] RA9_out ;                                                                         
output [P_WIDTH-1:0] RA10_out ;                                                                        
output [P_WIDTH-1:0] RA11_out ;                                                                        
output [P_WIDTH-1:0] RA12_out ;                                                                        
output [P_WIDTH-1:0] RA13_out ;                                                                        
output [P_WIDTH-1:0] RA14_out ;                                                                        
output [P_WIDTH-1:0] RA15_out ;                                                                        
                                                                                                       
input [SD_WIDTH-1:0] BN0_MEM0_in ;                                                                     
input [SD_WIDTH-1:0] BN0_MEM1_in ;                                                                     
input [SD_WIDTH-1:0] BN0_MEM2_in ;                                                                     
input [SD_WIDTH-1:0] BN0_MEM3_in ;                                                                     
input [SD_WIDTH-1:0] BN0_MEM4_in ;                                                                     
input [SD_WIDTH-1:0] BN0_MEM5_in ;                                                                     
input [SD_WIDTH-1:0] BN0_MEM6_in ;                                                                     
input [SD_WIDTH-1:0] BN0_MEM7_in ;                                                                     
input [SD_WIDTH-1:0] BN1_MEM0_in ;                                                                     
input [SD_WIDTH-1:0] BN1_MEM1_in ;                                                                     
input [SD_WIDTH-1:0] BN1_MEM2_in ;                                                                     
input [SD_WIDTH-1:0] BN1_MEM3_in ;                                                                     
input [SD_WIDTH-1:0] BN1_MEM4_in ;                                                                     
input [SD_WIDTH-1:0] BN1_MEM5_in ;                                                                     
input [SD_WIDTH-1:0] BN1_MEM6_in ;                                                                     
input [SD_WIDTH-1:0] BN1_MEM7_in ;                                                                     
input                BN_sel ;                                                                          
                                                                                                       
                                                                                                       
                                                                                                       
	// Radix-16 op_0                                                                                     
	assign RA0_out = (BN_sel==1'b1)? (BN1_MEM0_in[SEG2-1:SEG1]) : (BN0_MEM0_in[SEG2-1:SEG1]) ;           
	// Radix-16 op_1                                                                                     
	assign RA1_out = (BN_sel==1'b1)? (BN1_MEM0_in[SEG1-1:0]) : (BN0_MEM0_in[SEG1-1:0]) ;                 
	// Radix-16 op_2                                                                                     
	assign RA2_out = (BN_sel==1'b1)? (BN1_MEM1_in[SEG2-1:SEG1]) : (BN0_MEM1_in[SEG2-1:SEG1]) ;           
	// Radix-16 op_3                                                                                     
	assign RA3_out = (BN_sel==1'b1)? (BN1_MEM1_in[SEG1-1:0]) : (BN0_MEM1_in[SEG1-1:0]) ;                 
	// Radix-16 op_4                                                                                     
	assign RA4_out = (BN_sel==1'b1)? (BN1_MEM2_in[SEG2-1:SEG1]) : (BN0_MEM2_in[SEG2-1:SEG1]) ;           
	// Radix-16 op_5                                                                                     
	assign RA5_out = (BN_sel==1'b1)? (BN1_MEM2_in[SEG1-1:0]) : (BN0_MEM2_in[SEG1-1:0]) ;                 
	// Radix-16 op_6                                                                                     
	assign RA6_out = (BN_sel==1'b1)? (BN1_MEM3_in[SEG2-1:SEG1]) : (BN0_MEM3_in[SEG2-1:SEG1]) ;           
	// Radix-16 op_7                                                                                     
	assign RA7_out = (BN_sel==1'b1)? (BN1_MEM3_in[SEG1-1:0]) : (BN0_MEM3_in[SEG1-1:0]) ;                 
	// Radix-16 op_8                                                                                     
	assign RA8_out = (BN_sel==1'b1)? (BN1_MEM4_in[SEG2-1:SEG1]) : (BN0_MEM4_in[SEG2-1:SEG1]) ;           
	// Radix-16 op_9                                                                                     
	assign RA9_out = (BN_sel==1'b1)? (BN1_MEM4_in[SEG1-1:0]) : (BN0_MEM4_in[SEG1-1:0]) ;                 
	// Radix-16 op_10                                                                                    
	assign RA10_out = (BN_sel==1'b1)? (BN1_MEM5_in[SEG2-1:SEG1]) : (BN0_MEM5_in[SEG2-1:SEG1]) ;          
	// Radix-16 op_11                                                                                    
	assign RA11_out = (BN_sel==1'b1)? (BN1_MEM5_in[SEG1-1:0]) : (BN0_MEM5_in[SEG1-1:0]) ;                
	// Radix-16 op_12                                                                                    
	assign RA12_out = (BN_sel==1'b1)? (BN1_MEM6_in[SEG2-1:SEG1]) : (BN0_MEM6_in[SEG2-1:SEG1]) ;          
	// Radix-16 op_13                                                                                    
	assign RA13_out = (BN_sel==1'b1)? (BN1_MEM6_in[SEG1-1:0]) : (BN0_MEM6_in[SEG1-1:0]) ;                
	// Radix-16 op_14                                                                                    
	assign RA14_out = (BN_sel==1'b1)? (BN1_MEM7_in[SEG2-1:SEG1]) : (BN0_MEM7_in[SEG2-1:SEG1]) ;          
	// Radix-16 op_15                                                                                    
	assign RA15_out = (BN_sel==1'b1)? (BN1_MEM7_in[SEG1-1:0]) : (BN0_MEM7_in[SEG1-1:0]) ;                
	                                                                                                     
endmodule                                                                                              
