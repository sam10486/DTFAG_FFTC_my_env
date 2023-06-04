 `timescale 1 ns/1 ps                          
 module Mul64(S_out,                           
 		     A_in,                               
 		     B_in,                               
              rst_n,                           
              clk                              
              ) ;                              
                                               
 parameter P_WIDTH    = 64 ;                   
 parameter PD_WIDTH   = 128 ;                  
 parameter PD_ZERO    = 128'h0 ;               
                                               
                                               
 output[PD_WIDTH-1:0] S_out ;                  
                                               
                                               
 input [P_WIDTH-1:0] A_in ;                    
 input [P_WIDTH-1:0] B_in ;                    
 input               rst_n ;                   
 input               clk ;                     
                                               
 wire [PD_WIDTH-1:0] S_wire ;                  
                                               
 reg [PD_WIDTH-1:0] S_out ;                    
 	                                             
 	//Mul                                        
 	assign S_wire = A_in*B_in ;                  
                                               
 	//                                           
 	always @(posedge clk or negedge rst_n) begin 
 		if(~rst_n) begin                         
 			S_out <= PD_ZERO ;                   
 		end                                      
 		else begin                               
 			S_out <= S_wire ;                    
 		end                                      
 	end                                          
                                               
                                               
 				                                 
 endmodule                                     
