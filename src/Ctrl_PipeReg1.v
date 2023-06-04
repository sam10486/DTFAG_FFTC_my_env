 `timescale 1 ns/1 ps                                                             
 module Ctrl_PipeReg1(                                           
 				        Mul_sel_Dout,                                               
 				        RDC_sel_Dout,                                               
 				        DC_mode_sel_Dout,                                                                                        
 			            Mul_sel_in,                                                 
 			            RDC_sel_in,                                                 
 				        DC_mode_sel_in,                                             
                      rst_n,                                                      
                      clk                                                         
                      ) ;                                                         
                                                                                  
 parameter ROMA_WIDTH  = 12;                                                      
 parameter ROMA_ZERO   = 12'h0 ;                                                  
                                                                                  
                                                                                  
                                       
 output [1:0]            Mul_sel_Dout ;                                           
 output [3:0]            RDC_sel_Dout ;                                           
 output [1:0]            DC_mode_sel_Dout ;                                       
                                                                                                                             
 input  [1:0]            Mul_sel_in ;                                             
 input  [3:0]            RDC_sel_in ;                                             
 input  [1:0]            DC_mode_sel_in ;                                         
 input                   rst_n ;                                                  
 input                   clk ;                                                    
                                                                                  
 reg                  mode_sel_D0reg ;                                            
 reg                  mode_sel_D1reg ;                                            
 reg                  mode_sel_D2reg ;                                            
 reg                  mode_sel_D3reg ;                                            
 reg                  mode_sel_D4reg ;                                            
                                          
 reg [1:0]            Mul_sel_D0reg ;                                             
 reg [1:0]            Mul_sel_D1reg ;                                             
 reg [1:0]            Mul_sel_D2reg ;                                             
 reg [1:0]            Mul_sel_D3reg ;                                             
 reg [1:0]            Mul_sel_D4reg ;                                             
 reg [1:0]            Mul_sel_Dout ;                                              
 reg [3:0]            RDC_sel_D0reg ;                                             
 reg [3:0]            RDC_sel_D1reg ;                                             
 reg [3:0]            RDC_sel_D2reg ;                                             
 reg [3:0]            RDC_sel_D3reg ;                                             
 reg [3:0]            RDC_sel_D4reg ;                                             
 reg [3:0]            RDC_sel_D5reg ;                                             
 reg [3:0]            RDC_sel_D6reg ;                                             
 reg [3:0]            RDC_sel_D7reg ;                                             
 reg [3:0]            RDC_sel_Dout ;                                              
 reg [1:0]            DC_mode_sel_D0reg ;                                         
 reg [1:0]            DC_mode_sel_D1reg ;                                         
 reg [1:0]            DC_mode_sel_D2reg ;                                         
 reg [1:0]            DC_mode_sel_D3reg ;                                         
 reg [1:0]            DC_mode_sel_D4reg ;                                         
 reg [1:0]            DC_mode_sel_D5reg ;                                         
 reg [1:0]            DC_mode_sel_D6reg ;                                         
 reg [1:0]            DC_mode_sel_D7reg ;                                         
 reg [1:0]            DC_mode_sel_D8reg ;                                         
 reg [1:0]            DC_mode_sel_D9reg ;                                         
 reg [1:0]            DC_mode_sel_D10reg ;                                        
 reg [1:0]            DC_mode_sel_D11reg ;                                        
 reg [1:0]            DC_mode_sel_D12reg ;                                        
 reg [1:0]            DC_mode_sel_D13reg ;                                        
 reg [1:0]            DC_mode_sel_D14reg ;                                        
 reg [1:0]            DC_mode_sel_D15reg ;                                        
 reg [1:0]            DC_mode_sel_D16reg ;                                        
 reg [1:0]            DC_mode_sel_D17reg ;                                        
 reg [1:0]            DC_mode_sel_D18reg ;                                        
 reg [1:0]            DC_mode_sel_D19reg ;                                        
 reg [1:0]            DC_mode_sel_D20reg ;                                        
 reg [1:0]            DC_mode_sel_D21reg ;                                        
 reg [1:0]            DC_mode_sel_D22reg ;                                        
 reg [1:0]            DC_mode_sel_D23reg ;                                        
 reg [1:0]            DC_mode_sel_D24reg ;                                        
 reg [1:0]            DC_mode_sel_D25reg ;                                        
 reg [1:0]            DC_mode_sel_D26reg ;                                        
 reg [1:0]            DC_mode_sel_D27reg ;                                        
 reg [1:0]            DC_mode_sel_D28reg ;                                        
 reg [1:0]            DC_mode_sel_D29reg ;                                        
 reg [1:0]            DC_mode_sel_D30reg ;                                        
 reg [1:0]            DC_mode_sel_D31reg ;                                        
 reg [1:0]            DC_mode_sel_D32reg ;                                        
 reg [1:0]            DC_mode_sel_D33reg ;                                        
 reg [1:0]            DC_mode_sel_D34reg ;                                        
 reg [1:0]            DC_mode_sel_D35reg ;                                        
 reg [1:0]            DC_mode_sel_D36reg ;                                        
 reg [1:0]            DC_mode_sel_D37reg ;                                        
 reg [1:0]            DC_mode_sel_D38reg ;                                        
 reg [1:0]            DC_mode_sel_D39reg ;                                        
 reg [1:0]            DC_mode_sel_D40reg ;                                        
 reg [1:0]            DC_mode_sel_D41reg ;                                        
 reg [1:0]            DC_mode_sel_D42reg ;                                        
 reg [1:0]            DC_mode_sel_D43reg ;                                        
 reg [1:0]            DC_mode_sel_D44reg ;                                        
 reg [1:0]            DC_mode_sel_D45reg ;                                        
 reg [1:0]            DC_mode_sel_Dout  ;                                         
                                                                                  
                                                                                  
 //mode_sel, Mul_sel delay 4 cycles and RDC_sel, FFT_FSmode_sel  delay 7 cycles   
 	always @(posedge clk or negedge rst_n) begin                                    
 		if(~rst_n) begin                                                                                                           
 			Mul_sel_D0reg <= 2'd0 ;                                                 
 			Mul_sel_D1reg <= 2'd0 ;                                                 
 			Mul_sel_D2reg <= 2'd0 ;                                                 
 			Mul_sel_D3reg <= 2'd0 ;                                                 
 			Mul_sel_D4reg <= 2'd0 ;                                                 
 			Mul_sel_Dout <= 2'd0 ;                                                  
 			RDC_sel_D0reg <= 4'd0 ;                                                 
 			RDC_sel_D1reg <= 4'd0 ;                                                 
 			RDC_sel_D2reg <= 4'd0 ;                                                 
 			RDC_sel_D3reg <= 4'd0 ;                                                 
 			RDC_sel_D4reg <= 4'd0 ;                                                 
 			RDC_sel_D5reg <= 4'd0 ;                                                 
 			RDC_sel_D6reg <= 4'd0 ;                                                 
 			RDC_sel_D7reg <= 4'd0 ;                                                 
 			RDC_sel_Dout <= 4'd0 ;                                                  
 			DC_mode_sel_D0reg   <= 2'd0;                                            
 			DC_mode_sel_D1reg   <= 2'd0;                                            
 			DC_mode_sel_D2reg   <= 2'd0;                                            
 			DC_mode_sel_D3reg   <= 2'd0;                                            
 			DC_mode_sel_D4reg   <= 2'd0;                                            
 			DC_mode_sel_D5reg   <= 2'd0;                                            
 			DC_mode_sel_D6reg   <= 2'd0;                                            
 			DC_mode_sel_D7reg   <= 2'd0;                                            
 			DC_mode_sel_D8reg   <= 2'd0;                                            
 			DC_mode_sel_D9reg   <= 2'd0;                                            
 			DC_mode_sel_D10reg  <= 2'd0;                                            
 			DC_mode_sel_D11reg  <= 2'd0;                                            
 			DC_mode_sel_D12reg  <= 2'd0;                                            
 			DC_mode_sel_D13reg  <= 2'd0;                                            
 			DC_mode_sel_D14reg  <= 2'd0;                                            
 			DC_mode_sel_D15reg  <= 2'd0;                                            
 			DC_mode_sel_D16reg  <= 2'd0;                                            
 			DC_mode_sel_D17reg  <= 2'd0;                                            
 			DC_mode_sel_D18reg  <= 2'd0;                                            
 			DC_mode_sel_D19reg  <= 2'd0;                                            
 			DC_mode_sel_D20reg  <= 2'd0;                                            
 			DC_mode_sel_D21reg  <= 2'd0;                                            
 			DC_mode_sel_D22reg  <= 2'd0;                                            
 			DC_mode_sel_D23reg  <= 2'd0;                                            
 			DC_mode_sel_D24reg  <= 2'd0;                                            
 			DC_mode_sel_D25reg  <= 2'd0;                                            
 			DC_mode_sel_D26reg  <= 2'd0;                                            
 			DC_mode_sel_D27reg  <= 2'd0;                                            
 			DC_mode_sel_D28reg  <= 2'd0;                                            
 			DC_mode_sel_D29reg  <= 2'd0;                                            
 			DC_mode_sel_D30reg  <= 2'd0;                                            
 			DC_mode_sel_D31reg  <= 2'd0;                                            
 			DC_mode_sel_D32reg  <= 2'd0;                                            
 			DC_mode_sel_D33reg  <= 2'd0;                                            
 			DC_mode_sel_D34reg  <= 2'd0;                                            
 			DC_mode_sel_D35reg  <= 2'd0;                                            
 			DC_mode_sel_D36reg  <= 2'd0;                                            
 			DC_mode_sel_D37reg  <= 2'd0;                                            
 			DC_mode_sel_D38reg  <= 2'd0;                                            
 			DC_mode_sel_D39reg  <= 2'd0;                                            
 			DC_mode_sel_D40reg  <= 2'd0;                                            
 			DC_mode_sel_D41reg  <= 2'd0;                                            
 			DC_mode_sel_D42reg  <= 2'd0;                                            
 			DC_mode_sel_D43reg  <= 2'd0;                                            
 			DC_mode_sel_D44reg  <= 2'd0;                                            
 			DC_mode_sel_D45reg  <= 2'd0;                                            
 			DC_mode_sel_Dout    <= 2'd0;                                            
 		end                                                                         
 		else begin                                                                                                      
 			//                                                                      
 			Mul_sel_D0reg <= Mul_sel_in ;                                           
 			Mul_sel_D1reg <= Mul_sel_D0reg ;                                        
 			Mul_sel_D2reg <= Mul_sel_D1reg ;                                        
 			Mul_sel_D3reg <= Mul_sel_D2reg ;                                        
 			Mul_sel_D4reg <= Mul_sel_D3reg ;                                        
 			Mul_sel_Dout <= Mul_sel_D4reg ;                                         
 			//                                                                      
 			RDC_sel_D0reg <= RDC_sel_in ;                                           
 			RDC_sel_D1reg <= RDC_sel_D0reg ;                                        
 			RDC_sel_D2reg <= RDC_sel_D1reg ;                                        
 			RDC_sel_D3reg <= RDC_sel_D2reg ;                                        
 			RDC_sel_D4reg <= RDC_sel_D3reg ;                                        
 			RDC_sel_D5reg <= RDC_sel_D4reg ;                                        
 			RDC_sel_D6reg <= RDC_sel_D5reg ;                                        
 			RDC_sel_D7reg <= RDC_sel_D6reg ;                                        
 			RDC_sel_Dout <= RDC_sel_D7reg ;                                         
 			//                                                                      
 			DC_mode_sel_D0reg   <= DC_mode_sel_in;                                  
 			DC_mode_sel_D1reg   <= DC_mode_sel_D0reg;                               
 			DC_mode_sel_D2reg   <= DC_mode_sel_D1reg;                               
 			DC_mode_sel_D3reg   <= DC_mode_sel_D2reg;                               
 			DC_mode_sel_D4reg   <= DC_mode_sel_D3reg;                               
 			DC_mode_sel_D5reg   <= DC_mode_sel_D4reg;                               
 			DC_mode_sel_D6reg   <= DC_mode_sel_D5reg;                               
 			DC_mode_sel_D7reg   <= DC_mode_sel_D6reg;                               
 			DC_mode_sel_D8reg   <= DC_mode_sel_D7reg;                               
 			DC_mode_sel_D9reg   <= DC_mode_sel_D8reg;                               
 			DC_mode_sel_D10reg  <= DC_mode_sel_D9reg;                               
 			DC_mode_sel_D11reg  <= DC_mode_sel_D10reg;                              
 			DC_mode_sel_D12reg  <= DC_mode_sel_D11reg;                              
 			DC_mode_sel_D13reg  <= DC_mode_sel_D12reg;                              
 			DC_mode_sel_D14reg  <= DC_mode_sel_D13reg;                              
 			DC_mode_sel_D15reg  <= DC_mode_sel_D14reg;                              
 			DC_mode_sel_D16reg  <= DC_mode_sel_D15reg;                              
 			DC_mode_sel_D17reg  <= DC_mode_sel_D16reg;                              
 			DC_mode_sel_D18reg  <= DC_mode_sel_D17reg;                              
 			DC_mode_sel_D19reg  <= DC_mode_sel_D18reg;                              
 			DC_mode_sel_D20reg  <= DC_mode_sel_D19reg;                              
 			DC_mode_sel_D21reg  <= DC_mode_sel_D20reg;                              
 			DC_mode_sel_D22reg  <= DC_mode_sel_D21reg;                              
 			DC_mode_sel_D23reg  <= DC_mode_sel_D22reg;                              
 			DC_mode_sel_D24reg  <= DC_mode_sel_D23reg;                              
 			DC_mode_sel_D25reg  <= DC_mode_sel_D24reg;                              
 			DC_mode_sel_D26reg  <= DC_mode_sel_D25reg;                              
 			DC_mode_sel_D27reg  <= DC_mode_sel_D26reg;                              
 			DC_mode_sel_D28reg  <= DC_mode_sel_D27reg;                              
 			DC_mode_sel_D29reg  <= DC_mode_sel_D28reg;                              
 			DC_mode_sel_D30reg  <= DC_mode_sel_D29reg;                              
 			DC_mode_sel_D31reg  <= DC_mode_sel_D30reg;                              
 			DC_mode_sel_D32reg  <= DC_mode_sel_D31reg;                              
 			DC_mode_sel_D33reg  <= DC_mode_sel_D32reg;                              
 			DC_mode_sel_D34reg  <= DC_mode_sel_D33reg;                              
 			DC_mode_sel_D35reg  <= DC_mode_sel_D34reg;                              
 			DC_mode_sel_D36reg  <= DC_mode_sel_D35reg;                              
 			DC_mode_sel_D37reg  <= DC_mode_sel_D36reg;                              
 			DC_mode_sel_D38reg  <= DC_mode_sel_D37reg;                              
 			DC_mode_sel_D39reg  <= DC_mode_sel_D38reg;                              
 			DC_mode_sel_D40reg  <= DC_mode_sel_D39reg;                              
 			DC_mode_sel_D41reg  <= DC_mode_sel_D40reg;                              
 			DC_mode_sel_D42reg  <= DC_mode_sel_D41reg;                              
 			DC_mode_sel_D43reg  <= DC_mode_sel_D42reg;                              
 			DC_mode_sel_D44reg  <= DC_mode_sel_D43reg;                              
 			DC_mode_sel_D45reg  <= DC_mode_sel_D44reg;                              
 			DC_mode_sel_Dout    <= DC_mode_sel_D45reg;                              
 		end                                                                         
 	end                                                                             
 endmodule                                                                        
