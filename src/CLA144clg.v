 //==================================================                                                                                                         
 //Writer     : Jheng-Hao Ye                                                                                                                                  
 //Date       : 2016/6/24                                                                                                                                     
 //Note       : 144-bit Carry Lookahead Generator (6-bit)                                                                                                     
 //==================================================                                                                                                         
 `timescale 1 ns/1 ps                                                                                                                                         
 module CLA144clg(g_out,                                                                                                                                      
 				 p_out,                                                                                                                                         
                  // c_out,                                                                                                                                   
 				 carry,                                                                                                                                         
                  p_in0,                                                                                                                                      
                  g_in0,                                                                                                                                      
                  p_in1,                                                                                                                                      
                  g_in1,                                                                                                                                      
                  p_in2,                                                                                                                                      
                  g_in2,                                                                                                                                      
                  p_in3,                                                                                                                                      
                  g_in3,                                                                                                                                      
 				 p_in4,                                                                                                                                         
                  g_in4,                                                                                                                                      
 				 p_in5,                                                                                                                                         
                  g_in5,                                                                                                                                      
                  c_in                                                                                                                                        
                  ) ;                                                                                                                                         
                                                                                                                                                              
 parameter CA_WIDTH = 5 ;                                                                                                                                     
 parameter C_1 = 0 ;                                                                                                                                          
 parameter C_2 = 1 ;                                                                                                                                          
 parameter C_3 = 2 ;                                                                                                                                          
 parameter C_4 = 3 ;                                                                                                                                          
 parameter C_5 = 4 ;                                                                                                                                          
                                                                                                                                                              
 output                g_out ;                                                                                                                                
 output                p_out ;                                                                                                                                
 output[CA_WIDTH-1:0]  carry ;                                                                                                                                
 // output                c_out ;                                                                                                                             
                                                                                                                                                              
 input                 p_in0 ;                                                                                                                                
 input                 g_in0 ;                                                                                                                                
 input                 p_in1 ;                                                                                                                                
 input                 g_in1 ;                                                                                                                                
 input                 p_in2 ;                                                                                                                                
 input                 g_in2 ;                                                                                                                                
 input                 p_in3 ;                                                                                                                                
 input                 g_in3 ;                                                                                                                                
 input                 p_in4 ;                                                                                                                                
 input                 g_in4 ;                                                                                                                                
 input                 p_in5 ;                                                                                                                                
 input                 g_in5 ;                                                                                                                                
 input                 c_in ;                                                                                                                                 
 	                                                                                                                                                            
 	//                                                                                                                                                          
 	assign carry[C_1] = g_in0|(c_in&p_in0) ;                                                                                                                    
 	assign carry[C_2] = g_in1|(g_in0&p_in1)|(c_in&p_in0&p_in1) ;                                                                                                
 	assign carry[C_3] = g_in2|(g_in1&p_in2)|(g_in0&p_in1&p_in2)|(c_in&p_in0&p_in1&p_in2) ;                                                                      
 	assign carry[C_4] = g_in3|(g_in2&p_in3)|(g_in1&p_in2&p_in3)|(g_in0&p_in1&p_in2&p_in3)|(c_in&p_in0&p_in1&p_in2&p_in3) ;                                      
 	assign carry[C_5] = g_in4|(g_in3&p_in4)|(g_in2&p_in3&p_in4)|(g_in1&p_in2&p_in3&p_in4)|(g_in0&p_in1&p_in2&p_in3&p_in4)|(c_in&p_in0&p_in1&p_in2&p_in3&p_in4) ;
                                                                                                                                                              
 	//g[0,144], p[0,144]                                                                                                                                        
 	assign g_out = g_in5|(g_in4&p_in5)|(g_in3&p_in4&p_in5)|(g_in2&p_in3&p_in4&p_in5)|(g_in1&p_in2&p_in3&p_in4&p_in5)|(g_in0&p_in1&p_in2&p_in3&p_in4&p_in5) ;    
 	assign p_out = p_in5&p_in4&p_in3&p_in2&p_in1&p_in0 ;                                                                                                        
 	// assign c_out = g_in5|(carry[C_5]&p_in5) ;                                                                                                                
                                                                                                                                                              
 endmodule                                                                                                                                                    
