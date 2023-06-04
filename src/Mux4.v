`timescale 1 ns/1 ps                                         
module Mux4(  Result0_out,                                       
			  Result1_out,                                         
			  Result2_out,                                         
			  Result3_out,                                         
			  Result4_out,                                         
			  Result5_out,                                         
			  Result6_out,                                         
			  Result7_out,                                         
			  Result8_out,                                         
			  Result9_out,                                         
			  Result10_out,                                        
			  Result11_out,                                        
			  Result12_out,                                        
			  Result13_out,                                        
			  Result14_out,                                        
			  Result15_out,                                        
			  NTTD0_in,                                         
              NTTD1_in,                                       
              NTTD2_in,                                       
              NTTD3_in,                                       
			  NTTD4_in,                                         
			  NTTD5_in,                                         
			  NTTD6_in,                                         
			  NTTD7_in,                                         
			  NTTD8_in,                                         
			  NTTD9_in,                                         
			  NTTD10_in,                                        
			  NTTD11_in,                                        
			  NTTD12_in,                                        
			  NTTD13_in,                                        
			  NTTD14_in,                                        
			  NTTD15_in                                           
			  ) ;                                                
			                                                   
parameter P_WIDTH   = 64 ;                                   
parameter P_ZERO    = 64'h0 ;                                
                                                             
output [P_WIDTH-1:0] Result0_out ;                             
output [P_WIDTH-1:0] Result1_out ;                             
output [P_WIDTH-1:0] Result2_out ;                             
output [P_WIDTH-1:0] Result3_out ;                             
output [P_WIDTH-1:0] Result4_out ;                             
output [P_WIDTH-1:0] Result5_out ;                             
output [P_WIDTH-1:0] Result6_out ;                             
output [P_WIDTH-1:0] Result7_out ;                             
output [P_WIDTH-1:0] Result8_out ;                             
output [P_WIDTH-1:0] Result9_out ;                             
output [P_WIDTH-1:0] Result10_out ;                            
output [P_WIDTH-1:0] Result11_out ;                            
output [P_WIDTH-1:0] Result12_out ;                            
output [P_WIDTH-1:0] Result13_out ;                            
output [P_WIDTH-1:0] Result14_out ;                            
output [P_WIDTH-1:0] Result15_out ;                            
                                                             
input [P_WIDTH-1:0]  NTTD0_in ;                             
input [P_WIDTH-1:0]  NTTD1_in ;                             
input [P_WIDTH-1:0]  NTTD2_in ;                             
input [P_WIDTH-1:0]  NTTD3_in ;                             
input [P_WIDTH-1:0]  NTTD4_in ;                             
input [P_WIDTH-1:0]  NTTD5_in ;                             
input [P_WIDTH-1:0]  NTTD6_in ;                             
input [P_WIDTH-1:0]  NTTD7_in ;                             
input [P_WIDTH-1:0]  NTTD8_in ;                             
input [P_WIDTH-1:0]  NTTD9_in ;                             
input [P_WIDTH-1:0]  NTTD10_in ;                            
input [P_WIDTH-1:0]  NTTD11_in ;                            
input [P_WIDTH-1:0]  NTTD12_in ;                            
input [P_WIDTH-1:0]  NTTD13_in ;                            
input [P_WIDTH-1:0]  NTTD14_in ;                            
input [P_WIDTH-1:0]  NTTD15_in ;                                                          
                                                             
                                                             
                                                             
	assign Result0_out = NTTD0_in;    
	//                        
	assign Result1_out = NTTD1_in;	   
	//                        
	assign Result2_out = NTTD2_in;	   
	//                        
	assign Result3_out = NTTD3_in;	   
	//                        
	assign Result4_out = NTTD4_in;	   
	//                        
	assign Result5_out = NTTD5_in;	   
	//                       
	assign Result6_out = NTTD6_in;    
	//                       
	assign Result7_out = NTTD7_in;	   
	//                       
	assign Result8_out = NTTD8_in;	   
	//                        
	assign Result9_out = NTTD9_in;	   
	//                                     
	assign Result10_out = NTTD10_in;  
	//                      
	assign Result11_out = NTTD11_in;  
	//                       
	assign Result12_out = NTTD12_in;  
	//                       
	assign Result13_out = NTTD13_in;  
	//                       
	assign Result14_out = NTTD14_in;  
	//                       
	assign Result15_out = NTTD15_in;  
	                                                           
	                                                           
endmodule                                                    
