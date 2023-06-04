 `timescale 1 ns/1 ps                             
 module ModMux(S_out,                             
               A_in,                              
 		      B_in,                                 
 			  Sel_in                                
               ) ;                                
 parameter P_WIDTH     = 64 ;                     
                                                  
 output[P_WIDTH-1:0] S_out ;                      
                                                  
 input [P_WIDTH-1:0] A_in ;                       
 input [P_WIDTH-1:0] B_in ;                       
 input               Sel_in ;                     
                                                  
 	//                                              
 	assign S_out = (Sel_in==1'b1) ? A_in : B_in ;   
 	                                                
 	                                                
 endmodule                                        
