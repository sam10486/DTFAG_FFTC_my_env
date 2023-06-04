`timescale 1 ns/1 ps                                     
module R16_PipeReg4(A0_out,                              
					  Ac_out,                              
					  Ninv2_D2_out,                        
                    A0_in,                               
					  Ac_in,                               
					  Ninv2_in,                            
                    rst_n,                               
                    clk                                  
                    ) ;                                  
                                                         
parameter P_WIDTH     = 64 ;                             
parameter P_ZERO      = 64'h0 ;                          
parameter P1_ZERO     = 65'h0 ;                          
                                                         
                                                         
output [P_WIDTH-1:0] A0_out ;                            
output               Ac_out ;                            
output [P_WIDTH:0]   Ninv2_D2_out ;                      
                                                         
input [P_WIDTH-1:0]  A0_in ;                             
input                Ac_in ;                             
input [P_WIDTH:0]    Ninv2_in ;                          
input                rst_n ;                             
input                clk ;                               
                                                         
reg [P_WIDTH-1:0]  A0_out ;                              
reg                Ac_out ;                              
reg [P_WIDTH:0]    Ninv2_D0_reg ;                        
reg [P_WIDTH:0]    Ninv2_D2_out ;                        
                                                         
                                                         
	//Ninv2 delay 2-cycle                                  
	always @(posedge clk or negedge rst_n) begin           
		if(~rst_n) begin                                   
			A0_out <= P_ZERO ;                             
			Ac_out <= 1'b0 ;                               
			Ninv2_D0_reg <= P1_ZERO ;                      
			Ninv2_D2_out <= P1_ZERO ;                      
		end                                                
		else begin                                         
			A0_out <= A0_in ;                              
			Ac_out <= Ac_in ;                              
			Ninv2_D0_reg <= Ninv2_in ;                     
			Ninv2_D2_out <= Ninv2_D0_reg ;                 
		end                                                
	end                                                    
                                                         
endmodule                                                
