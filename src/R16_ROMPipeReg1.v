 `timescale 1 ns/1 ps                                            
 module R16_ROMPipeReg1(ROMD0_Dout,                              
 				         ROMD1_Dout,                             
 				         ROMD2_Dout,                             
 				         ROMD3_Dout,                             
 					     ROMD4_Dout,                             
 					     ROMD5_Dout,                             
 					     ROMD6_Dout,                             
 					     ROMD7_Dout,                             
                       
 			             ROMD0_in,                               
 					     ROMD1_in,                               
 					     ROMD2_in,                               
 					     ROMD3_in,                               
 					     ROMD4_in,                               
 					     ROMD5_in,                               
 					     ROMD6_in,                               
 					     ROMD7_in,                               
                        
                        rst_n,                                   
                        clk                                      
                        ) ;                                      
                                                                 
 parameter P_WIDTH   = 64 ;					                     
 parameter SD_WIDTH  = 128 ;                                     
 parameter P_ZERO    = 64'h0 ;                                   
 parameter SD_ZERO   = 128'h0 ;                                  
                                                                 
                                                                 
 output [P_WIDTH-1:0]    ROMD0_Dout ;                            
 output [SD_WIDTH-1:0]   ROMD1_Dout ;                            
 output [SD_WIDTH-1:0]   ROMD2_Dout ;                            
 output [SD_WIDTH-1:0]   ROMD3_Dout ;                            
 output [SD_WIDTH-1:0]   ROMD4_Dout ;                            
 output [SD_WIDTH-1:0]   ROMD5_Dout ;                            
 output [SD_WIDTH-1:0]   ROMD6_Dout ;                            
 output [SD_WIDTH-1:0]   ROMD7_Dout ;                            
                      
                                                                 
 input  [P_WIDTH-1:0]    ROMD0_in ;                              
 input  [SD_WIDTH-1:0]   ROMD1_in ;                              
 input  [SD_WIDTH-1:0]   ROMD2_in ;                              
 input  [SD_WIDTH-1:0]   ROMD3_in ;                              
 input  [SD_WIDTH-1:0]   ROMD4_in ;                              
 input  [SD_WIDTH-1:0]   ROMD5_in ;                              
 input  [SD_WIDTH-1:0]   ROMD6_in ;                              
 input  [SD_WIDTH-1:0]   ROMD7_in ;                              
                        
 input                   rst_n ;                                 
 input                   clk ;                                   
                                                                 
 reg [P_WIDTH-1:0]    ROMD0_Dout ;                               
 reg [SD_WIDTH-1:0]   ROMD1_Dout ;                               
 reg [SD_WIDTH-1:0]   ROMD2_Dout ;                               
 reg [SD_WIDTH-1:0]   ROMD3_Dout ;                               
 reg [SD_WIDTH-1:0]   ROMD4_Dout ;                               
 reg [SD_WIDTH-1:0]   ROMD5_Dout ;                               
 reg [SD_WIDTH-1:0]   ROMD6_Dout ;                               
 reg [SD_WIDTH-1:0]   ROMD7_Dout ;                               
                        
                                                                 
 reg [P_WIDTH-1:0]    ROMD0_D0reg ;                              
 reg [P_WIDTH-1:0]    ROMD0_D1reg ;                              
 reg [P_WIDTH-1:0]    ROMD0_D2reg ;                              
 reg [P_WIDTH-1:0]    ROMD0_D3reg ;                              
 reg [P_WIDTH-1:0]    ROMD0_D4reg ;                              
 reg [SD_WIDTH-1:0]   ROMD1_D0reg ;                              
 reg [SD_WIDTH-1:0]   ROMD1_D1reg ;                              
 reg [SD_WIDTH-1:0]   ROMD1_D2reg ;                              
 reg [SD_WIDTH-1:0]   ROMD1_D3reg ;                              
 reg [SD_WIDTH-1:0]   ROMD1_D4reg ;                              
 reg [SD_WIDTH-1:0]   ROMD2_D0reg ;                              
 reg [SD_WIDTH-1:0]   ROMD2_D1reg ;                              
 reg [SD_WIDTH-1:0]   ROMD2_D2reg ;                              
 reg [SD_WIDTH-1:0]   ROMD2_D3reg ;                              
 reg [SD_WIDTH-1:0]   ROMD2_D4reg ;                              
 reg [SD_WIDTH-1:0]   ROMD3_D0reg ;                              
 reg [SD_WIDTH-1:0]   ROMD3_D1reg ;                              
 reg [SD_WIDTH-1:0]   ROMD3_D2reg ;                              
 reg [SD_WIDTH-1:0]   ROMD3_D3reg ;                              
 reg [SD_WIDTH-1:0]   ROMD3_D4reg ;                              
 reg [SD_WIDTH-1:0]   ROMD4_D0reg ;                              
 reg [SD_WIDTH-1:0]   ROMD4_D1reg ;                              
 reg [SD_WIDTH-1:0]   ROMD4_D2reg ;                              
 reg [SD_WIDTH-1:0]   ROMD4_D3reg ;                              
 reg [SD_WIDTH-1:0]   ROMD4_D4reg ;                              
 reg [SD_WIDTH-1:0]   ROMD5_D0reg ;                              
 reg [SD_WIDTH-1:0]   ROMD5_D1reg ;                              
 reg [SD_WIDTH-1:0]   ROMD5_D2reg ;                              
 reg [SD_WIDTH-1:0]   ROMD5_D3reg ;                              
 reg [SD_WIDTH-1:0]   ROMD5_D4reg ;                              
 reg [SD_WIDTH-1:0]   ROMD6_D0reg ;                              
 reg [SD_WIDTH-1:0]   ROMD6_D1reg ;                              
 reg [SD_WIDTH-1:0]   ROMD6_D2reg ;                              
 reg [SD_WIDTH-1:0]   ROMD6_D3reg ;                              
 reg [SD_WIDTH-1:0]   ROMD6_D4reg ;                              
 reg [SD_WIDTH-1:0]   ROMD7_D0reg ;                              
 reg [SD_WIDTH-1:0]   ROMD7_D1reg ;                              
 reg [SD_WIDTH-1:0]   ROMD7_D2reg ;                              
 reg [SD_WIDTH-1:0]   ROMD7_D3reg ;                              
 reg [SD_WIDTH-1:0]   ROMD7_D4reg ;                              
                                                                 
                         
                                                                 
                                                                 
 	//delay 6 cycles                                             
 	always @(posedge clk or negedge rst_n) begin                 
 		if(~rst_n) begin                                         
 			ROMD0_D0reg <= P_ZERO ;                              
 			ROMD0_D1reg <= P_ZERO ;                              
 			ROMD0_D2reg <= P_ZERO ;                              
 			ROMD0_D3reg <= P_ZERO ;                              
 			ROMD0_D4reg <= P_ZERO ;                              
 			ROMD0_Dout  <= P_ZERO ;                              
 			//                                                   
 			ROMD1_D0reg <= SD_ZERO ;                             
 			ROMD1_D1reg <= SD_ZERO ;                             
 			ROMD1_D2reg <= SD_ZERO ;                             
 			ROMD1_D3reg <= SD_ZERO ;                             
 			ROMD1_D4reg <= SD_ZERO ;                             
 			ROMD1_Dout  <= SD_ZERO ;                             
 			//                                                   
 			ROMD2_D0reg <= SD_ZERO ;                             
 			ROMD2_D1reg <= SD_ZERO ;                             
 			ROMD2_D2reg <= SD_ZERO ;                             
 			ROMD2_D3reg <= SD_ZERO ;                             
 			ROMD2_D4reg <= SD_ZERO ;                             
 			ROMD2_Dout  <= SD_ZERO ;                             
 			//                                                   
 			ROMD3_D0reg <= SD_ZERO ;                             
 			ROMD3_D1reg <= SD_ZERO ;                             
 			ROMD3_D2reg <= SD_ZERO ;                             
 			ROMD3_D3reg <= SD_ZERO ;                             
 			ROMD3_D4reg <= SD_ZERO ;                             
 			ROMD3_Dout  <= SD_ZERO ;                             
 			//                                                   
 			ROMD4_D0reg <= SD_ZERO ;                             
 			ROMD4_D1reg <= SD_ZERO ;                             
 			ROMD4_D2reg <= SD_ZERO ;                             
 			ROMD4_D3reg <= SD_ZERO ;                             
 			ROMD4_D4reg <= SD_ZERO ;                             
 			ROMD4_Dout  <= SD_ZERO ;                             
 			//                                                   
 			ROMD5_D0reg <= SD_ZERO ;                             
 			ROMD5_D1reg <= SD_ZERO ;                             
 			ROMD5_D2reg <= SD_ZERO ;                             
 			ROMD5_D3reg <= SD_ZERO ;                             
 			ROMD5_D4reg <= SD_ZERO ;                             
 			ROMD5_Dout  <= SD_ZERO ;                             
 			//                                                   
 			ROMD6_D0reg <= SD_ZERO ;                             
 			ROMD6_D1reg <= SD_ZERO ;                             
 			ROMD6_D2reg <= SD_ZERO ;                             
 			ROMD6_D3reg <= SD_ZERO ;                             
 			ROMD6_D4reg <= SD_ZERO ;                             
 			ROMD6_Dout  <= SD_ZERO ;                             
 			//                                                   
 			ROMD7_D0reg <= SD_ZERO ;                             
 			ROMD7_D1reg <= SD_ZERO ;                             
 			ROMD7_D2reg <= SD_ZERO ;                             
 			ROMD7_D3reg <= SD_ZERO ;                             
 			ROMD7_D4reg <= SD_ZERO ;                             
 			ROMD7_Dout  <= SD_ZERO ;                             
 			                      
 		end                                                      
 		else begin                                               
 			ROMD0_D0reg <= ROMD0_in ;                            
 			ROMD0_D1reg <= ROMD0_D0reg ;                         
 			ROMD0_D2reg <= ROMD0_D1reg ;                         
 			ROMD0_D3reg <= ROMD0_D2reg ;                         
 			ROMD0_D4reg <= ROMD0_D3reg ;                         
 			ROMD0_Dout  <= ROMD0_D4reg ;                         
 			//                                                   
 			ROMD1_D0reg <= ROMD1_in ;                            
 			ROMD1_D1reg <= ROMD1_D0reg ;                         
 			ROMD1_D2reg <= ROMD1_D1reg ;                         
 			ROMD1_D3reg <= ROMD1_D2reg ;                         
 			ROMD1_D4reg <= ROMD1_D3reg ;                         
 			ROMD1_Dout  <= ROMD1_D4reg ;                         
 			//                                                   
 			ROMD2_D0reg <= ROMD2_in ;                            
 			ROMD2_D1reg <= ROMD2_D0reg ;                         
 			ROMD2_D2reg <= ROMD2_D1reg ;                         
 			ROMD2_D3reg <= ROMD2_D2reg ;                         
 			ROMD2_D4reg <= ROMD2_D3reg ;                         
 			ROMD2_Dout  <= ROMD2_D4reg ;                         
 			//                                                   
 			ROMD3_D0reg <= ROMD3_in ;                            
 			ROMD3_D1reg <= ROMD3_D0reg ;                         
 			ROMD3_D2reg <= ROMD3_D1reg ;                         
 			ROMD3_D3reg <= ROMD3_D2reg ;                         
 			ROMD3_D4reg <= ROMD3_D3reg ;                         
 			ROMD3_Dout  <= ROMD3_D4reg ;                         
 			//                                                   
 			ROMD4_D0reg <= ROMD4_in ;                            
 			ROMD4_D1reg <= ROMD4_D0reg ;                         
 			ROMD4_D2reg <= ROMD4_D1reg ;                         
 			ROMD4_D3reg <= ROMD4_D2reg ;                         
 			ROMD4_D4reg <= ROMD4_D3reg ;                         
 			ROMD4_Dout  <= ROMD4_D4reg ;                         
 			//                                                   
 			ROMD5_D0reg <= ROMD5_in ;                            
 			ROMD5_D1reg <= ROMD5_D0reg ;                         
 			ROMD5_D2reg <= ROMD5_D1reg ;                         
 			ROMD5_D3reg <= ROMD5_D2reg ;                         
 			ROMD5_D4reg <= ROMD5_D3reg ;                         
 			ROMD5_Dout  <= ROMD5_D4reg ;                         
 			//                                                   
 			ROMD6_D0reg <= ROMD6_in ;                            
 			ROMD6_D1reg <= ROMD6_D0reg ;                         
 			ROMD6_D2reg <= ROMD6_D1reg ;                         
 			ROMD6_D3reg <= ROMD6_D2reg ;                         
 			ROMD6_D4reg <= ROMD6_D3reg ;                         
 			ROMD6_Dout  <= ROMD6_D4reg ;                         
 			//                                                   
 			ROMD7_D0reg <= ROMD7_in ;                            
 			ROMD7_D1reg <= ROMD7_D0reg ;                         
 			ROMD7_D2reg <= ROMD7_D1reg ;                         
 			ROMD7_D3reg <= ROMD7_D2reg ;                         
 			ROMD7_D4reg <= ROMD7_D3reg ;                         
 			ROMD7_Dout  <= ROMD7_D4reg ;                         
 			               
 		end                                                      
 	end                                                          
                                                                 
 endmodule                                                       
