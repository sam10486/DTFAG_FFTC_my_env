`timescale 1 ns/1 ps                                    
module R16_PipeReg4_2(A0_out,                           
					  Ac_out,                           
					  N_D1_out,                         
					  D_out,                            
                      A0_in,                            
					  Ac_in,                            
					  N_in,                             
					  D_in,                             
                      rst_n,                            
                      clk                               
                      ) ;                               
                                                        
parameter P_WIDTH     = 64 ;                            
parameter P_ZERO      = 64'h0 ;                         
                                                        
                                                        
output [P_WIDTH-1:0] A0_out ;                           
output               Ac_out ;                           
output [P_WIDTH-1:0] N_D1_out ;                         
output [P_WIDTH-1:0] D_out ;                            
                                                        
input [P_WIDTH-1:0]  A0_in ;                            
input                Ac_in ;                            
input [P_WIDTH-1:0]  N_in ;                             
input [P_WIDTH-1:0]  D_in ;                             
input                rst_n ;                            
input                clk ;                              
                                                        
reg [P_WIDTH-1:0]  A0_out ;                             
reg                Ac_out ;                             
reg [P_WIDTH-1:0]  N_D1_out ;                           
reg [P_WIDTH-1:0]  D_out ;                              
                                                        
                                                        
	//                                                  
	always @(posedge clk or negedge rst_n) begin        
		if(~rst_n) begin                                
			A0_out <= P_ZERO ;                          
			Ac_out <= 1'b0 ;                            
			N_D1_out <= P_ZERO ;                        
			D_out <= P_ZERO ;                           
		end                                             
		else begin                                      
			A0_out <= A0_in ;                           
			Ac_out <= Ac_in ;                           
			N_D1_out <= N_in ;                          
			D_out <= D_in ;                             
		end                                             
	end                                                 
                                                        
endmodule                                               
