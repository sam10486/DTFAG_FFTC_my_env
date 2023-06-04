 `timescale 1 ns/1 ps                                              
 module CLA192(sum,                                                
               c_out,                                              
               a_in,                                               
               b_in,                                               
               c_in                                                
 			  // rst_n,                                            
               // clk                                              
               ) ;                                                 
 parameter CLA_WIDTH = 192 ;                                       
 parameter CA_WIDTH = 2 ;                                          
 parameter PG_WIDTH = 3 ;                                          
 //                                                                
 parameter C_1 = 0 ;                                               
 parameter C_2 = 1 ;                                               
 parameter C_3 = 2 ;                                               
 //                                                                
 parameter SEG_1 = 64 ;                                            
 parameter SEG_2 = 128 ;                                           
 parameter SEG_3 = 192 ;                                           
                                                                   
                                                                   
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
 	CLA64 u_CLA64_0(.sum(sum[SEG_1-1:0]),                          
 			        .g_out(g_wire[C_1]),                           
                     .p_out(p_wire[C_1]),                          
                     .a_in(a_in[SEG_1-1:0]),                       
                     .b_in(b_in[SEG_1-1:0]),                       
                     .c_in(c_in) // c0                             
 					// .rst_n(rst_n),                              
                     // .clk(clk)                                  
                     ) ;                                           
 	//                                                             
 	CLA64 u_CLA64_1(.sum(sum[SEG_2-1:SEG_1]),                      
 			        .g_out(g_wire[C_2]),                           
                     .p_out(p_wire[C_2]),                          
                     .a_in(a_in[SEG_2-1:SEG_1]),                   
                     .b_in(b_in[SEG_2-1:SEG_1]),                   
                     .c_in(carry[C_1]) // c64                      
 					// .rst_n(rst_n),                              
                     // .clk(clk)                                  
                     ) ;                                           
 	//                                                             
 	CLA64 u_CLA64_2(.sum(sum[SEG_3-1:SEG_2]),                      
 			        .g_out(g_wire[C_3]),                           
                     .p_out(p_wire[C_3]),                          
                     .a_in(a_in[SEG_3-1:SEG_2]),                   
                     .b_in(b_in[SEG_3-1:SEG_2]),                   
                     .c_in(carry[C_2]) // c128                     
 					// .rst_n(rst_n),                              
                     // .clk(clk)                                  
                     ) ;                                           
 	                                                               
 	//                                                             
 	CLA192clg u_CLA192clg(.c_out(c_out),                           
 	                      // .g_out(g_out),                        
 						  // .p_out(p_out),                        
                           .carry(carry), // c64, c128             
                           .p_in0(p_wire[C_1]),                    
                           .g_in0(g_wire[C_1]),                    
                           .p_in1(p_wire[C_2]),                    
                           .g_in1(g_wire[C_2]),                    
                           .p_in2(p_wire[C_3]),                    
                           .g_in2(g_wire[C_3]),                    
                           .c_in(c_in) // c0                       
                            ) ;                                    
                                                                   
 endmodule                                                         
