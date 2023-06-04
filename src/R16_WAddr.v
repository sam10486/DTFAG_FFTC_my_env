 `timescale 1 ns/1 ps                       
 module R16_WAddr(BND_out,                  
 			     WMA_out,                  
                  BN_in,                    
 		         MA_in,                    
                  rst_n,                    
                  clk                       
                  ) ;                       
 parameter A_WIDTH   = 11;
                                               
 parameter A_ZERO    = 11'h0; 
 parameter BN_ZERO   = 1'h0 ;                  
                                               
                                               
 output              BND_out ;                 
 output[A_WIDTH-1:0] WMA_out ;                 
                                               
 input               BN_in ;                   
 input [A_WIDTH-1:0] MA_in ;                   
 input               rst_n ;                   
 input               clk ;                     
                                               
                                               
 reg                 BN_D0_reg ;               
 reg                 BN_D1_reg ;               
 reg                 BN_D2_reg ;               
 reg                 BN_D3_reg ;               
 reg                 BN_D4_reg ;               
 reg                 BN_D5_reg ;               
 reg                 BN_D6_reg ;               
 reg                 BN_D7_reg ;               
 reg                 BN_D8_reg ;               
 reg                 BN_D9_reg ;               
 reg                 BN_D10_reg ;              
 reg                 BN_D11_reg ;              
 reg                 BN_D12_reg ;              
 reg                 BN_D13_reg ;              
 reg                 BN_D14_reg ;              
 reg                 BN_D15_reg ;              
 reg                 BN_D16_reg ;              
 reg                 BN_D17_reg ;              
 reg                 BN_D18_reg ;              
 reg                 BN_D19_reg ;              
 reg                 BN_D20_reg ;              
 reg                 BN_D21_reg ;              
 reg                 BN_D22_reg ;              
 reg                 BN_D23_reg ;              
 reg                 BN_D24_reg ;              
 reg                 BN_D25_reg ;              
 reg                 BN_D26_reg ;              
 reg                 BN_D27_reg ;              
 reg                 BN_D28_reg ;              
 reg                 BN_D29_reg ;              
 reg                 BN_D30_reg ;              
 reg                 BN_D31_reg ;              
 reg                 BN_D32_reg ;              
 reg                 BN_D33_reg ;              
 reg                 BN_D34_reg ;              
 reg                 BN_D35_reg ;              
 reg                 BN_D36_reg ;              
 reg                 BN_D37_reg ;              
 reg                 BN_D38_reg ;              
 reg                 BN_D39_reg ;              
 reg                 BN_D40_reg ;              
 reg                 BN_D41_reg ;              
 reg                 BN_D42_reg ;              
 reg                 BN_D43_reg ;              
 reg                 BN_D44_reg ;              
 reg                 BN_D45_reg ;              
 reg                 BND_out ;                 
                                               
 reg   [A_WIDTH-1:0] MA_D0_reg ;               
 reg   [A_WIDTH-1:0] MA_D1_reg ;               
 reg   [A_WIDTH-1:0] MA_D2_reg ;               
 reg   [A_WIDTH-1:0] MA_D3_reg ;               
 reg   [A_WIDTH-1:0] MA_D4_reg ;               
 reg   [A_WIDTH-1:0] MA_D5_reg ;               
 reg   [A_WIDTH-1:0] MA_D6_reg ;               
 reg   [A_WIDTH-1:0] MA_D7_reg ;               
 reg   [A_WIDTH-1:0] MA_D8_reg ;               
 reg   [A_WIDTH-1:0] MA_D9_reg ;               
 reg   [A_WIDTH-1:0] MA_D10_reg ;              
 reg   [A_WIDTH-1:0] MA_D11_reg ;              
 reg   [A_WIDTH-1:0] MA_D12_reg ;              
 reg   [A_WIDTH-1:0] MA_D13_reg ;              
 reg   [A_WIDTH-1:0] MA_D14_reg ;              
 reg   [A_WIDTH-1:0] MA_D15_reg ;              
 reg   [A_WIDTH-1:0] MA_D16_reg ;              
 reg   [A_WIDTH-1:0] MA_D17_reg ;              
 reg   [A_WIDTH-1:0] MA_D18_reg ;              
 reg   [A_WIDTH-1:0] MA_D19_reg ;              
 reg   [A_WIDTH-1:0] MA_D20_reg ;              
 reg   [A_WIDTH-1:0] MA_D21_reg ;              
 reg   [A_WIDTH-1:0] MA_D22_reg ;              
 reg   [A_WIDTH-1:0] MA_D23_reg ;              
 reg   [A_WIDTH-1:0] MA_D24_reg ;              
 reg   [A_WIDTH-1:0] MA_D25_reg ;              
 reg   [A_WIDTH-1:0] MA_D26_reg ;              
 reg   [A_WIDTH-1:0] MA_D27_reg ;              
 reg   [A_WIDTH-1:0] MA_D28_reg ;              
 reg   [A_WIDTH-1:0] MA_D29_reg ;              
 reg   [A_WIDTH-1:0] MA_D30_reg ;              
 reg   [A_WIDTH-1:0] MA_D31_reg ;              
 reg   [A_WIDTH-1:0] MA_D32_reg ;              
 reg   [A_WIDTH-1:0] MA_D33_reg ;              
 reg   [A_WIDTH-1:0] MA_D34_reg ;              
 reg   [A_WIDTH-1:0] MA_D35_reg ;              
 reg   [A_WIDTH-1:0] MA_D36_reg ;              
 reg   [A_WIDTH-1:0] MA_D37_reg ;              
 reg   [A_WIDTH-1:0] MA_D38_reg ;              
 reg   [A_WIDTH-1:0] MA_D39_reg ;              
 reg   [A_WIDTH-1:0] MA_D40_reg ;              
 reg   [A_WIDTH-1:0] MA_D41_reg ;              
 reg   [A_WIDTH-1:0] MA_D42_reg ;              
 reg   [A_WIDTH-1:0] MA_D43_reg ;              
 reg   [A_WIDTH-1:0] MA_D44_reg ;              
 reg   [A_WIDTH-1:0] MA_D45_reg ;              
 reg   [A_WIDTH-1:0] MA_D46_reg ;              
 reg   [A_WIDTH-1:0] WMA_out ;                 
                                               
                                               
 	//BN delay 47 cycles and MA delay 48 cycles
 	always @(posedge clk or negedge rst_n) begin
 		if(~rst_n) begin                      
 			BN_D0_reg  <= BN_ZERO ;           
 			BN_D1_reg  <= BN_ZERO ;           
 			BN_D2_reg  <= BN_ZERO ;           
 			BN_D3_reg  <= BN_ZERO ;           
 			BN_D4_reg  <= BN_ZERO ;           
 			BN_D5_reg  <= BN_ZERO ;           
 			BN_D6_reg  <= BN_ZERO ;           
 			BN_D7_reg  <= BN_ZERO ;           
 			BN_D8_reg  <= BN_ZERO ;           
 			BN_D9_reg  <= BN_ZERO ;           
 			BN_D10_reg <= BN_ZERO ;           
 			BN_D11_reg <= BN_ZERO ;           
 			BN_D12_reg <= BN_ZERO ;           
 			BN_D13_reg <= BN_ZERO ;           
 			BN_D14_reg <= BN_ZERO ;           
 			BN_D15_reg <= BN_ZERO ;           
 			BN_D16_reg <= BN_ZERO ;           
 			BN_D17_reg <= BN_ZERO ;           
 			BN_D18_reg <= BN_ZERO ;           
 			BN_D19_reg <= BN_ZERO ;           
 			BN_D20_reg <= BN_ZERO ;           
 			BN_D21_reg <= BN_ZERO ;           
 			BN_D22_reg <= BN_ZERO ;           
 			BN_D23_reg <= BN_ZERO ;           
 			BN_D24_reg <= BN_ZERO ;           
 			BN_D25_reg <= BN_ZERO ;           
 			BN_D26_reg <= BN_ZERO ;           
 			BN_D27_reg <= BN_ZERO ;           
 			BN_D28_reg <= BN_ZERO ;           
 			BN_D29_reg <= BN_ZERO ;           
 			BN_D30_reg <= BN_ZERO ;           
 			BN_D31_reg <= BN_ZERO ;           
 			BN_D32_reg <= BN_ZERO ;           
 			BN_D33_reg <= BN_ZERO ;           
 			BN_D34_reg <= BN_ZERO ;           
 			BN_D35_reg <= BN_ZERO ;           
 			BN_D36_reg <= BN_ZERO ;           
 			BN_D37_reg <= BN_ZERO ;           
 			BN_D38_reg <= BN_ZERO ;           
 			BN_D39_reg <= BN_ZERO ;           
 			BN_D40_reg <= BN_ZERO ;           
 			BN_D41_reg <= BN_ZERO ;           
 			BN_D42_reg <= BN_ZERO ;           
 			BN_D43_reg <= BN_ZERO ;           
 			BN_D44_reg <= BN_ZERO ;           
 			BN_D45_reg <= BN_ZERO ;           
 			BND_out    <= BN_ZERO ;           
 			                                  
 			MA_D0_reg  <= A_ZERO ;            
 			MA_D1_reg  <= A_ZERO ;            
 			MA_D2_reg  <= A_ZERO ;            
 			MA_D3_reg  <= A_ZERO ;            
 			MA_D4_reg  <= A_ZERO ;            
 			MA_D5_reg  <= A_ZERO ;            
 			MA_D6_reg  <= A_ZERO ;            
 			MA_D7_reg  <= A_ZERO ;            
 			MA_D8_reg  <= A_ZERO ;            
 			MA_D9_reg  <= A_ZERO ;            
 			MA_D10_reg <= A_ZERO ;            
 			MA_D11_reg <= A_ZERO ;            
 			MA_D12_reg <= A_ZERO ;            
 			MA_D13_reg <= A_ZERO ;            
 			MA_D14_reg <= A_ZERO ;            
 			MA_D15_reg <= A_ZERO ;            
 			MA_D16_reg <= A_ZERO ;            
 			MA_D17_reg <= A_ZERO ;            
 			MA_D18_reg <= A_ZERO ;            
 			MA_D19_reg <= A_ZERO ;            
 			MA_D20_reg <= A_ZERO ;            
 			MA_D21_reg <= A_ZERO ;            
 			MA_D22_reg <= A_ZERO ;            
 			MA_D23_reg <= A_ZERO ;            
 			MA_D24_reg <= A_ZERO ;            
 			MA_D25_reg <= A_ZERO ;            
 			MA_D26_reg <= A_ZERO ;            
 			MA_D27_reg <= A_ZERO ;            
 			MA_D28_reg <= A_ZERO ;            
 			MA_D29_reg <= A_ZERO ;            
 			MA_D30_reg <= A_ZERO ;            
 			MA_D31_reg <= A_ZERO ;            
 			MA_D32_reg <= A_ZERO ;            
 			MA_D33_reg <= A_ZERO ;            
 			MA_D34_reg <= A_ZERO ;            
 			MA_D35_reg <= A_ZERO ;            
 			MA_D36_reg <= A_ZERO ;            
 			MA_D37_reg <= A_ZERO ;            
 			MA_D38_reg <= A_ZERO ;            
 			MA_D39_reg <= A_ZERO ;            
 			MA_D40_reg <= A_ZERO ;            
 			MA_D41_reg <= A_ZERO ;            
 			MA_D42_reg <= A_ZERO ;            
 			MA_D43_reg <= A_ZERO ;            
 			MA_D44_reg <= A_ZERO ;            
 			MA_D45_reg <= A_ZERO ;            
 			MA_D46_reg <= A_ZERO ;            
 			WMA_out    <= A_ZERO ;            
 		end                                   
 		else begin                            
 			BN_D0_reg  <= BN_in ;             
 			BN_D1_reg  <= BN_D0_reg ;         
 			BN_D2_reg  <= BN_D1_reg ;         
 			BN_D3_reg  <= BN_D2_reg ;         
 			BN_D4_reg  <= BN_D3_reg ;         
 			BN_D5_reg  <= BN_D4_reg ;         
 			BN_D6_reg  <= BN_D5_reg ;         
 			BN_D7_reg  <= BN_D6_reg ;         
 			BN_D8_reg  <= BN_D7_reg ;         
 			BN_D9_reg  <= BN_D8_reg ;         
 			BN_D10_reg <= BN_D9_reg ;         
 			BN_D11_reg <= BN_D10_reg ;        
 			BN_D12_reg <= BN_D11_reg ;        
 			BN_D13_reg <= BN_D12_reg ;        
 			BN_D14_reg <= BN_D13_reg ;        
 			BN_D15_reg <= BN_D14_reg ;        
 			BN_D16_reg <= BN_D15_reg ;        
 			BN_D17_reg <= BN_D16_reg ;        
 			BN_D18_reg <= BN_D17_reg ;        
 			BN_D19_reg <= BN_D18_reg ;        
 			BN_D20_reg <= BN_D19_reg ;        
 			BN_D21_reg <= BN_D20_reg ;        
 			BN_D22_reg <= BN_D21_reg ;        
 			BN_D23_reg <= BN_D22_reg ;        
 			BN_D24_reg <= BN_D23_reg ;        
 			BN_D25_reg <= BN_D24_reg ;        
 			BN_D26_reg <= BN_D25_reg ;        
 			BN_D27_reg <= BN_D26_reg ;        
 			BN_D28_reg <= BN_D27_reg ;        
 			BN_D29_reg <= BN_D28_reg ;        
 			BN_D30_reg <= BN_D29_reg ;        
 			BN_D31_reg <= BN_D30_reg ;        
 			BN_D32_reg <= BN_D31_reg ;        
 			BN_D33_reg <= BN_D32_reg ;        
 			BN_D34_reg <= BN_D33_reg ;        
 			BN_D35_reg <= BN_D34_reg ;        
 			BN_D36_reg <= BN_D35_reg ;        
 			BN_D37_reg <= BN_D36_reg ;        
 			BN_D38_reg <= BN_D37_reg ;        
 			BN_D39_reg <= BN_D38_reg ;        
 			BN_D40_reg <= BN_D39_reg ;        
 			BN_D41_reg <= BN_D40_reg ;        
 			BN_D42_reg <= BN_D41_reg ;        
 			BN_D43_reg <= BN_D42_reg ;        
 			BN_D44_reg <= BN_D43_reg ;        
 			BN_D45_reg <= BN_D44_reg ;        
 			BND_out    <= BN_D45_reg ;        
 			                                  
 			MA_D0_reg  <= MA_in ;             
 			MA_D1_reg  <= MA_D0_reg ;         
 			MA_D2_reg  <= MA_D1_reg ;         
 			MA_D3_reg  <= MA_D2_reg ;         
 			MA_D4_reg  <= MA_D3_reg ;         
 			MA_D5_reg  <= MA_D4_reg ;         
 			MA_D6_reg  <= MA_D5_reg ;         
 			MA_D7_reg  <= MA_D6_reg ;         
 			MA_D8_reg  <= MA_D7_reg ;         
 			MA_D9_reg  <= MA_D8_reg ;         
 			MA_D10_reg <= MA_D9_reg ;         
 			MA_D11_reg <= MA_D10_reg ;        
 			MA_D12_reg <= MA_D11_reg ;        
 			MA_D13_reg <= MA_D12_reg ;        
 			MA_D14_reg <= MA_D13_reg ;        
 			MA_D15_reg <= MA_D14_reg ;        
 			MA_D16_reg <= MA_D15_reg ;        
 			MA_D17_reg <= MA_D16_reg ;        
 			MA_D18_reg <= MA_D17_reg ;        
 			MA_D19_reg <= MA_D18_reg ;        
 			MA_D20_reg <= MA_D19_reg ;        
 			MA_D21_reg <= MA_D20_reg ;        
 			MA_D22_reg <= MA_D21_reg ;        
 			MA_D23_reg <= MA_D22_reg ;        
 			MA_D24_reg <= MA_D23_reg ;        
 			MA_D25_reg <= MA_D24_reg ;        
 			MA_D26_reg <= MA_D25_reg ;        
 			MA_D27_reg <= MA_D26_reg ;        
 			MA_D28_reg <= MA_D27_reg ;        
 			MA_D29_reg <= MA_D28_reg ;        
 			MA_D30_reg <= MA_D29_reg ;        
 			MA_D31_reg <= MA_D30_reg ;        
 			MA_D32_reg <= MA_D31_reg ;        
 			MA_D33_reg <= MA_D32_reg ;        
 			MA_D34_reg <= MA_D33_reg ;        
 			MA_D35_reg <= MA_D34_reg ;        
 			MA_D36_reg <= MA_D35_reg ;        
 			MA_D37_reg <= MA_D36_reg ;        
 			MA_D38_reg <= MA_D37_reg ;        
 			MA_D39_reg <= MA_D38_reg ;        
 			MA_D40_reg <= MA_D39_reg ;        
 			MA_D41_reg <= MA_D40_reg ;        
 			MA_D42_reg <= MA_D41_reg ;        
 			MA_D43_reg <= MA_D42_reg ;        
 			MA_D44_reg <= MA_D43_reg ;        
 			MA_D45_reg <= MA_D44_reg ;        
 			MA_D46_reg <= MA_D45_reg ;        
 			WMA_out    <= MA_D46_reg ;        
 		end                                   
 	end                                       
                                               
 endmodule                                     
