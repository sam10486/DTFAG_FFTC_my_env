`timescale 1 ns/1 ps                                                                               
module Mux1(BN0_MEM0_Dout,                                                                         
			  BN0_MEM1_Dout,                                                                           
			  BN0_MEM2_Dout,                                                                           
			  BN0_MEM3_Dout,                                                                           
			  BN0_MEM4_Dout,                                                                           
			  BN0_MEM5_Dout,                                                                           
			  BN0_MEM6_Dout,                                                                           
			  BN0_MEM7_Dout,                                                                           
			  BN1_MEM0_Dout,                                                                           
			  BN1_MEM1_Dout,                                                                           
			  BN1_MEM2_Dout,                                                                           
			  BN1_MEM3_Dout,                                                                           
			  BN1_MEM4_Dout,                                                                           
			  BN1_MEM5_Dout,                                                                           
			  BN1_MEM6_Dout,                                                                           
			  BN1_MEM7_Dout,                                                                           
			  MA0_out,                                                                                 
			  MA1_out,                                                                                 
		      ExtB0_D0_in,                                                                             
			  ExtB0_D1_in,                                                                             
			  ExtB0_D2_in,                                                                             
			  ExtB0_D3_in,                                                                             
			  ExtB0_D4_in,                                                                             
			  ExtB0_D5_in,                                                                             
			  ExtB0_D6_in,                                                                             
			  ExtB0_D7_in,                                                                             
			  ExtB0_D8_in,                                                                             
			  ExtB0_D9_in,                                                                             
			  ExtB0_D10_in,                                                                            
			  ExtB0_D11_in,                                                                            
			  ExtB0_D12_in,                                                                            
			  ExtB0_D13_in,                                                                            
			  ExtB0_D14_in,                                                                            
			  ExtB0_D15_in,                                                                            
			  ExtB1_D0_in,                                                                             
			  ExtB1_D1_in,                                                                             
            ExtB1_D2_in,                                                                           
			  ExtB1_D3_in,                                                                             
			  ExtB1_D4_in,                                                                             
			  ExtB1_D5_in,                                                                             
			  ExtB1_D6_in,                                                                             
			  ExtB1_D7_in,                                                                             
			  ExtB1_D8_in,                                                                             
			  ExtB1_D9_in,                                                                             
			  ExtB1_D10_in,                                                                            
			  ExtB1_D11_in,                                                                            
			  ExtB1_D12_in,                                                                            
			  ExtB1_D13_in,                                                                            
			  ExtB1_D14_in,                                                                            
			  ExtB1_D15_in,                                                                            
			  RDC_in0,                                                                                 
			  RDC_in1,                                                                                 
			  RDC_in2,                                                                                 
			  RDC_in3,                                                                                 
			  RDC_in4,                                                                                 
			  RDC_in5,                                                                                 
			  RDC_in6,                                                                                 
			  RDC_in7,                                                                                 
			  RDC_in8,                                                                                 
			  RDC_in9,                                                                                 
			  RDC_in10,                                                                                
			  RDC_in11,                                                                                
			  RDC_in12,                                                                                
			  RDC_in13,                                                                                
			  RDC_in14,                                                                                
			  RDC_in15,                                                                                
			  ExtMA_in,                                                                                
			  AGUMA_in,                                                                                
			  WMA_in,                                                                                  
			  wen0_in,                                                                                 
			  wen1_in,                                                                                 
			  SD_sel                                                                                   
			  ) ;                                                                                      
			                                                                                         
			                                                                                         
parameter SD_WIDTH  = 128 ;                                                                        
parameter CP_WIDTH  = 22 ;                                                                        
parameter P_WIDTH   = 64 ;                                                                         
parameter A_WIDTH   = 11;
                                                                                                   
parameter P_ZERO   = 64'h0 ;                                                                       
parameter CP_ZERO  = 22'h0 ;                                                                       
                                                                                                   
                                                                                                   
output [SD_WIDTH-1:0] BN0_MEM0_Dout ;                                                              
output [SD_WIDTH-1:0] BN0_MEM1_Dout ;                                                              
output [SD_WIDTH-1:0] BN0_MEM2_Dout ;                                                              
output [SD_WIDTH-1:0] BN0_MEM3_Dout ;                                                              
output [SD_WIDTH-1:0] BN0_MEM4_Dout ;                                                              
output [SD_WIDTH-1:0] BN0_MEM5_Dout ;                                                              
output [SD_WIDTH-1:0] BN0_MEM6_Dout ;                                                              
output [SD_WIDTH-1:0] BN0_MEM7_Dout ;                                                              
output [SD_WIDTH-1:0] BN1_MEM0_Dout ;                                                              
output [SD_WIDTH-1:0] BN1_MEM1_Dout ;                                                              
output [SD_WIDTH-1:0] BN1_MEM2_Dout ;                                                              
output [SD_WIDTH-1:0] BN1_MEM3_Dout ;                                                              
output [SD_WIDTH-1:0] BN1_MEM4_Dout ;                                                              
output [SD_WIDTH-1:0] BN1_MEM5_Dout ;                                                              
output [SD_WIDTH-1:0] BN1_MEM6_Dout ;                                                              
output [SD_WIDTH-1:0] BN1_MEM7_Dout ;                                                              
output [A_WIDTH-1:0]  MA0_out ;                                                                    
output [A_WIDTH-1:0]  MA1_out ;                                                                    
                                                                                                   
input  [P_WIDTH-1:0]  ExtB0_D0_in ;                                                                
input  [P_WIDTH-1:0]  ExtB0_D1_in ;                                                                
input  [P_WIDTH-1:0]  ExtB0_D2_in ;                                                                
input  [P_WIDTH-1:0]  ExtB0_D3_in ;                                                                
input  [P_WIDTH-1:0]  ExtB0_D4_in ;                                                                
input  [P_WIDTH-1:0]  ExtB0_D5_in ;                                                                
input  [P_WIDTH-1:0]  ExtB0_D6_in ;                                                                
input  [P_WIDTH-1:0]  ExtB0_D7_in ;                                                                
input  [P_WIDTH-1:0]  ExtB0_D8_in ;                                                                
input  [P_WIDTH-1:0]  ExtB0_D9_in ;                                                                
input  [P_WIDTH-1:0]  ExtB0_D10_in ;                                                               
input  [P_WIDTH-1:0]  ExtB0_D11_in ;                                                               
input  [P_WIDTH-1:0]  ExtB0_D12_in ;                                                               
input  [P_WIDTH-1:0]  ExtB0_D13_in ;                                                               
input  [P_WIDTH-1:0]  ExtB0_D14_in ;                                                               
input  [P_WIDTH-1:0]  ExtB0_D15_in ;                                                               
input  [P_WIDTH-1:0]  ExtB1_D0_in ;                                                                
input  [P_WIDTH-1:0]  ExtB1_D1_in ;                                                                
input  [P_WIDTH-1:0]  ExtB1_D2_in ;                                                                
input  [P_WIDTH-1:0]  ExtB1_D3_in ;                                                                
input  [P_WIDTH-1:0]  ExtB1_D4_in ;                                                                
input  [P_WIDTH-1:0]  ExtB1_D5_in ;                                                                
input  [P_WIDTH-1:0]  ExtB1_D6_in ;                                                                
input  [P_WIDTH-1:0]  ExtB1_D7_in ;                                                                
input  [P_WIDTH-1:0]  ExtB1_D8_in ;                                                                
input  [P_WIDTH-1:0]  ExtB1_D9_in ;                                                                
input  [P_WIDTH-1:0]  ExtB1_D10_in ;                                                               
input  [P_WIDTH-1:0]  ExtB1_D11_in ;                                                               
input  [P_WIDTH-1:0]  ExtB1_D12_in ;                                                               
input  [P_WIDTH-1:0]  ExtB1_D13_in ;                                                               
input  [P_WIDTH-1:0]  ExtB1_D14_in ;                                                               
input  [P_WIDTH-1:0]  ExtB1_D15_in ;                                                               
input  [P_WIDTH-1:0]  RDC_in0 ;                                                                    
input  [P_WIDTH-1:0]  RDC_in1 ;                                                                    
input  [P_WIDTH-1:0]  RDC_in2 ;                                                                    
input  [P_WIDTH-1:0]  RDC_in3 ;                                                                    
input  [P_WIDTH-1:0]  RDC_in4 ;                                                                    
input  [P_WIDTH-1:0]  RDC_in5 ;                                                                    
input  [P_WIDTH-1:0]  RDC_in6 ;                                                                    
input  [P_WIDTH-1:0]  RDC_in7 ;                                                                    
input  [P_WIDTH-1:0]  RDC_in8 ;                                                                    
input  [P_WIDTH-1:0]  RDC_in9 ;                                                                    
input  [P_WIDTH-1:0]  RDC_in10 ;                                                                   
input  [P_WIDTH-1:0]  RDC_in11 ;                                                                   
input  [P_WIDTH-1:0]  RDC_in12 ;                                                                   
input  [P_WIDTH-1:0]  RDC_in13 ;                                                                   
input  [P_WIDTH-1:0]  RDC_in14 ;                                                                   
input  [P_WIDTH-1:0]  RDC_in15 ;                                                                   
input  [A_WIDTH-1:0]  ExtMA_in ;                                                                   
input  [A_WIDTH-1:0]  AGUMA_in ;                                                                   
input  [A_WIDTH-1:0]  WMA_in ;                                                                     
input                 wen0_in ;                                                                    
input                 wen1_in ;                                                                    
input                 SD_sel ;                                                                     
                                                                                                   
                                                                                                   
                                                                                                   
	// Bank0 for op0 and op1                                                                         
	assign BN0_MEM0_Dout = (SD_sel==1'b1)? ({ExtB0_D0_in,ExtB0_D1_in}) : ({RDC_in0,RDC_in1}) ;       
	// Bank0 for op2 and op3                                                                         
	assign BN0_MEM1_Dout = (SD_sel==1'b1)? ({ExtB0_D2_in,ExtB0_D3_in}) : ({RDC_in2,RDC_in3}) ;       
	// Bank0 for op4 and op5                                                                         
	assign BN0_MEM2_Dout = (SD_sel==1'b1)? ({ExtB0_D4_in,ExtB0_D5_in}) : ({RDC_in4,RDC_in5}) ;       
	// Bank0 for op6 and op7                                                                         
	assign BN0_MEM3_Dout = (SD_sel==1'b1)? ({ExtB0_D6_in,ExtB0_D7_in}) : ({RDC_in6,RDC_in7}) ;       
	// Bank0 for op8 and op9                                                                         
	assign BN0_MEM4_Dout = (SD_sel==1'b1)? ({ExtB0_D8_in,ExtB0_D9_in}) : ({RDC_in8,RDC_in9}) ;       
	// Bank0 for op10 and op11                                                                       
	assign BN0_MEM5_Dout = (SD_sel==1'b1)? ({ExtB0_D10_in,ExtB0_D11_in}) : ({RDC_in10,RDC_in11}) ;   
	// Bank0 for op12 and op13                                                                       
	assign BN0_MEM6_Dout = (SD_sel==1'b1)? ({ExtB0_D12_in,ExtB0_D13_in}) : ({RDC_in12,RDC_in13}) ;   
	// Bank0 for op14 and op15                                                                       
	assign BN0_MEM7_Dout = (SD_sel==1'b1)? ({ExtB0_D14_in,ExtB0_D15_in}) : ({RDC_in14,RDC_in15}) ;   
	                                                                                                 
	// Bank1 for op0 and op1                                                                         
	assign BN1_MEM0_Dout = (SD_sel==1'b1)? ({ExtB1_D0_in,ExtB1_D1_in}) : ({RDC_in0,RDC_in1}) ;       
	// Bank1 for op2 and op3                                                                         
	assign BN1_MEM1_Dout = (SD_sel==1'b1)? ({ExtB1_D2_in,ExtB1_D3_in}) : ({RDC_in2,RDC_in3}) ;       
	// Bank1 for op4 and op5                                                                         
	assign BN1_MEM2_Dout = (SD_sel==1'b1)? ({ExtB1_D4_in,ExtB1_D5_in}) : ({RDC_in4,RDC_in5}) ;       
	// Bank1 for op6 and op7                                                                         
	assign BN1_MEM3_Dout = (SD_sel==1'b1)? ({ExtB1_D6_in,ExtB1_D7_in}) : ({RDC_in6,RDC_in7}) ;       
	// Bank1 for op8 and op9                                                                         
	assign BN1_MEM4_Dout = (SD_sel==1'b1)? ({ExtB1_D8_in,ExtB1_D9_in}) : ({RDC_in8,RDC_in9}) ;       
	// Bank1 for op10 and op11                                                                       
	assign BN1_MEM5_Dout = (SD_sel==1'b1)? ({ExtB1_D10_in,ExtB1_D11_in}) : ({RDC_in10,RDC_in11}) ;   
	// Bank1 for op12 and op13                                                                       
	assign BN1_MEM6_Dout = (SD_sel==1'b1)? ({ExtB1_D12_in,ExtB1_D13_in}) : ({RDC_in12,RDC_in13}) ;   
	// Bank1 for op14 and op15                                                                       
	assign BN1_MEM7_Dout = (SD_sel==1'b1)? ({ExtB1_D14_in,ExtB1_D15_in}) : ({RDC_in14,RDC_in15}) ;   
	                                                                                                 
	//                                                                                               
	assign MA0_out = (SD_sel==1'b1)? ExtMA_in :                                                      
					 (wen0_in==1'b1)? AGUMA_in : WMA_in ;			                                 
	//                                                                                               
	assign MA1_out = (SD_sel==1'b1)? ExtMA_in :                                                      
					 (wen1_in==1'b1)? AGUMA_in : WMA_in ;                                            
	                                                                                                 
endmodule                                                                                          
