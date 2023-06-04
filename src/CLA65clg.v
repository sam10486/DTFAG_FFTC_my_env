 `timescale 1 ns/1 ps                                                                      
 module CLA65clg(sum,                                                                      
                 c_out,                                                                    
                 carry,                                                                    
                 p_in0,                                                                    
                 g_in0,                                                                    
                 p_in1,                                                                    
                 g_in1,                                                                    
                 p_in2,                                                                    
                 g_in2,                                                                    
                 p_in3,                                                                    
                 g_in3,                                                                    
 				a_in,                                                                        
 				b_in,                                                                        
                 c_in                                                                      
                 ) ;                                                                       
                                                                                           
 parameter CA_WIDTH = 3 ;                                                                  
 parameter C_1 = 0 ;                                                                       
 parameter C_2 = 1 ;                                                                       
 parameter C_3 = 2 ;                                                                       
                                                                                           
 output                sum ;                                                               
 output                c_out ;                                                             
 output[CA_WIDTH-1:0]  carry ;                                                             
                                                                                           
 input                 p_in0 ;                                                             
 input                 g_in0 ;                                                             
 input                 p_in1 ;                                                             
 input                 g_in1 ;                                                             
 input                 p_in2 ;                                                             
 input                 g_in2 ;                                                             
 input                 p_in3 ;                                                             
 input                 g_in3 ;                                                             
 input                 a_in ;                                                              
 input                 b_in ;                                                              
 input                 c_in ;                                                              
                                                                                           
 wire                  g64_wire ;                                                          
 wire                  p64_wire ;                                                          
 wire                  c64_wire ;                                                          
                                                                                           
 	                                                                                         
 	//                                                                                       
 	assign carry[C_1] = g_in0|(c_in&p_in0) ;                                                 
 	assign carry[C_2] = g_in1|(g_in0&p_in1)|(c_in&p_in0&p_in1) ;                             
 	assign carry[C_3] = g_in2|(g_in1&p_in2)|(g_in0&p_in1&p_in2)|(c_in&p_in0&p_in1&p_in2) ;   
                                                                                           
 	//                                                                                       
 	assign c64_wire = g_in3|(carry[C_3]&p_in3) ;                                             
                                                                                           
 	//generate g                                                                             
 	assign g64_wire = a_in & b_in ;                                                          
 	//propagate p                                                                            
 	assign p64_wire = a_in ^ b_in ;                                                          
 	                                                                                         
 	//SUM                                                                                    
 	assign sum = a_in^b_in^c64_wire ;                                                        
 	//Carry Output                                                                           
 	assign c_out = g64_wire|(c64_wire&p64_wire) ;                                            
 	                                                                                         
 	                                                                                         
 endmodule                                                                                 
