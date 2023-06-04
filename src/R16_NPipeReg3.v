`timescale 1 ns/1 ps                                
module R16_NPipeReg3(N_D4_out,                      
                     N_in,                          
                     rst_n,                         
                     clk                            
                     ) ;                            
                                                    
parameter P_WIDTH     = 64 ;                        
parameter P_ZERO      = 64'h0 ;                     
                                                    
                                                    
output [P_WIDTH-1:0] N_D4_out ;                     
                                                    
input [P_WIDTH-1:0]  N_in ;                         
input                rst_n ;                        
input                clk ;                          
                                                    
reg [P_WIDTH-1:0]  N_D4_out ;                       
                                                    
                                                    
	//                                                 
	always @(posedge clk or negedge rst_n) begin       
		if(~rst_n) begin                               
			N_D4_out <= P_ZERO ;                       
		end                                            
		else begin                                     
			N_D4_out <= N_in ;                      
		end                                            
	end                                                
                                                    
endmodule                                           
