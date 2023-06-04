`timescale 1 ns/1 ps                                     
module R16_PipeReg2(A0_out,                              
					  Ac_out,                                
                    A0_in,                               
					  Ac_in,                                 
                    rst_n,                               
                    clk                                  
                    ) ;                                  
                                                         
parameter P_WIDTH     = 64 ;                             
parameter P_ZERO      = 64'h0 ;                          
                                                         
                                                         
output [P_WIDTH-1:0] A0_out ;                            
output               Ac_out ;                            
                                                         
input [P_WIDTH-1:0]  A0_in ;                             
input                Ac_in ;                             
input                rst_n ;                             
input                clk ;                               
                                                         
reg [P_WIDTH-1:0]  A0_out ;                              
reg [P_WIDTH-1:0]  A1_out ;                              
reg                Ac_out ;                              
                                                         
                                                         
	//                                                     
	always @(posedge clk or negedge rst_n) begin           
		if(~rst_n) begin                                   
			A0_out <= P_ZERO ;                             
			Ac_out <= 1'b0 ;                               
		end                                                
		else begin                                         
			A0_out <= A0_in ;                              
			Ac_out <= Ac_in ;                              
		end                                                
	end                                                    
                                                         
endmodule                                                
