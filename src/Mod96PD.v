 `timescale 1 ns/1 ps                                
 module Mod96PD(Ninv1_out,                           
                Ninv2_out,                           
 			   efD_out,                               
 			   dHD_out,                               
 			   dLDinv_out,                            
 			   t1D_out,                               
 			   t1_s_in,                               
 			   t1_c_in,                               
                A_in,                                
 		       N_in                                   
                ) ;                                  
 parameter D_WIDTH     = 96 ;                        
 parameter P_WIDTH     = 64 ;                        
 parameter SEG_ZERO    = 32'h0 ;                     
                                                     
 output [P_WIDTH-1:0] Ninv1_out ;                    
 output [P_WIDTH:0]   Ninv2_out ;                    
 output [P_WIDTH-1:0] efD_out ;                      
 output [P_WIDTH-1:0] dHD_out ;                      
 output [P_WIDTH-1:0] dLDinv_out ;                   
 output [P_WIDTH:0]   t1D_out ;                      
                                                     
 input [P_WIDTH-1:0] t1_s_in ;                       
 input               t1_c_in ;                       
 input [D_WIDTH-1:0] A_in ;                          
 input [P_WIDTH-1:0] N_in ;                          
                                                     
 	                                                   
 	//64-bit inverter N                                
 	assign Ninv1_out = (~N_in) ;                       
 	//65-bit inverter N                                
 	assign Ninv2_out = ~{1'b0, N_in} ;                 
 	//(2^32e)+f                                        
 	assign efD_out = {A_in[63:32], A_in[31:0]} ;       
 	//(2^32d)                                          
 	assign dHD_out = {A_in[95:64],SEG_ZERO} ;          
 	//inverter d                                       
 	assign dLDinv_out = (~{SEG_ZERO,A_in[95:64]}) ;    
 	//65-bit t1                                        
 	assign t1D_out = {t1_c_in,t1_s_in} ;               
 	                                                   
 	                                                   
 endmodule                                            
