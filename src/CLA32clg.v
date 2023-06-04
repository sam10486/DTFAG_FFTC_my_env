 `timescale 1 ns/1 ps                                
 module CLA32clg(c_out,                              
                 carry,                              
                 p_in0,                              
                 g_in0,                              
                 p_in1,                              
                 g_in1,                              
                 c_in                                
                 ) ;                                 
                                                     
 parameter CA_WIDTH = 1 ;                            
 parameter C_1 = 0 ;                                 
                                                     
 output                c_out ;                       
 output[CA_WIDTH-1:0]  carry ;                       
                                                     
 input                 p_in0 ;                       
 input                 g_in0 ;                       
 input                 p_in1 ;                       
 input                 g_in1 ;                       
 input                 c_in ;                        
 	                                                   
 	//                                                 
 	assign carry[C_1] = g_in0|(c_in&p_in0) ;           
                                                     
 	assign c_out = g_in1|(carry[C_1]&p_in1) ;          
 	                                                   
                                                     
 endmodule                                           
