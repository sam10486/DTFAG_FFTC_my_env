 `timescale 1 ns/1 ps                                                   
 module CLA1(sum,                                                       
             g_out,                                                     
             p_out,                                                     
             a_in,                                                      
             b_in,                                                      
             c_in                                                       
             ) ;                                                        
                                                                        
 output                sum ;                                            
 output                g_out ;                                          
 output                p_out ;                                          
                                                                        
 input                 a_in ;                                           
 input                 b_in ;                                           
 input                 c_in ;                                           
                                                                        
 wire                  g_wire ;                                         
 wire                  p_wire ;                                         
                                                                        
                                                                        
  //generate g                                                          
  assign g_wire = a_in & b_in ;                                         
  //propagate p                                                         
  assign p_wire = a_in ^ b_in ;                                         
                                                                        
  //SUM                                                                 
  assign sum = a_in^b_in^c_in ;                                         
                                                                        
  //                                                                    
  assign g_out = g_wire|                                                
                 (c_in & p_wire);                                       
  assign p_out = p_wire;                                                
                                                                        
                                                                        
 endmodule                                                              
