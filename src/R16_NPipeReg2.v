`timescale 1 ns/1 ps                                  
module R16_NPipeReg2(Ninv2_D1_out,                    
                     N_D2_out,                        
					 Ninv2_in,                           
                     N_in,                            
                     rst_n,                           
                     clk                              
                     ) ;                              
                                                      
parameter P_WIDTH     = 64 ;                          
parameter P_ZERO      = 64'h0 ;                       
parameter P1_ZERO     = 65'h0 ;                       
                                                      
                                                      
output [P_WIDTH:0]   Ninv2_D1_out ;                   
output [P_WIDTH-1:0] N_D2_out ;                       
                                                      
input [P_WIDTH:0]    Ninv2_in ;                       
input [P_WIDTH-1:0]  N_in ;                           
input                rst_n ;                          
input                clk ;                            
                                                      
reg [P_WIDTH-1:0]  N_D2_out ;                         
reg [P_WIDTH:0]    Ninv2_D1_out ;                     
                                                      
	//                                                   
	always @(posedge clk or negedge rst_n) begin         
		if(~rst_n) begin                                 
			N_D2_out <= P_ZERO ;                         
			Ninv2_D1_out <= P1_ZERO ;                    
		end                                              
		else begin                                       
			N_D2_out <= N_in ;                           
			Ninv2_D1_out <= Ninv2_in ;                   
		end                                              
	end                                                  
                                                      
endmodule                                             
