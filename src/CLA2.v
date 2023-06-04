 `timescale 1 ns/1 ps                                                   
 module CLA2(sum,                                                       
             g_out,                                                     
             p_out,                                                     
             a_in,                                                      
             b_in,                                                      
             c_in                                                       
             ) ;                                                        
 parameter CLA_WIDTH = 2 ;                                              
 parameter CLA_ZERO = 2'd0 ;                                            
                                                                        
 output[CLA_WIDTH-1:0] sum ;                                            
 output                g_out ;                                          
 output                p_out ;                                          
                                                                        
 input [CLA_WIDTH-1:0] a_in ;                                           
 input [CLA_WIDTH-1:0] b_in ;                                           
 input                 c_in ;                                           
                                                                        
 wire  [CLA_WIDTH-1:0] g_wire ;                                         
 wire  [CLA_WIDTH-1:0] p_wire ;                                         
 wire                  c_wire ;                                         
                                                                        
                                                                        
                                                                        
  //generate g                                                          
  assign g_wire = a_in & b_in ;                                         
  //propagate p                                                         
  assign p_wire = a_in ^ b_in ;                                         
                                                                        
  //carry lookahead carry generator                                     
  assign c_wire      = g_wire[0]|                                       
                       (c_in & p_wire[0]) ;                             
  //SUM                                                                 
  assign sum = a_in^b_in^{c_wire, c_in} ;                               
                                                                        
  //                                                                    
  assign g_out = g_wire[1]|                                             
                 (g_wire[0]&p_wire[1]);                                 
  assign p_out = p_wire[1]&p_wire[0] ;                                  
                                                                        
                                                                        
 endmodule                                                              
