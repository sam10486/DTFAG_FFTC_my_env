 `timescale 1 ns/1 ps                                                                      
 module CLA64clg(g_out,                                                                    
                 p_out,                                                                    
                 carry,                                                                    
                 p_in0,                                                                    
                 g_in0,                                                                    
                 p_in1,                                                                    
                 g_in1,                                                                    
                 p_in2,                                                                    
                 g_in2,                                                                    
                 p_in3,                                                                    
                 g_in3,                                                                    
                 c_in                                                                      
                 ) ;                                                                       
                                                                                           
 parameter CA_WIDTH = 3 ;                                                                  
 parameter C_1 = 0 ;                                                                       
 parameter C_2 = 1 ;                                                                       
 parameter C_3 = 2 ;                                                                       
                                                                                           
 output                g_out ;                                                             
 output                p_out ;                                                             
 output[CA_WIDTH-1:0]  carry ;                                                             
                                                                                           
 input                 p_in0 ;                                                             
 input                 g_in0 ;                                                             
 input                 p_in1 ;                                                             
 input                 g_in1 ;                                                             
 input                 p_in2 ;                                                             
 input                 g_in2 ;                                                             
 input                 p_in3 ;                                                             
 input                 g_in3 ;                                                             
 input                 c_in ;                                                              
 	                                                                                         
 	//                                                                                       
 	assign carry[C_1] = g_in0|(c_in&p_in0) ;                                                 
 	assign carry[C_2] = g_in1|(g_in0&p_in1)|(c_in&p_in0&p_in1) ;                             
 	assign carry[C_3] = g_in2|(g_in1&p_in2)|(g_in0&p_in1&p_in2)|(c_in&p_in0&p_in1&p_in2) ;   
                                                                                           
 	//                                                                                       
 	assign g_out = g_in3|(g_in2&p_in3)|(g_in1&p_in2&p_in3)|(g_in0&p_in1&p_in2&p_in3) ;       
 	assign p_out = p_in3&p_in2&p_in1&p_in0 ;                                                 
                                                                                           
 endmodule                                                                                 
