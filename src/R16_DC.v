 `timescale 1 ns/1 ps                                                                         
 module R16_DC(RDC_out0,                                                                      
 			  RDC_out1,                                                                      
 			  RDC_out2,                                                                      
 			  RDC_out3,                                                                      
 			  RDC_out4,                                                                      
 			  RDC_out5,                                                                      
 			  RDC_out6,                                                                      
 			  RDC_out7,                                                                      
 			  RDC_out8,                                                                      
 			  RDC_out9,                                                                      
 			  RDC_out10,                                                                     
 			  RDC_out11,                                                                     
 			  RDC_out12,                                                                     
 			  RDC_out13,                                                                     
 			  RDC_out14,                                                                     
 			  RDC_out15,                                                                     
               RDC_in0,                                                                       
 		      RDC_in1,                                                                       
 			  RDC_in2,                                                                       
 			  RDC_in3,                                                                       
 			  RDC_in4,                                                                       
 			  RDC_in5,                                                                       
 			  RDC_in6,                                                                       
 			  RDC_in7,                                                                       
 			  RDC_in8,                                                                       
 			  RDC_in9,                                                                       
 			  RDC_in10,                                                                      
 			  RDC_in11,                                                                      
 			  RDC_in12,                                                                      
 			  RDC_in13,                                                                      
 			  RDC_in14,                                                                      
 			  RDC_in15,                                                                      
 			  RDC_sel,                                                                       
 			  DC_mode_sel,                                                                   
               rst_n,                                                                         
               clk                                                                            
               ) ;                                                                            
 parameter P_WIDTH     = 64 ;                                                                 
                                                                                              
 parameter P_ZERO      = 64'h0 ;                                                              
                                                                                              
                                                                                              
 output[P_WIDTH-1:0] RDC_out0 ;                                                               
 output[P_WIDTH-1:0] RDC_out1 ;                                                               
 output[P_WIDTH-1:0] RDC_out2 ;                                                               
 output[P_WIDTH-1:0] RDC_out3 ;                                                               
 output[P_WIDTH-1:0] RDC_out4 ;                                                               
 output[P_WIDTH-1:0] RDC_out5 ;                                                               
 output[P_WIDTH-1:0] RDC_out6 ;                                                               
 output[P_WIDTH-1:0] RDC_out7 ;                                                               
 output[P_WIDTH-1:0] RDC_out8 ;                                                               
 output[P_WIDTH-1:0] RDC_out9 ;                                                               
 output[P_WIDTH-1:0] RDC_out10 ;                                                              
 output[P_WIDTH-1:0] RDC_out11 ;                                                              
 output[P_WIDTH-1:0] RDC_out12 ;                                                              
 output[P_WIDTH-1:0] RDC_out13 ;                                                              
 output[P_WIDTH-1:0] RDC_out14 ;                                                              
 output[P_WIDTH-1:0] RDC_out15 ;                                                              
                                                                                              
 input [P_WIDTH-1:0] RDC_in0 ;                                                                
 input [P_WIDTH-1:0] RDC_in1 ;                                                                
 input [P_WIDTH-1:0] RDC_in2 ;                                                                
 input [P_WIDTH-1:0] RDC_in3 ;                                                                
 input [P_WIDTH-1:0] RDC_in4 ;                                                                
 input [P_WIDTH-1:0] RDC_in5 ;                                                                
 input [P_WIDTH-1:0] RDC_in6 ;                                                                
 input [P_WIDTH-1:0] RDC_in7 ;                                                                
 input [P_WIDTH-1:0] RDC_in8 ;                                                                
 input [P_WIDTH-1:0] RDC_in9 ;                                                                
 input [P_WIDTH-1:0] RDC_in10 ;                                                               
 input [P_WIDTH-1:0] RDC_in11 ;                                                               
 input [P_WIDTH-1:0] RDC_in12 ;                                                               
 input [P_WIDTH-1:0] RDC_in13 ;                                                               
 input [P_WIDTH-1:0] RDC_in14 ;                                                               
 input [P_WIDTH-1:0] RDC_in15 ;                                                               
 input [3:0]         RDC_sel ;                                                                
 input [1:0]         DC_mode_sel ;                                                            
 input               rst_n ;                                                                  
 input               clk ;                                                                    
                                                                                              
                                                                                              
 reg   [P_WIDTH-1:0] RDC_out0 ;                                                               
 reg   [P_WIDTH-1:0] RDC_out1 ;                                                               
 reg   [P_WIDTH-1:0] RDC_out2 ;                                                               
 reg   [P_WIDTH-1:0] RDC_out3 ;                                                               
 reg   [P_WIDTH-1:0] RDC_out4 ;                                                               
 reg   [P_WIDTH-1:0] RDC_out5 ;                                                               
 reg   [P_WIDTH-1:0] RDC_out6 ;                                                               
 reg   [P_WIDTH-1:0] RDC_out7 ;                                                               
 reg   [P_WIDTH-1:0] RDC_out8 ;                                                               
 reg   [P_WIDTH-1:0] RDC_out9 ;                                                               
 reg   [P_WIDTH-1:0] RDC_out10 ;                                                              
 reg   [P_WIDTH-1:0] RDC_out11 ;                                                              
 reg   [P_WIDTH-1:0] RDC_out12 ;                                                              
 reg   [P_WIDTH-1:0] RDC_out13 ;                                                              
 reg   [P_WIDTH-1:0] RDC_out14 ;                                                              
                                                                                              
                                                                                              
 reg   [P_WIDTH-1:0] D1_0_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D2_0_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D2_1_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D3_0_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D3_1_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D3_2_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D4_0_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D4_1_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D4_2_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D4_3_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D5_0_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D5_1_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D5_2_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D5_3_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D5_4_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D6_0_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D6_1_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D6_2_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D6_3_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D6_4_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D6_5_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D7_0_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D7_1_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D7_2_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D7_3_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D7_4_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D7_5_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D7_6_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D8_0_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D8_1_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D8_2_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D8_3_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D8_4_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D8_5_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D8_6_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D8_7_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D9_0_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D9_1_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D9_2_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D9_3_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D9_4_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D9_5_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D9_6_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D9_7_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D9_8_in_reg ;                                                            
 reg   [P_WIDTH-1:0] D10_0_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D10_1_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D10_2_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D10_3_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D10_4_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D10_5_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D10_6_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D10_7_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D10_8_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D10_9_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D11_0_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D11_1_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D11_2_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D11_3_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D11_4_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D11_5_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D11_6_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D11_7_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D11_8_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D11_9_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D11_10_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D12_0_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D12_1_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D12_2_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D12_3_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D12_4_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D12_5_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D12_6_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D12_7_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D12_8_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D12_9_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D12_10_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D12_11_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D13_0_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D13_1_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D13_2_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D13_3_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D13_4_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D13_5_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D13_6_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D13_7_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D13_8_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D13_9_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D13_10_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D13_11_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D13_12_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D14_0_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D14_1_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D14_2_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D14_3_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D14_4_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D14_5_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D14_6_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D14_7_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D14_8_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D14_9_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D14_10_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D14_11_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D14_12_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D14_13_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D15_0_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D15_1_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D15_2_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D15_3_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D15_4_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D15_5_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D15_6_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D15_7_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D15_8_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D15_9_in_reg ;                                                           
 reg   [P_WIDTH-1:0] D15_10_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D15_11_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D15_12_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D15_13_in_reg ;                                                          
 reg   [P_WIDTH-1:0] D15_14_in_reg ;                                                          
                                                                                              
                                                                                              
 reg   [P_WIDTH-1:0] D0_0_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D0_1_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D0_2_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D0_3_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D0_4_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D0_5_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D0_6_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D0_7_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D0_8_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D0_9_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D0_10_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D0_11_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D0_12_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D0_13_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D1_0_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D1_1_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D1_2_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D1_3_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D1_4_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D1_5_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D1_6_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D1_7_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D1_8_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D1_9_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D1_10_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D1_11_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D1_12_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D2_0_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D2_1_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D2_2_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D2_3_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D2_4_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D2_5_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D2_6_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D2_7_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D2_8_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D2_9_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D2_10_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D2_11_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D3_0_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D3_1_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D3_2_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D3_3_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D3_4_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D3_5_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D3_6_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D3_7_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D3_8_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D3_9_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D3_10_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D4_0_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D4_1_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D4_2_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D4_3_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D4_4_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D4_5_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D4_6_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D4_7_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D4_8_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D4_9_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D5_0_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D5_1_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D5_2_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D5_3_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D5_4_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D5_5_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D5_6_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D5_7_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D5_8_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D6_0_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D6_1_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D6_2_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D6_3_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D6_4_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D6_5_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D6_6_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D6_7_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D7_0_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D7_1_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D7_2_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D7_3_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D7_4_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D7_5_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D7_6_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D8_0_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D8_1_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D8_2_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D8_3_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D8_4_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D8_5_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D9_0_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D9_1_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D9_2_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D9_3_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D9_4_out_reg ;                                                           
 reg   [P_WIDTH-1:0] D10_0_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D10_1_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D10_2_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D10_3_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D11_0_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D11_1_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D11_2_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D12_0_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D12_1_out_reg ;                                                          
 reg   [P_WIDTH-1:0] D13_0_out_reg ;                                                          
                                                                                              
                                                                                              
 wire  [P_WIDTH-1:0]  D0_wire ;                                                               
 wire  [P_WIDTH-1:0]  D1_wire ;                                                               
 wire  [P_WIDTH-1:0]  D2_wire ;                                                               
 wire  [P_WIDTH-1:0]  D3_wire ;                                                               
 wire  [P_WIDTH-1:0]  D4_wire ;                                                               
 wire  [P_WIDTH-1:0]  D5_wire ;                                                               
 wire  [P_WIDTH-1:0]  D6_wire ;                                                               
 wire  [P_WIDTH-1:0]  D7_wire ;                                                               
 wire  [P_WIDTH-1:0]  D8_wire ;                                                               
 wire  [P_WIDTH-1:0]  D9_wire ;                                                               
 wire  [P_WIDTH-1:0]  D10_wire ;                                                              
 wire  [P_WIDTH-1:0]  D11_wire ;                                                              
 wire  [P_WIDTH-1:0]  D12_wire ;                                                              
 wire  [P_WIDTH-1:0]  D13_wire ;                                                              
 wire  [P_WIDTH-1:0]  D14_wire ;                                                              
 wire  [P_WIDTH-1:0]  RDC_out15 ;                                                             
                                                                                              
                                                                                              
 	//                                                                                       
 	assign D0_wire =  //(DC_mode_sel == 2'd1)? RDC_in0 :                                       
                       (RDC_sel==4'd0)? RDC_in0 :                                             
 					  (RDC_sel==4'd1)? D1_0_in_reg :                                         
 					  (RDC_sel==4'd2)? D2_1_in_reg :                                         
 					  (RDC_sel==4'd3)? D3_2_in_reg :                                         
 					  (RDC_sel==4'd4)? D4_3_in_reg :                                         
 					  (RDC_sel==4'd5)? D5_4_in_reg :                                         
 					  (RDC_sel==4'd6)? D6_5_in_reg :                                         
 					  (RDC_sel==4'd7)? D7_6_in_reg :                                         
 					  (RDC_sel==4'd8)? D8_7_in_reg :                                         
 					  (RDC_sel==4'd9)? D9_8_in_reg :                                         
 					  (RDC_sel==4'd10)? D10_9_in_reg :                                       
 					  (RDC_sel==4'd11)? D11_10_in_reg :                                      
 					  (RDC_sel==4'd12)? D12_11_in_reg :                                      
 					  (RDC_sel==4'd13)? D13_12_in_reg :                                      
 					  (RDC_sel==4'd14)? D14_13_in_reg :                                      
 					                    D15_14_in_reg ; // RDC_sel==4'd15                    
 									                                                         
 	//                                                                                       
 	assign D1_wire =  //(DC_mode_sel == 2'd1)? D1_0_in_reg :                                   
                       (RDC_sel==4'd0)? D15_14_in_reg :                                       
 					  (RDC_sel==4'd1)? RDC_in0 :                                             
 					  (RDC_sel==4'd2)? D1_0_in_reg :                                         
 					  (RDC_sel==4'd3)? D2_1_in_reg :                                         
 					  (RDC_sel==4'd4)? D3_2_in_reg :                                         
 					  (RDC_sel==4'd5)? D4_3_in_reg :                                         
 					  (RDC_sel==4'd6)? D5_4_in_reg :                                         
 					  (RDC_sel==4'd7)? D6_5_in_reg :                                         
 					  (RDC_sel==4'd8)? D7_6_in_reg :                                         
 					  (RDC_sel==4'd9)? D8_7_in_reg :                                         
 					  (RDC_sel==4'd10)? D9_8_in_reg :                                        
 					  (RDC_sel==4'd11)? D10_9_in_reg :                                       
 					  (RDC_sel==4'd12)? D11_10_in_reg :                                      
 					  (RDC_sel==4'd13)? D12_11_in_reg :                                      
 					  (RDC_sel==4'd14)? D13_12_in_reg :                                      
 					                    D14_13_in_reg ; // RDC_sel==4'd15                    
 									                                                         
 	//                                                                                       
 	assign D2_wire =  //(DC_mode_sel == 2'd1)? D2_1_in_reg :                                   
 	                  (RDC_sel==4'd0)? D14_13_in_reg :                                       
 					  (RDC_sel==4'd1)? D15_14_in_reg :                                       
 					  (RDC_sel==4'd2)? RDC_in0 :                                             
 					  (RDC_sel==4'd3)? D1_0_in_reg :                                         
 					  (RDC_sel==4'd4)? D2_1_in_reg :                                         
 					  (RDC_sel==4'd5)? D3_2_in_reg :                                         
 					  (RDC_sel==4'd6)? D4_3_in_reg :                                         
 					  (RDC_sel==4'd7)? D5_4_in_reg :                                         
 					  (RDC_sel==4'd8)? D6_5_in_reg :                                         
 					  (RDC_sel==4'd9)? D7_6_in_reg :                                         
 					  (RDC_sel==4'd10)? D8_7_in_reg :                                        
 					  (RDC_sel==4'd11)? D9_8_in_reg :                                        
 					  (RDC_sel==4'd12)? D10_9_in_reg :                                       
 					  (RDC_sel==4'd13)? D11_10_in_reg :                                      
 					  (RDC_sel==4'd14)? D12_11_in_reg :                                      
 					                    D13_12_in_reg ; // RDC_sel==4'd15					 
 	                                                                                         
 	//                                                                                       
 	assign D3_wire =  //(DC_mode_sel == 2'd1)? D3_2_in_reg :                                   
 	                  (RDC_sel==4'd0)? D13_12_in_reg :                                       
 					  (RDC_sel==4'd1)? D14_13_in_reg :                                       
 					  (RDC_sel==4'd2)? D15_14_in_reg :                                       
 					  (RDC_sel==4'd3)? RDC_in0 :                                             
 					  (RDC_sel==4'd4)? D1_0_in_reg :                                         
 					  (RDC_sel==4'd5)? D2_1_in_reg :                                         
 					  (RDC_sel==4'd6)? D3_2_in_reg :                                         
 					  (RDC_sel==4'd7)? D4_3_in_reg :                                         
 					  (RDC_sel==4'd8)? D5_4_in_reg :                                         
 					  (RDC_sel==4'd9)? D6_5_in_reg :                                         
 					  (RDC_sel==4'd10)? D7_6_in_reg :                                        
 					  (RDC_sel==4'd11)? D8_7_in_reg :                                        
 					  (RDC_sel==4'd12)? D9_8_in_reg :                                        
 					  (RDC_sel==4'd13)? D10_9_in_reg :                                       
 					  (RDC_sel==4'd14)? D11_10_in_reg :                                      
 					                    D12_11_in_reg ; // RDC_sel==4'd15                    
 	//                                                                                       
 	assign D4_wire =  //(DC_mode_sel == 2'd1)? D4_3_in_reg :                                   
 	                  (RDC_sel==4'd0)? D12_11_in_reg :                                       
 					  (RDC_sel==4'd1)? D13_12_in_reg :                                       
 					  (RDC_sel==4'd2)? D14_13_in_reg :                                       
 					  (RDC_sel==4'd3)? D15_14_in_reg :                                       
 					  (RDC_sel==4'd4)? RDC_in0 :                                             
 					  (RDC_sel==4'd5)? D1_0_in_reg :                                         
 					  (RDC_sel==4'd6)? D2_1_in_reg :                                         
 					  (RDC_sel==4'd7)? D3_2_in_reg :                                         
 					  (RDC_sel==4'd8)? D4_3_in_reg :                                         
 					  (RDC_sel==4'd9)? D5_4_in_reg :                                         
 					  (RDC_sel==4'd10)? D6_5_in_reg :                                        
 					  (RDC_sel==4'd11)? D7_6_in_reg :                                        
 					  (RDC_sel==4'd12)? D8_7_in_reg :                                        
 					  (RDC_sel==4'd13)? D9_8_in_reg :                                        
 					  (RDC_sel==4'd14)? D10_9_in_reg :                                       
 					                    D11_10_in_reg ; // RDC_sel==4'd15                    
 	//                                                                                       
 	assign D5_wire =  //(DC_mode_sel == 2'd1)? D5_4_in_reg :                                   
 	                  (RDC_sel==4'd0)? D11_10_in_reg :                                       
 					  (RDC_sel==4'd1)? D12_11_in_reg :                                       
 					  (RDC_sel==4'd2)? D13_12_in_reg :                                       
 					  (RDC_sel==4'd3)? D14_13_in_reg :                                       
 					  (RDC_sel==4'd4)? D15_14_in_reg :                                       
 					  (RDC_sel==4'd5)? RDC_in0 :                                             
 					  (RDC_sel==4'd6)? D1_0_in_reg :                                         
 					  (RDC_sel==4'd7)? D2_1_in_reg :                                         
 					  (RDC_sel==4'd8)? D3_2_in_reg :                                         
 					  (RDC_sel==4'd9)? D4_3_in_reg :                                         
 					  (RDC_sel==4'd10)? D5_4_in_reg :                                        
 					  (RDC_sel==4'd11)? D6_5_in_reg :                                        
 					  (RDC_sel==4'd12)? D7_6_in_reg :                                        
 					  (RDC_sel==4'd13)? D8_7_in_reg :                                        
 					  (RDC_sel==4'd14)? D9_8_in_reg :                                        
 					                    D10_9_in_reg ; // RDC_sel==4'd15                     
 	//                                                                                       
 	assign D6_wire =  //(DC_mode_sel == 2'd1)? D6_5_in_reg :                                   
 	                  (RDC_sel==4'd0)? D10_9_in_reg :                                        
 					  (RDC_sel==4'd1)? D11_10_in_reg :                                       
 					  (RDC_sel==4'd2)? D12_11_in_reg :                                       
 					  (RDC_sel==4'd3)? D13_12_in_reg :                                       
 					  (RDC_sel==4'd4)? D14_13_in_reg :                                       
 					  (RDC_sel==4'd5)? D15_14_in_reg :                                       
 					  (RDC_sel==4'd6)? RDC_in0 :                                             
 					  (RDC_sel==4'd7)? D1_0_in_reg :                                         
 					  (RDC_sel==4'd8)? D2_1_in_reg :                                         
 					  (RDC_sel==4'd9)? D3_2_in_reg :                                         
 					  (RDC_sel==4'd10)? D4_3_in_reg :                                        
 					  (RDC_sel==4'd11)? D5_4_in_reg :                                        
 					  (RDC_sel==4'd12)? D6_5_in_reg :                                        
 					  (RDC_sel==4'd13)? D7_6_in_reg :                                        
 					  (RDC_sel==4'd14)? D8_7_in_reg :                                        
 					                    D9_8_in_reg ; // RDC_sel==4'd15						 
 	//                                                                                       
 	assign D7_wire =  //(DC_mode_sel == 2'd1)? D7_6_in_reg :                                   
 	                  (RDC_sel==4'd0)? D9_8_in_reg :                                         
 					  (RDC_sel==4'd1)? D10_9_in_reg :                                        
 					  (RDC_sel==4'd2)? D11_10_in_reg :                                       
 					  (RDC_sel==4'd3)? D12_11_in_reg :                                       
 					  (RDC_sel==4'd4)? D13_12_in_reg :                                       
 					  (RDC_sel==4'd5)? D14_13_in_reg :                                       
 					  (RDC_sel==4'd6)? D15_14_in_reg :                                       
 					  (RDC_sel==4'd7)? RDC_in0 :                                             
 					  (RDC_sel==4'd8)? D1_0_in_reg :                                         
 					  (RDC_sel==4'd9)? D2_1_in_reg :                                         
 					  (RDC_sel==4'd10)? D3_2_in_reg :                                        
 					  (RDC_sel==4'd11)? D4_3_in_reg :                                        
 					  (RDC_sel==4'd12)? D5_4_in_reg :                                        
 					  (RDC_sel==4'd13)? D6_5_in_reg :                                        
 					  (RDC_sel==4'd14)? D7_6_in_reg :                                        
 					                    D8_7_in_reg ; // RDC_sel==4'd15                      
 	//                                                                                       
 	assign D8_wire =  //(DC_mode_sel == 2'd1)? D8_7_in_reg :                                   
 	                  (RDC_sel==4'd0)? D8_7_in_reg :                                         
 					  (RDC_sel==4'd1)? D9_8_in_reg :                                         
 					  (RDC_sel==4'd2)? D10_9_in_reg :                                        
 					  (RDC_sel==4'd3)? D11_10_in_reg :                                       
 					  (RDC_sel==4'd4)? D12_11_in_reg :                                       
 					  (RDC_sel==4'd5)? D13_12_in_reg :                                       
 					  (RDC_sel==4'd6)? D14_13_in_reg :                                       
 					  (RDC_sel==4'd7)? D15_14_in_reg :                                       
 					  (RDC_sel==4'd8)? RDC_in0 :                                             
 					  (RDC_sel==4'd9)? D1_0_in_reg :                                         
 					  (RDC_sel==4'd10)? D2_1_in_reg :                                        
 					  (RDC_sel==4'd11)? D3_2_in_reg :                                        
 					  (RDC_sel==4'd12)? D4_3_in_reg :                                        
 					  (RDC_sel==4'd13)? D5_4_in_reg :                                        
 					  (RDC_sel==4'd14)? D6_5_in_reg :                                        
 					                    D7_6_in_reg ; // RDC_sel==4'd15                      
 	//                                                                                       
 	assign D9_wire =  //(DC_mode_sel == 2'd1)? D9_8_in_reg :                                   
 	                  (RDC_sel==4'd0)? D7_6_in_reg :                                         
 					  (RDC_sel==4'd1)? D8_7_in_reg :                                         
 					  (RDC_sel==4'd2)? D9_8_in_reg :                                         
 					  (RDC_sel==4'd3)? D10_9_in_reg :                                        
 					  (RDC_sel==4'd4)? D11_10_in_reg :                                       
 					  (RDC_sel==4'd5)? D12_11_in_reg :                                       
 					  (RDC_sel==4'd6)? D13_12_in_reg :                                       
 					  (RDC_sel==4'd7)? D14_13_in_reg :                                       
 					  (RDC_sel==4'd8)? D15_14_in_reg :                                       
 					  (RDC_sel==4'd9)? RDC_in0 :                                             
 					  (RDC_sel==4'd10)? D1_0_in_reg :                                        
 					  (RDC_sel==4'd11)? D2_1_in_reg :                                        
 					  (RDC_sel==4'd12)? D3_2_in_reg :                                        
 					  (RDC_sel==4'd13)? D4_3_in_reg :                                        
 					  (RDC_sel==4'd14)? D5_4_in_reg :                                        
 					                    D6_5_in_reg ; // RDC_sel==4'd15                      
 	//                                                                                       
 	assign D10_wire =  //(DC_mode_sel == 2'd1)? D10_9_in_reg :                                   
 	                   (RDC_sel==4'd0)? D6_5_in_reg :                                        
 					   (RDC_sel==4'd1)? D7_6_in_reg :                                        
 					   (RDC_sel==4'd2)? D8_7_in_reg :                                        
 					   (RDC_sel==4'd3)? D9_8_in_reg :                                        
 					   (RDC_sel==4'd4)? D10_9_in_reg :                                       
 					   (RDC_sel==4'd5)? D11_10_in_reg :                                      
 					   (RDC_sel==4'd6)? D12_11_in_reg :                                      
 					   (RDC_sel==4'd7)? D13_12_in_reg :                                      
 					   (RDC_sel==4'd8)? D14_13_in_reg :                                      
 					   (RDC_sel==4'd9)? D15_14_in_reg :                                      
 					   (RDC_sel==4'd10)? RDC_in0 :                                           
 					   (RDC_sel==4'd11)? D1_0_in_reg :                                       
 					   (RDC_sel==4'd12)? D2_1_in_reg :                                       
 					   (RDC_sel==4'd13)? D3_2_in_reg :                                       
 					   (RDC_sel==4'd14)? D4_3_in_reg :                                       
 					                     D5_4_in_reg ; // RDC_sel==4'd15                     
 	//                                                                                       
 	assign D11_wire =  //(DC_mode_sel == 2'd1)? D11_10_in_reg :                                   
 	                   (RDC_sel==4'd0)? D5_4_in_reg :                                        
 					   (RDC_sel==4'd1)? D6_5_in_reg :                                        
 					   (RDC_sel==4'd2)? D7_6_in_reg :                                        
 					   (RDC_sel==4'd3)? D8_7_in_reg :                                        
 					   (RDC_sel==4'd4)? D9_8_in_reg :                                        
 					   (RDC_sel==4'd5)? D10_9_in_reg :                                       
 					   (RDC_sel==4'd6)? D11_10_in_reg :                                      
 					   (RDC_sel==4'd7)? D12_11_in_reg :                                      
 					   (RDC_sel==4'd8)? D13_12_in_reg :                                      
 					   (RDC_sel==4'd9)? D14_13_in_reg :                                      
 					   (RDC_sel==4'd10)? D15_14_in_reg :                                     
 					   (RDC_sel==4'd11)? RDC_in0 :                                           
 					   (RDC_sel==4'd12)? D1_0_in_reg :                                       
 					   (RDC_sel==4'd13)? D2_1_in_reg :                                       
 					   (RDC_sel==4'd14)? D3_2_in_reg :                                       
 					                     D4_3_in_reg ; // RDC_sel==4'd15                     
 	//                                                                                       
 	assign D12_wire =  //(DC_mode_sel == 2'd1)? D12_11_in_reg :                                   
 	                   (RDC_sel==4'd0)? D4_3_in_reg :                                        
 					   (RDC_sel==4'd1)? D5_4_in_reg :                                        
 					   (RDC_sel==4'd2)? D6_5_in_reg :                                        
 					   (RDC_sel==4'd3)? D7_6_in_reg :                                        
 					   (RDC_sel==4'd4)? D8_7_in_reg :                                        
 					   (RDC_sel==4'd5)? D9_8_in_reg :                                        
 					   (RDC_sel==4'd6)? D10_9_in_reg :                                       
 					   (RDC_sel==4'd7)? D11_10_in_reg :                                      
 					   (RDC_sel==4'd8)? D12_11_in_reg :                                      
 					   (RDC_sel==4'd9)? D13_12_in_reg :                                      
 					   (RDC_sel==4'd10)? D14_13_in_reg :                                     
 					   (RDC_sel==4'd11)? D15_14_in_reg :                                     
 					   (RDC_sel==4'd12)? RDC_in0 :                                           
 					   (RDC_sel==4'd13)? D1_0_in_reg :                                       
 					   (RDC_sel==4'd14)? D2_1_in_reg :                                       
 					                     D3_2_in_reg ; // RDC_sel==4'd15                     
 	//                                                                                       
 	assign D13_wire =  //(DC_mode_sel == 2'd1)? D13_12_in_reg :                                   
 	                   (RDC_sel==4'd0)? D3_2_in_reg :                                        
 					   (RDC_sel==4'd1)? D4_3_in_reg :                                        
 					   (RDC_sel==4'd2)? D5_4_in_reg :                                        
 					   (RDC_sel==4'd3)? D6_5_in_reg :                                        
 					   (RDC_sel==4'd4)? D7_6_in_reg :                                        
 					   (RDC_sel==4'd5)? D8_7_in_reg :                                        
 					   (RDC_sel==4'd6)? D9_8_in_reg :                                        
 					   (RDC_sel==4'd7)? D10_9_in_reg :                                       
 					   (RDC_sel==4'd8)? D11_10_in_reg :                                      
 					   (RDC_sel==4'd9)? D12_11_in_reg :                                      
 					   (RDC_sel==4'd10)? D13_12_in_reg :                                     
 					   (RDC_sel==4'd11)? D14_13_in_reg :                                     
 					   (RDC_sel==4'd12)? D15_14_in_reg :                                     
 					   (RDC_sel==4'd13)? RDC_in0 :                                           
 					   (RDC_sel==4'd14)? D1_0_in_reg :                                       
 					                     D2_1_in_reg ; // RDC_sel==4'd15                     
 	//                                                                                       
 	assign D14_wire = //(DC_mode_sel == 2'd1)? D14_13_in_reg :                                   
 	                  (RDC_sel==4'd0)? D2_1_in_reg :                                         
 					  (RDC_sel==4'd1)? D3_2_in_reg :                                         
 					  (RDC_sel==4'd2)? D4_3_in_reg :                                         
 					  (RDC_sel==4'd3)? D5_4_in_reg :                                         
 					  (RDC_sel==4'd4)? D6_5_in_reg :                                         
 					  (RDC_sel==4'd5)? D7_6_in_reg :                                         
 					  (RDC_sel==4'd6)? D8_7_in_reg :                                         
 					  (RDC_sel==4'd7)? D9_8_in_reg :                                         
 					  (RDC_sel==4'd8)? D10_9_in_reg :                                        
 					  (RDC_sel==4'd9)? D11_10_in_reg :                                       
 					  (RDC_sel==4'd10)? D12_11_in_reg :                                      
 					  (RDC_sel==4'd11)? D13_12_in_reg :                                      
 					  (RDC_sel==4'd12)? D14_13_in_reg :                                      
 					  (RDC_sel==4'd13)? D15_14_in_reg :                                      
 					  (RDC_sel==4'd14)? RDC_in0 :                                            
 					                    D1_0_in_reg ; // RDC_sel==4'd15                      
 	//                                                                                       
 	assign RDC_out15 = //(DC_mode_sel == 2'd1) ? D15_14_in_reg :                             
 	                   (RDC_sel==4'd0)? D1_0_in_reg :                                        
 					   (RDC_sel==4'd1)? D2_1_in_reg :                                        
 					   (RDC_sel==4'd2)? D3_2_in_reg :                                        
 					   (RDC_sel==4'd3)? D4_3_in_reg :                                        
 					   (RDC_sel==4'd4)? D5_4_in_reg :                                        
 					   (RDC_sel==4'd5)? D6_5_in_reg :                                        
 					   (RDC_sel==4'd6)? D7_6_in_reg :                                        
 					   (RDC_sel==4'd7)? D8_7_in_reg :                                        
 					   (RDC_sel==4'd8)? D9_8_in_reg :                                        
 					   (RDC_sel==4'd9)? D10_9_in_reg :                                       
 					   (RDC_sel==4'd10)? D11_10_in_reg :                                     
 					   (RDC_sel==4'd11)? D12_11_in_reg :                                     
 					   (RDC_sel==4'd12)? D13_12_in_reg :                                     
 					   (RDC_sel==4'd13)? D14_13_in_reg :                                     
 					   (RDC_sel==4'd14)? D15_14_in_reg :                                     
 					                     RDC_in0 ; // RDC_sel==4'd15                         
 	                                                                                         
 	//                                                                                       
 	always @(posedge clk or negedge rst_n) begin                                             
 		if(~rst_n) begin                                                                     
 			D1_0_in_reg <= P_ZERO ;                                                          
 			D2_0_in_reg <= P_ZERO ;                                                          
 			D2_1_in_reg <= P_ZERO ;                                                          
 			D3_0_in_reg <= P_ZERO ;                                                          
 			D3_1_in_reg <= P_ZERO ;                                                          
 			D3_2_in_reg <= P_ZERO ;                                                          
 			D4_0_in_reg <= P_ZERO ;                                                          
 			D4_1_in_reg <= P_ZERO ;                                                          
 			D4_2_in_reg <= P_ZERO ;                                                          
 			D4_3_in_reg <= P_ZERO ;                                                          
 			D5_0_in_reg <= P_ZERO ;                                                          
 			D5_1_in_reg <= P_ZERO ;                                                          
 			D5_2_in_reg <= P_ZERO ;                                                          
 			D5_3_in_reg <= P_ZERO ;                                                          
 			D5_4_in_reg <= P_ZERO ;                                                          
 			D6_0_in_reg <= P_ZERO ;                                                          
 			D6_1_in_reg <= P_ZERO ;                                                          
 			D6_2_in_reg <= P_ZERO ;                                                          
 			D6_3_in_reg <= P_ZERO ;                                                          
 			D6_4_in_reg <= P_ZERO ;                                                          
 			D6_5_in_reg <= P_ZERO ;                                                          
 			D7_0_in_reg <= P_ZERO ;                                                          
 			D7_1_in_reg <= P_ZERO ;                                                          
 			D7_2_in_reg <= P_ZERO ;                                                          
 			D7_3_in_reg <= P_ZERO ;                                                          
 			D7_4_in_reg <= P_ZERO ;                                                          
 			D7_5_in_reg <= P_ZERO ;                                                          
 			D7_6_in_reg <= P_ZERO ;                                                          
 			D8_0_in_reg <= P_ZERO ;                                                          
 			D8_1_in_reg <= P_ZERO ;                                                          
 			D8_2_in_reg <= P_ZERO ;                                                          
 			D8_3_in_reg <= P_ZERO ;                                                          
 			D8_4_in_reg <= P_ZERO ;                                                          
 			D8_5_in_reg <= P_ZERO ;                                                          
 			D8_6_in_reg <= P_ZERO ;                                                          
 			D8_7_in_reg <= P_ZERO ;                                                          
 			D9_0_in_reg <= P_ZERO ;                                                          
 			D9_1_in_reg <= P_ZERO ;                                                          
 			D9_2_in_reg <= P_ZERO ;                                                          
 			D9_3_in_reg <= P_ZERO ;                                                          
 			D9_4_in_reg <= P_ZERO ;                                                          
 			D9_5_in_reg <= P_ZERO ;                                                          
 			D9_6_in_reg <= P_ZERO ;                                                          
 			D9_7_in_reg <= P_ZERO ;                                                          
 			D9_8_in_reg <= P_ZERO ;                                                          
 			D10_0_in_reg <= P_ZERO ;                                                         
 			D10_1_in_reg <= P_ZERO ;                                                         
 			D10_2_in_reg <= P_ZERO ;                                                         
 			D10_3_in_reg <= P_ZERO ;                                                         
 			D10_4_in_reg <= P_ZERO ;                                                         
 			D10_5_in_reg <= P_ZERO ;                                                         
 			D10_6_in_reg <= P_ZERO ;                                                         
 			D10_7_in_reg <= P_ZERO ;                                                         
 			D10_8_in_reg <= P_ZERO ;                                                         
 			D10_9_in_reg <= P_ZERO ;                                                         
 			D11_0_in_reg <= P_ZERO ;                                                         
 			D11_1_in_reg <= P_ZERO ;                                                         
 			D11_2_in_reg <= P_ZERO ;                                                         
 			D11_3_in_reg <= P_ZERO ;                                                         
 			D11_4_in_reg <= P_ZERO ;                                                         
 			D11_5_in_reg <= P_ZERO ;                                                         
 			D11_6_in_reg <= P_ZERO ;                                                         
 			D11_7_in_reg <= P_ZERO ;                                                         
 			D11_8_in_reg <= P_ZERO ;                                                         
 			D11_9_in_reg <= P_ZERO ;                                                         
 			D11_10_in_reg <= P_ZERO ;                                                        
 			D12_0_in_reg <= P_ZERO ;                                                         
 			D12_1_in_reg <= P_ZERO ;                                                         
 			D12_2_in_reg <= P_ZERO ;                                                         
 			D12_3_in_reg <= P_ZERO ;                                                         
 			D12_4_in_reg <= P_ZERO ;                                                         
 			D12_5_in_reg <= P_ZERO ;                                                         
 			D12_6_in_reg <= P_ZERO ;                                                         
 			D12_7_in_reg <= P_ZERO ;                                                         
 			D12_8_in_reg <= P_ZERO ;                                                         
 			D12_9_in_reg <= P_ZERO ;                                                         
 			D12_10_in_reg <= P_ZERO ;                                                        
 			D12_11_in_reg <= P_ZERO ;                                                        
 			D13_0_in_reg <= P_ZERO ;                                                         
 			D13_1_in_reg <= P_ZERO ;                                                         
 			D13_2_in_reg <= P_ZERO ;                                                         
 			D13_3_in_reg <= P_ZERO ;                                                         
 			D13_4_in_reg <= P_ZERO ;                                                         
 			D13_5_in_reg <= P_ZERO ;                                                         
 			D13_6_in_reg <= P_ZERO ;                                                         
 			D13_7_in_reg <= P_ZERO ;                                                         
 			D13_8_in_reg <= P_ZERO ;                                                         
 			D13_9_in_reg <= P_ZERO ;                                                         
 			D13_10_in_reg <= P_ZERO ;                                                        
 			D13_11_in_reg <= P_ZERO ;                                                        
 			D13_12_in_reg <= P_ZERO ;                                                        
 			D14_0_in_reg <= P_ZERO ;                                                         
 			D14_1_in_reg <= P_ZERO ;                                                         
 			D14_2_in_reg <= P_ZERO ;                                                         
 			D14_3_in_reg <= P_ZERO ;                                                         
 			D14_4_in_reg <= P_ZERO ;                                                         
 			D14_5_in_reg <= P_ZERO ;                                                         
 			D14_6_in_reg <= P_ZERO ;                                                         
 			D14_7_in_reg <= P_ZERO ;                                                         
 			D14_8_in_reg <= P_ZERO ;                                                         
 			D14_9_in_reg <= P_ZERO ;                                                         
 			D14_10_in_reg <= P_ZERO ;                                                        
 			D14_11_in_reg <= P_ZERO ;                                                        
 			D14_12_in_reg <= P_ZERO ;                                                        
 			D14_13_in_reg <= P_ZERO ;                                                        
 			D15_0_in_reg <= P_ZERO ;                                                         
 			D15_1_in_reg <= P_ZERO ;                                                         
 			D15_2_in_reg <= P_ZERO ;                                                         
 			D15_3_in_reg <= P_ZERO ;                                                         
 			D15_4_in_reg <= P_ZERO ;                                                         
 			D15_5_in_reg <= P_ZERO ;                                                         
 			D15_6_in_reg <= P_ZERO ;                                                         
 			D15_7_in_reg <= P_ZERO ;                                                         
 			D15_8_in_reg <= P_ZERO ;                                                         
 			D15_9_in_reg <= P_ZERO ;                                                         
 			D15_10_in_reg <= P_ZERO ;                                                        
 			D15_11_in_reg <= P_ZERO ;                                                        
 			D15_12_in_reg <= P_ZERO ;                                                        
 			D15_13_in_reg <= P_ZERO ;                                                        
 			D15_14_in_reg <= P_ZERO ;                                                        
 			//                                                                               
 			D0_0_out_reg <= P_ZERO ;                                                         
 			D0_1_out_reg <= P_ZERO ;	                                                     
 			D0_2_out_reg <= P_ZERO ;	                                                     
 			D0_3_out_reg <= P_ZERO ;	                                                     
 			D0_4_out_reg <= P_ZERO ;	                                                     
 			D0_5_out_reg <= P_ZERO ;	                                                     
 			D0_6_out_reg <= P_ZERO ;	                                                     
 			D0_7_out_reg <= P_ZERO ;	                                                     
 			D0_8_out_reg <= P_ZERO ;                                                         
 			D0_9_out_reg <= P_ZERO ;	                                                     
 			D0_10_out_reg <= P_ZERO ;                                                        
 			D0_11_out_reg <= P_ZERO ;                                                        
 			D0_12_out_reg <= P_ZERO ;                                                        
 			D0_13_out_reg <= P_ZERO ;				                                         
 			RDC_out0 <= P_ZERO ;                                                             
 			D1_0_out_reg <= P_ZERO ;	                                                     
 			D1_1_out_reg <= P_ZERO ;	                                                     
 			D1_2_out_reg <= P_ZERO ;	                                                     
 			D1_3_out_reg <= P_ZERO ;	                                                     
 			D1_4_out_reg <= P_ZERO ;	                                                     
 			D1_5_out_reg <= P_ZERO ;	                                                     
 			D1_6_out_reg <= P_ZERO ;	                                                     
 			D1_7_out_reg <= P_ZERO ;	                                                     
 			D1_8_out_reg <= P_ZERO ;	                                                     
 			D1_9_out_reg <= P_ZERO ;	                                                     
 			D1_10_out_reg <= P_ZERO ;	                                                     
 			D1_11_out_reg <= P_ZERO ;                                                        
 			D1_12_out_reg <= P_ZERO ;	                                                     
 			RDC_out1 <= P_ZERO ;                                                             
 			D2_0_out_reg <= P_ZERO ;	                                                     
 			D2_1_out_reg <= P_ZERO ;	                                                     
 			D2_2_out_reg <= P_ZERO ;	                                                     
 			D2_3_out_reg <= P_ZERO ;	                                                     
 			D2_4_out_reg <= P_ZERO ;	                                                     
 			D2_5_out_reg <= P_ZERO ;                                                         
 			D2_6_out_reg <= P_ZERO ;	                                                     
 			D2_7_out_reg <= P_ZERO ;                                                         
 			D2_8_out_reg <= P_ZERO ;	                                                     
 			D2_9_out_reg <= P_ZERO ;                                                         
 			D2_10_out_reg <= P_ZERO ;                                                        
 			D2_11_out_reg <= P_ZERO ;                                                        
 			RDC_out2 <= P_ZERO ;                                                             
 			                                                                                 
 			D3_0_out_reg <= P_ZERO ;	                                                     
 			D3_1_out_reg <= P_ZERO ;	                                                     
 			D3_2_out_reg <= P_ZERO ;	                                                     
 			D3_3_out_reg <= P_ZERO ;	                                                     
 			D3_4_out_reg <= P_ZERO ;	                                                     
 			D3_5_out_reg <= P_ZERO ;	                                                     
 			D3_6_out_reg <= P_ZERO ;	                                                     
 			D3_7_out_reg <= P_ZERO ;	                                                     
 			D3_8_out_reg <= P_ZERO ;	                                                     
 			D3_9_out_reg <= P_ZERO ;	                                                     
 			D3_10_out_reg <= P_ZERO ;	                                                     
 			RDC_out3 <= P_ZERO ;                                                             
 			                                                                                 
 			D4_0_out_reg <= P_ZERO ;	                                                     
 			D4_1_out_reg <= P_ZERO ;	                                                     
 			D4_2_out_reg <= P_ZERO ;	                                                     
 			D4_3_out_reg <= P_ZERO ;                                                         
 			D4_4_out_reg <= P_ZERO ;	                                                     
 			D4_5_out_reg <= P_ZERO ;	                                                     
 			D4_6_out_reg <= P_ZERO ;	                                                     
 			D4_7_out_reg <= P_ZERO ;	                                                     
 			D4_8_out_reg <= P_ZERO ;	                                                     
 			D4_9_out_reg <= P_ZERO ;                                                         
 			RDC_out4 <= P_ZERO ;                                                             
 			                                                                                 
 			D5_0_out_reg <= P_ZERO ;                                                         
 			D5_1_out_reg <= P_ZERO ;                                                         
 			D5_2_out_reg <= P_ZERO ;                                                         
 			D5_3_out_reg <= P_ZERO ;                                                         
 			D5_4_out_reg <= P_ZERO ;                                                         
 			D5_5_out_reg <= P_ZERO ;                                                         
 			D5_6_out_reg <= P_ZERO ;                                                         
 			D5_7_out_reg <= P_ZERO ;                                                         
 			D5_8_out_reg <= P_ZERO ;                                                         
 			RDC_out5 <= P_ZERO ;                                                             
 			                                                                                 
 			D6_0_out_reg <= P_ZERO ;                                                         
 			D6_1_out_reg <= P_ZERO ;                                                         
 			D6_2_out_reg <= P_ZERO ;                                                         
 			D6_3_out_reg <= P_ZERO ;                                                         
 			D6_4_out_reg <= P_ZERO ;                                                         
 			D6_5_out_reg <= P_ZERO ;                                                         
 			D6_6_out_reg <= P_ZERO ;                                                         
 			D6_7_out_reg <= P_ZERO ;                                                         
 			RDC_out6 <= P_ZERO ;                                                             
 			                                                                                 
 			D7_0_out_reg <= P_ZERO ;                                                         
 			D7_1_out_reg <= P_ZERO ;                                                         
 			D7_2_out_reg <= P_ZERO ;                                                         
 			D7_3_out_reg <= P_ZERO ;                                                         
 			D7_4_out_reg <= P_ZERO ;                                                         
 			D7_5_out_reg <= P_ZERO ;                                                         
 			D7_6_out_reg <= P_ZERO ;                                                         
 			RDC_out7 <= P_ZERO ;                                                             
 			                                                                                 
 			D8_0_out_reg <= P_ZERO ;                                                         
 			D8_1_out_reg <= P_ZERO ;                                                         
 			D8_2_out_reg <= P_ZERO ;                                                         
 			D8_3_out_reg <= P_ZERO ;                                                         
 			D8_4_out_reg <= P_ZERO ;                                                         
 			D8_5_out_reg <= P_ZERO ;                                                         
 			RDC_out8 <= P_ZERO ;                                                             
 			                                                                                 
 			D9_0_out_reg <= P_ZERO ;                                                         
 			D9_1_out_reg <= P_ZERO ;                                                         
 			D9_2_out_reg <= P_ZERO ;                                                         
 			D9_3_out_reg <= P_ZERO ;                                                         
 			D9_4_out_reg <= P_ZERO ;                                                         
 			RDC_out9 <= P_ZERO ;                                                             
 			                                                                                 
 			D10_0_out_reg <= P_ZERO ;                                                        
 			D10_1_out_reg <= P_ZERO ;                                                        
 			D10_2_out_reg <= P_ZERO ;                                                        
 			D10_3_out_reg <= P_ZERO ;                                                        
 			RDC_out10 <= P_ZERO ;                                                            
 			                                                                                 
 			D11_0_out_reg <= P_ZERO ;                                                        
 			D11_1_out_reg <= P_ZERO ;                                                        
 			D11_2_out_reg <= P_ZERO ;                                                        
 			RDC_out11 <= P_ZERO ;                                                            
 			                                                                                 
 			D12_0_out_reg <= P_ZERO ;                                                        
 			D12_1_out_reg <= P_ZERO ;                                                        
 			RDC_out12 <= P_ZERO ;                                                            
 			                                                                                 
 			D13_0_out_reg <= P_ZERO ;                                                        
 			RDC_out13 <= P_ZERO ;                                                            
 			                                                                                 
 			RDC_out14 <= P_ZERO ;                                                            
 			                                                                                 
 		end                                                                                  
 		else begin                                                                           
 			D1_0_in_reg <= RDC_in1 ;                                                         
 			                                                                                 
 			D2_0_in_reg <= RDC_in2 ;                                                         
 			D2_1_in_reg <= D2_0_in_reg ;                                                     
 			                                                                                 
 			D3_0_in_reg <= RDC_in3 ;                                                         
 			D3_1_in_reg <= D3_0_in_reg ;                                                     
 			D3_2_in_reg <= D3_1_in_reg ;                                                     
 			                                                                                 
 			D4_0_in_reg <= RDC_in4 ;                                                         
 			D4_1_in_reg <= D4_0_in_reg ;                                                     
 			D4_2_in_reg <= D4_1_in_reg ;                                                     
 			D4_3_in_reg <= D4_2_in_reg ;                                                     
 			                                                                                 
 			D5_0_in_reg <= RDC_in5 ;                                                         
 			D5_1_in_reg <= D5_0_in_reg ;                                                     
 			D5_2_in_reg <= D5_1_in_reg ;                                                     
 			D5_3_in_reg <= D5_2_in_reg ;                                                     
 			D5_4_in_reg <= D5_3_in_reg ;                                                     
 			                                                                                 
 			D6_0_in_reg <= RDC_in6 ;                                                         
 			D6_1_in_reg <= D6_0_in_reg ;                                                     
 			D6_2_in_reg <= D6_1_in_reg ;                                                     
 			D6_3_in_reg <= D6_2_in_reg ;                                                     
 			D6_4_in_reg <= D6_3_in_reg ;                                                     
 			D6_5_in_reg <= D6_4_in_reg ;                                                     
 			                                                                                 
 			D7_0_in_reg <= RDC_in7 ;                                                         
 			D7_1_in_reg <= D7_0_in_reg ;                                                     
 			D7_2_in_reg <= D7_1_in_reg ;                                                     
 			D7_3_in_reg <= D7_2_in_reg ;                                                     
 			D7_4_in_reg <= D7_3_in_reg ;                                                     
 			D7_5_in_reg <= D7_4_in_reg ;                                                     
 			D7_6_in_reg <= D7_5_in_reg ;                                                     
 			                                                                                 
 			D8_0_in_reg <= RDC_in8 ;                                                         
 			D8_1_in_reg <= D8_0_in_reg ;                                                     
 			D8_2_in_reg <= D8_1_in_reg ;                                                     
 			D8_3_in_reg <= D8_2_in_reg ;                                                     
 			D8_4_in_reg <= D8_3_in_reg ;                                                     
 			D8_5_in_reg <= D8_4_in_reg ;                                                     
 			D8_6_in_reg <= D8_5_in_reg ;                                                     
 			D8_7_in_reg <= D8_6_in_reg ;                                                     
 			                                                                                 
 			D9_0_in_reg <= RDC_in9 ;                                                         
 			D9_1_in_reg <= D9_0_in_reg ;                                                     
 			D9_2_in_reg <= D9_1_in_reg ;                                                     
 			D9_3_in_reg <= D9_2_in_reg ;                                                     
 			D9_4_in_reg <= D9_3_in_reg ;                                                     
 			D9_5_in_reg <= D9_4_in_reg ;                                                     
 			D9_6_in_reg <= D9_5_in_reg ;                                                     
 			D9_7_in_reg <= D9_6_in_reg ;                                                     
 			D9_8_in_reg <= D9_7_in_reg ;                                                     
 			                                                                                 
 			D10_0_in_reg <= RDC_in10 ;                                                       
 			D10_1_in_reg <= D10_0_in_reg ;                                                   
 			D10_2_in_reg <= D10_1_in_reg ;                                                   
 			D10_3_in_reg <= D10_2_in_reg ;                                                   
 			D10_4_in_reg <= D10_3_in_reg ;                                                   
 			D10_5_in_reg <= D10_4_in_reg ;                                                   
 			D10_6_in_reg <= D10_5_in_reg ;                                                   
 			D10_7_in_reg <= D10_6_in_reg ;                                                   
 			D10_8_in_reg <= D10_7_in_reg ;                                                   
 			D10_9_in_reg <= D10_8_in_reg ;                                                   
 			                                                                                 
 			D11_0_in_reg <= RDC_in11 ;                                                       
 			D11_1_in_reg <= D11_0_in_reg ;                                                   
 			D11_2_in_reg <= D11_1_in_reg ;                                                   
 			D11_3_in_reg <= D11_2_in_reg ;                                                   
 			D11_4_in_reg <= D11_3_in_reg ;                                                   
 			D11_5_in_reg <= D11_4_in_reg ;                                                   
 			D11_6_in_reg <= D11_5_in_reg ;                                                   
 			D11_7_in_reg <= D11_6_in_reg ;                                                   
 			D11_8_in_reg <= D11_7_in_reg ;                                                   
 			D11_9_in_reg <= D11_8_in_reg ;                                                   
 			D11_10_in_reg <= D11_9_in_reg ;                                                  
 			                                                                                 
 			D12_0_in_reg <= RDC_in12 ;                                                       
 			D12_1_in_reg <= D12_0_in_reg ;                                                   
 			D12_2_in_reg <= D12_1_in_reg ;                                                   
 			D12_3_in_reg <= D12_2_in_reg ;                                                   
 			D12_4_in_reg <= D12_3_in_reg ;                                                   
 			D12_5_in_reg <= D12_4_in_reg ;                                                   
 			D12_6_in_reg <= D12_5_in_reg ;                                                   
 			D12_7_in_reg <= D12_6_in_reg ;                                                   
 			D12_8_in_reg <= D12_7_in_reg ;                                                   
 			D12_9_in_reg <= D12_8_in_reg ;                                                   
 			D12_10_in_reg <= D12_9_in_reg ;                                                  
 			D12_11_in_reg <= D12_10_in_reg ;                                                 
 			                                                                                 
 			D13_0_in_reg <= RDC_in13 ;                                                       
 			D13_1_in_reg <= D13_0_in_reg ;                                                   
 			D13_2_in_reg <= D13_1_in_reg ;                                                   
 			D13_3_in_reg <= D13_2_in_reg ;                                                   
 			D13_4_in_reg <= D13_3_in_reg ;                                                   
 			D13_5_in_reg <= D13_4_in_reg ;                                                   
 			D13_6_in_reg <= D13_5_in_reg ;                                                   
 			D13_7_in_reg <= D13_6_in_reg ;                                                   
 			D13_8_in_reg <= D13_7_in_reg ;                                                   
 			D13_9_in_reg <= D13_8_in_reg ;                                                   
 			D13_10_in_reg <= D13_9_in_reg ;                                                  
 			D13_11_in_reg <= D13_10_in_reg ;                                                 
 			D13_12_in_reg <= D13_11_in_reg ;                                                 
 			                                                                                 
 			D14_0_in_reg <= RDC_in14 ;                                                       
 			D14_1_in_reg <= D14_0_in_reg ;                                                   
 			D14_2_in_reg <= D14_1_in_reg ;                                                   
 			D14_3_in_reg <= D14_2_in_reg ;                                                   
 			D14_4_in_reg <= D14_3_in_reg ;                                                   
 			D14_5_in_reg <= D14_4_in_reg ;                                                   
 			D14_6_in_reg <= D14_5_in_reg ;                                                   
 			D14_7_in_reg <= D14_6_in_reg ;                                                   
 			D14_8_in_reg <= D14_7_in_reg ;                                                   
 			D14_9_in_reg <= D14_8_in_reg ;                                                   
 			D14_10_in_reg <= D14_9_in_reg ;                                                  
 			D14_11_in_reg <= D14_10_in_reg ;                                                 
 			D14_12_in_reg <= D14_11_in_reg ;                                                 
 			D14_13_in_reg <= D14_12_in_reg ;                                                 
 			                                                                                 
 			D15_0_in_reg <= RDC_in15 ;                                                       
 			D15_1_in_reg <= D15_0_in_reg ;                                                   
 			D15_2_in_reg <= D15_1_in_reg ;                                                   
 			D15_3_in_reg <= D15_2_in_reg ;                                                   
 			D15_4_in_reg <= D15_3_in_reg ;                                                   
 			D15_5_in_reg <= D15_4_in_reg ;                                                   
 			D15_6_in_reg <= D15_5_in_reg ;                                                   
 			D15_7_in_reg <= D15_6_in_reg ;                                                   
 			D15_8_in_reg <= D15_7_in_reg ;                                                   
 			D15_9_in_reg <= D15_8_in_reg ;                                                   
 			D15_10_in_reg <= D15_9_in_reg ;                                                  
 			D15_11_in_reg <= D15_10_in_reg ;                                                 
 			D15_12_in_reg <= D15_11_in_reg ;                                                 
 			D15_13_in_reg <= D15_12_in_reg ;                                                 
 			D15_14_in_reg <= D15_13_in_reg ;                                                 
 			                                                                                 
 			//                                                                               
 			D0_0_out_reg <= D0_wire ;                                                        
 			D0_1_out_reg <= D0_0_out_reg ;                                                   
 			D0_2_out_reg <= D0_1_out_reg ;                                                   
 			D0_3_out_reg <= D0_2_out_reg ;                                                   
 			D0_4_out_reg <= D0_3_out_reg ;                                                   
 			D0_5_out_reg <= D0_4_out_reg ;                                                   
 			D0_6_out_reg <= D0_5_out_reg ;                                                   
 			D0_7_out_reg <= D0_6_out_reg ;                                                   
 			D0_8_out_reg <= D0_7_out_reg ;                                                   
 			D0_9_out_reg <= D0_8_out_reg ;                                                   
 			D0_10_out_reg <= D0_9_out_reg ;                                                  
 			D0_11_out_reg <= D0_10_out_reg ;                                                 
 			D0_12_out_reg <= D0_11_out_reg ;                                                 
 			D0_13_out_reg <= D0_12_out_reg ;                                                 
 			RDC_out0 <= D0_13_out_reg ;                                                      
 			                                                                                 
 			D1_0_out_reg <= D1_wire ;                                                        
 			D1_1_out_reg <= D1_0_out_reg ;                                                   
 			D1_2_out_reg <= D1_1_out_reg ;                                                   
 			D1_3_out_reg <= D1_2_out_reg ;                                                   
 			D1_4_out_reg <= D1_3_out_reg ;                                                   
 			D1_5_out_reg <= D1_4_out_reg ;                                                   
 			D1_6_out_reg <= D1_5_out_reg ;                                                   
 			D1_7_out_reg <= D1_6_out_reg ;                                                   
 			D1_8_out_reg <= D1_7_out_reg ;                                                   
 			D1_9_out_reg <= D1_8_out_reg ;                                                   
 			D1_10_out_reg <= D1_9_out_reg ;                                                  
 			D1_11_out_reg <= D1_10_out_reg ;                                                 
 			D1_12_out_reg <= D1_11_out_reg ;                                                 
 			RDC_out1 <= D1_12_out_reg ;                                                      
 			                                                                                 
 			D2_0_out_reg <= D2_wire ;                                                        
 			D2_1_out_reg <= D2_0_out_reg ;                                                   
 			D2_2_out_reg <= D2_1_out_reg ;                                                   
 			D2_3_out_reg <= D2_2_out_reg ;                                                   
 			D2_4_out_reg <= D2_3_out_reg ;                                                   
 			D2_5_out_reg <= D2_4_out_reg ;                                                   
 			D2_6_out_reg <= D2_5_out_reg ;                                                   
 			D2_7_out_reg <= D2_6_out_reg ;                                                   
 			D2_8_out_reg <= D2_7_out_reg ;                                                   
 			D2_9_out_reg <= D2_8_out_reg ;                                                   
 			D2_10_out_reg <= D2_9_out_reg ;                                                  
 			D2_11_out_reg <= D2_10_out_reg ;                                                 
 			RDC_out2 <= D2_11_out_reg ;                                                      
 			                                                                                 
 			D3_0_out_reg <= D3_wire ;                                                        
 			D3_1_out_reg <= D3_0_out_reg ;                                                   
 			D3_2_out_reg <= D3_1_out_reg ;                                                   
 			D3_3_out_reg <= D3_2_out_reg ;                                                   
 			D3_4_out_reg <= D3_3_out_reg ;                                                   
 			D3_5_out_reg <= D3_4_out_reg ;                                                   
 			D3_6_out_reg <= D3_5_out_reg ;                                                   
 			D3_7_out_reg <= D3_6_out_reg ;                                                   
 			D3_8_out_reg <= D3_7_out_reg ;                                                   
 			D3_9_out_reg <= D3_8_out_reg ;                                                   
 			D3_10_out_reg <= D3_9_out_reg ;                                                  
 			RDC_out3 <= D3_10_out_reg ;                                                      
 			                                                                                 
 			D4_0_out_reg <= D4_wire ;                                                        
 			D4_1_out_reg <= D4_0_out_reg ;                                                   
 			D4_2_out_reg <= D4_1_out_reg ;                                                   
 			D4_3_out_reg <= D4_2_out_reg ;                                                   
 			D4_4_out_reg <= D4_3_out_reg ;                                                   
 			D4_5_out_reg <= D4_4_out_reg ;                                                   
 			D4_6_out_reg <= D4_5_out_reg ;                                                   
 			D4_7_out_reg <= D4_6_out_reg ;                                                   
 			D4_8_out_reg <= D4_7_out_reg ;                                                   
 			D4_9_out_reg <= D4_8_out_reg ;                                                   
 			RDC_out4 <= D4_9_out_reg ;                                                       
 			                                                                                 
 			D5_0_out_reg <= D5_wire ;                                                        
 			D5_1_out_reg <= D5_0_out_reg ;                                                   
 			D5_2_out_reg <= D5_1_out_reg ;                                                   
 			D5_3_out_reg <= D5_2_out_reg ;                                                   
 			D5_4_out_reg <= D5_3_out_reg ;                                                   
 			D5_5_out_reg <= D5_4_out_reg ;                                                   
 			D5_6_out_reg <= D5_5_out_reg ;                                                   
 			D5_7_out_reg <= D5_6_out_reg ;                                                   
 			D5_8_out_reg <= D5_7_out_reg ;                                                   
 			RDC_out5 <= D5_8_out_reg ;                                                       
 			                                                                                 
 			D6_0_out_reg <= D6_wire ;                                                        
 			D6_1_out_reg <= D6_0_out_reg ;                                                   
 			D6_2_out_reg <= D6_1_out_reg ;                                                   
 			D6_3_out_reg <= D6_2_out_reg ;                                                   
 			D6_4_out_reg <= D6_3_out_reg ;                                                   
 			D6_5_out_reg <= D6_4_out_reg ;                                                   
 			D6_6_out_reg <= D6_5_out_reg ;                                                   
 			D6_7_out_reg <= D6_6_out_reg ;                                                   
 			RDC_out6 <= D6_7_out_reg ;                                                       
 			                                                                                 
 			D7_0_out_reg <= D7_wire ;                                                        
 			D7_1_out_reg <= D7_0_out_reg ;                                                   
 			D7_2_out_reg <= D7_1_out_reg ;                                                   
 			D7_3_out_reg <= D7_2_out_reg ;                                                   
 			D7_4_out_reg <= D7_3_out_reg ;                                                   
 			D7_5_out_reg <= D7_4_out_reg ;                                                   
 			D7_6_out_reg <= D7_5_out_reg ;                                                   
 			RDC_out7 <= D7_6_out_reg ;                                                       
 			                                                                                 
 			D8_0_out_reg <= D8_wire ;                                                        
 			D8_1_out_reg <= D8_0_out_reg ;                                                   
 			D8_2_out_reg <= D8_1_out_reg ;                                                   
 			D8_3_out_reg <= D8_2_out_reg ;                                                   
 			D8_4_out_reg <= D8_3_out_reg ;                                                   
 			D8_5_out_reg <= D8_4_out_reg ;                                                   
 			RDC_out8 <= D8_5_out_reg ;                                                       
 			                                                                                 
 			D9_0_out_reg <= D9_wire ;                                                        
 			D9_1_out_reg <= D9_0_out_reg ;                                                   
 			D9_2_out_reg <= D9_1_out_reg ;                                                   
 			D9_3_out_reg <= D9_2_out_reg ;                                                   
 			D9_4_out_reg <= D9_3_out_reg ;                                                   
 			RDC_out9 <= D9_4_out_reg ;                                                       
 			                                                                                 
 			D10_0_out_reg <= D10_wire ;                                                      
 			D10_1_out_reg <= D10_0_out_reg ;                                                 
 			D10_2_out_reg <= D10_1_out_reg ;                                                 
 			D10_3_out_reg <= D10_2_out_reg ;                                                 
 			RDC_out10 <= D10_3_out_reg ;                                                     
 			                                                                                 
 			D11_0_out_reg <= D11_wire ;                                                      
 			D11_1_out_reg <= D11_0_out_reg ;                                                 
 			D11_2_out_reg <= D11_1_out_reg ;                                                 
 			RDC_out11 <= D11_2_out_reg ;                                                     
 			                                                                                 
 			D12_0_out_reg <= D12_wire ;                                                      
 			D12_1_out_reg <= D12_0_out_reg ;                                                 
 			RDC_out12 <= D12_1_out_reg ;                                                     
 			                                                                                 
 			D13_0_out_reg <= D13_wire ;                                                      
 			RDC_out13 <= D13_0_out_reg ;                                                     
 			                                                                                 
 			RDC_out14 <= D14_wire ;                                                          
 			                                                                                 
 		end                                                                                  
 	end                                                                                      
                                                                                              
 endmodule                                                                                    
