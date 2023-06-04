 `timescale 1 ns/1 ps                                  
 module CLA32(sum,                                     
              c_out,                                   
              a_in,                                    
              b_in,                                    
              c_in                                     
              // rst_n,                                
              // clk                                   
              ) ;                                      
 parameter CLA_WIDTH = 32 ;                            
 parameter CA_WIDTH = 1 ;                              
 parameter PG_WIDTH = 2 ;                              
 //                                                    
 parameter C_1 = 0 ;                                   
 parameter C_2 = 1 ;                                   
 //                                                    
 parameter SEG_1 = 16 ;                                
 parameter SEG_2 = 32 ;                                
                                                       
                                                       
 output[CLA_WIDTH-1:0] sum ;                           
 output                c_out ;                         
                                                       
 input [CLA_WIDTH-1:0] a_in ;                          
 input [CLA_WIDTH-1:0] b_in ;                          
 input                 c_in ;                          
 // input                 rst_n ;                      
 // input                 clk ;                        
                                                       
 wire  [PG_WIDTH-1:0]  g_wire ;                        
 wire  [PG_WIDTH-1:0]  p_wire ;                        
 wire  [CA_WIDTH-1:0]  carry ;                         
                                                       
                                                       
     //                                                
     CLA16 u_CLA16_0(.sum(sum[SEG_1-1:0]),             
                     .g_out(g_wire[C_1]),              
                     .p_out(p_wire[C_1]),              
                     .a_in(a_in[SEG_1-1:0]),           
                     .b_in(b_in[SEG_1-1:0]),           
                     .c_in(c_in) // c0                 
                     // .rst_n(rst_n),                 
                     // .clk(clk)                      
                     ) ;                               
     //                                                
     CLA16 u_CLA16_1(.sum(sum[SEG_2-1:SEG_1]),         
                     .g_out(g_wire[C_2]),              
                     .p_out(p_wire[C_2]),              
                     .a_in(a_in[SEG_2-1:SEG_1]),       
                     .b_in(b_in[SEG_2-1:SEG_1]),       
                     .c_in(carry[C_1]) // c16          
                     // .rst_n(rst_n),                 
                     // .clk(clk)                      
                     ) ;                               
                                                       
     //                                                
     CLA32clg u_CLA32clg(.c_out(c_out), // c32         
                         .carry(carry), // c16         
                         .p_in0(p_wire[C_1]),          
                         .g_in0(g_wire[C_1]),          
                         .p_in1(p_wire[C_2]),          
                         .g_in1(g_wire[C_2]),          
                         .c_in(c_in) // c0             
                          ) ;					      
                                                       
 endmodule                                             
