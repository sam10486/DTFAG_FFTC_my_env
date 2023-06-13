`include "define.v"                                                                 
module DTFAG_Mux3(
			  MulA0_out,                                                                   
			  MulA1_out,                                                                     
			  MulA2_out,                                                                     
			  MulA3_out,                                                                     
			  MulA4_out,                                                                     
			  MulA5_out,                                                                     
			  MulA6_out,                                                                     
			  MulA7_out,    
			  MulA8_out,                                                                     
			  MulA9_out,                                                                     
			  MulA10_out,                                                                    
			  MulA11_out,                                                                    
			  MulA12_out,                                                                    
			  MulA13_out,                                                                    
			  MulA14_out,                                                                    
			  MulA15_out,                                                                                                                                        

			  R16_in0,                                                     
			  R16_in1,                                                                       
			  R16_in2,                                                                       
			  R16_in3,                                                                       
			  R16_in4,                                                                       
			  R16_in5,                                                                       
			  R16_in6,                                                                       
			  R16_in7,     
			  R16_in8,                                                                      
			  R16_in9,                                                                       
			  R16_in10,                                                                      
			  R16_in11,                                                                      
			  R16_in12,                                                                      
			  R16_in13,                                                                      
			  R16_in14,                                                                      
			  R16_in15,                                                                      
			  Mul_sel                                                                                               
			  ) ;                                                                            
			                                                                                 
parameter P_WIDTH   = 64 ;                                                                 
parameter SD_WIDTH  = 128 ;                                                                
parameter SEG1  = 64 ;                                                                     
parameter SEG2  = 128 ;                                                                    
                                                                                           
parameter P_ONE   = 64'd1 ;                                                                
parameter PINV    = 64'd18446462594437939201; // inverse N                                    
                               
output [`D_width-1:0] MulA0_out ;								                                                           
output [`D_width-1:0] MulA1_out ;                                                           
output [`D_width-1:0] MulA2_out ;                                                           
output [`D_width-1:0] MulA3_out ;                                                           
output [`D_width-1:0] MulA4_out ;                                                           
output [`D_width-1:0] MulA5_out ;                                                           
output [`D_width-1:0] MulA6_out ;                                                           
output [`D_width-1:0] MulA7_out ;  
output [`D_width-1:0] MulA8_out ;                                                         
output [`D_width-1:0] MulA9_out ;                                                           
output [`D_width-1:0] MulA10_out ;                                                          
output [`D_width-1:0] MulA11_out ;                                                          
output [`D_width-1:0] MulA12_out ;                                                          
output [`D_width-1:0] MulA13_out ;                                                          
output [`D_width-1:0] MulA14_out ;                                                          
output [`D_width-1:0] MulA15_out ;                                                          
                                                                                           
                                                                                                               
input [`D_width-1:0]  R16_in0   ; 							                         
input [`D_width-1:0]  R16_in1   ;                                                             
input [`D_width-1:0]  R16_in2   ;                                                             
input [`D_width-1:0]  R16_in3   ;                                                             
input [`D_width-1:0]  R16_in4   ;                                                             
input [`D_width-1:0]  R16_in5   ;                                                             
input [`D_width-1:0]  R16_in6   ;                                                             
input [`D_width-1:0]  R16_in7   ;  
input [`D_width-1:0]  R16_in8   ;                                                           
input [`D_width-1:0]  R16_in9   ;                                                             
input [`D_width-1:0]  R16_in10  ;                                                            
input [`D_width-1:0]  R16_in11  ;                                                            
input [`D_width-1:0]  R16_in12  ;                                                            
input [`D_width-1:0]  R16_in13  ;                                                            
input [`D_width-1:0]  R16_in14  ;                                                            
input [`D_width-1:0]  R16_in15  ;                                                            
input [1:0]          Mul_sel ;                                                             
                                                         
                                                                                        
    // change RA output position in IFFT                 
	assign MulA0_out = (Mul_sel==1'd1) ? R16_in0 : 64'd0; 

	assign MulA1_out = (Mul_sel==1'd1) ? R16_in1 : 64'd0;                                
	//                                                                                      
	assign MulA2_out = (Mul_sel==1'd1) ? R16_in2 : 64'd0;                                
	//                                                                                      
	assign MulA3_out = (Mul_sel==1'd1) ? R16_in3 : 64'd0;                                
	//                                                                                       
	assign MulA4_out = (Mul_sel==1'd1) ? R16_in4 : 64'd0;                                
	//                                                                                       
	assign MulA5_out = (Mul_sel==1'd1) ? R16_in5 : 64'd0;                                
	//                                                                                       
	assign MulA6_out = (Mul_sel==1'd1) ? R16_in6 : 64'd0;                                
	//                                                                                       
	assign MulA7_out = (Mul_sel==1'd1) ? R16_in7 : 64'd0;             
	//
	assign MulA8_out = (Mul_sel==1'd1) ? R16_in8 : 64'd0;                                 
	//                                                                                       
	assign MulA9_out = (Mul_sel==1'd1) ? R16_in9 : 64'd0;                                 
	//                                                                                       
	assign MulA10_out = (Mul_sel==1'd1) ? R16_in10 : 64'd0;                               
	//                                                                                       
	assign MulA11_out = (Mul_sel==1'd1) ? R16_in11 : 64'd0;                               
	//                                                                                       
	assign MulA12_out = (Mul_sel==1'd1) ? R16_in12 : 64'd0;                               
	//                                                                                       
	assign MulA13_out = (Mul_sel==1'd1) ? R16_in13 : 64'd0;                               
	//                                                                                       
	assign MulA14_out = (Mul_sel==1'd1) ? R16_in14 : 64'd0;                               
	//                                                                                       
	assign MulA15_out = (Mul_sel==1'd1) ? R16_in15 : 64'd0;                               
	                                                                                         
	                                                                                         
endmodule                                                                                  
