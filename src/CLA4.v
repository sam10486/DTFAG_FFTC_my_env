 `timescale 1 ns/1 ps                                                   
 module CLA4(sum,                                                       
             g_out,                                                     
             p_out,                                                     
             a_in,                                                      
             b_in,                                                      
             c_in                                                       
             ) ;                                                        
 parameter CLA_WIDTH = 4 ;                                              
 parameter CLA_ZERO = 4'd0 ;                                            
 parameter C_1 = 0 ;                                                    
 parameter C_2 = 1 ;                                                    
 parameter C_3 = 2 ;                                                    
                                                                        
 output[CLA_WIDTH-1:0] sum ;                                            
 output                g_out ;                                          
 output                p_out ;                                          
                                                                        
 input [CLA_WIDTH-1:0] a_in ;                                           
 input [CLA_WIDTH-1:0] b_in ;                                           
 input                 c_in ;                                           
 // input                 rst_n ;                                       
 // input                 clk ;                                         
                                                                        
 wire  [CLA_WIDTH-1:0] g_wire ;                                         
 wire  [CLA_WIDTH-1:0] p_wire ;                                         
 wire  [CLA_WIDTH-2:0] c_wire ;                                         
 // wire  [CLA_WIDTH-1:0] sum_wire ;                                    
                                                                        
 // reg[CLA_WIDTH-1:0] sum ;                                            
                                                                        
                                                                        
  //generate g                                                          
  assign g_wire = a_in & b_in ;                                         
  //propagate p                                                         
  assign p_wire = a_in ^ b_in ;                                         
                                                                        
  //carry lookahead carry generator                                     
  assign c_wire[C_1] = g_wire[0]|                                       
                       (c_in&p_wire[0]) ;                               
  assign c_wire[C_2] = g_wire[1]|                                       
                       (g_wire[0]&p_wire[1])|                           
                       (c_in&p_wire[0]&p_wire[1]) ;                     
  assign c_wire[C_3] = g_wire[2]|                                       
                       (g_wire[1]&p_wire[2])|                           
                       (g_wire[0]&p_wire[1]&p_wire[2])|                 
                       (c_in&p_wire[0]&p_wire[1]&p_wire[2]) ;           
                                                                        
  //SUM                                                                 
  assign sum = a_in^b_in^{c_wire, c_in} ;                               
                                                                        
  //                                                                    
  assign g_out = g_wire[3]|                                             
                 (g_wire[2]&p_wire[3])|                                 
                 (g_wire[1]&p_wire[2]&p_wire[3])|                       
                 (g_wire[0]&p_wire[1]&p_wire[2]&p_wire[3]) ;            
  assign p_out = p_wire[3]&p_wire[2]&p_wire[1]&p_wire[0] ;              
                                                                        
                                                                        
 endmodule                                                              
