 `timescale 1 ns/1 ps                                         
 module CLA96(sum,                                            
 			 c_out,                                          
              a_in,                                           
              b_in,                                           
              c_in                                            
 			 // rst_n,                                       
              // clk                                          
              ) ;                                             
 			                                                 
 parameter CLA_WIDTH = 96 ;                                   
 parameter CA_WIDTH = 3 ;                                     
 parameter PG_WIDTH = 4 ;                                     
 parameter C_1 = 0 ;                                          
 parameter C_2 = 1 ;                                          
 parameter C_3 = 2 ;                                          
 parameter C_4 = 3 ;                                          
 parameter SEG_1 = 24 ;                                       
 parameter SEG_2 = 48 ;                                       
 parameter SEG_3 = 72 ;                                       
 parameter SEG_4 = 96 ;                                       
                                                              
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
 	CLA24 u_CLA24_0(.sum(sum[SEG_1-1:0]),                    
                     .g_out(g_wire[C_1]),                     
                     .p_out(p_wire[C_1]),                     
                     .a_in(a_in[SEG_1-1:0]),                  
                     .b_in(b_in[SEG_1-1:0]),                  
                     .c_in(c_in) // c0                        
 				    // .rst_n(rst_n),                        
                     // .clk(clk)                             
                     ) ;                                      
     //                                                       
 	CLA24 u_CLA24_1(.sum(sum[SEG_2-1:SEG_1]),                
                     .g_out(g_wire[C_2]),                     
                     .p_out(p_wire[C_2]),                     
                     .a_in(a_in[SEG_2-1:SEG_1]),              
                     .b_in(b_in[SEG_2-1:SEG_1]),              
                     .c_in(carry[C_1]) // c24                 
 				    // .rst_n(rst_n),                        
                     // .clk(clk)                             
                     ) ;                                      
     //                                                       
 	CLA24 u_CLA24_2(.sum(sum[SEG_3-1:SEG_2]),                
                     .g_out(g_wire[C_3]),                     
                     .p_out(p_wire[C_3]),                     
                     .a_in(a_in[SEG_3-1:SEG_2]),              
                     .b_in(b_in[SEG_3-1:SEG_2]),              
                     .c_in(carry[C_2]) // c48                 
 				    // .rst_n(rst_n),                        
                     // .clk(clk)                             
                     ) ;                                      
     //                                                       
 	CLA24 u_CLA24_3(.sum(sum[SEG_4-1:SEG_3]),                
                     .g_out(g_wire[C_4]),                     
                     .p_out(p_wire[C_4]),                     
                     .a_in(a_in[SEG_4-1:SEG_3]),              
                     .b_in(b_in[SEG_4-1:SEG_3]),              
                     .c_in(carry[C_3]) // c72                 
 				    // .rst_n(rst_n),                        
                     // .clk(clk)                             
                     ) ;                                      
 	                                                         
                                                              
 	//                                                       
 	CLA96clg u_CLA96clg(.c_out(c_out),                       
 						.carry(carry), // c24, c48, c72      
                         .p_in0(p_wire[C_1]),                 
                         .g_in0(g_wire[C_1]),                 
                         .p_in1(p_wire[C_2]),                 
                         .g_in1(g_wire[C_2]),                 
                         .p_in2(p_wire[C_3]),                 
                         .g_in2(g_wire[C_3]),                 
                         .p_in3(p_wire[C_4]),                 
                         .g_in3(g_wire[C_4]),                 
                         .c_in(c_in) // c0                    
                         ) ;                                  
                                                              
 endmodule                                                    
