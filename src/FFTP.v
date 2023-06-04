  
`include "CenCtrl.v"    
`include "Mux1.v"    
`include "Mux2.v"     
`include "R16_AGU.v"    
`include "BU.v"    
`include "BU_S0.v"    
`include "Pipe.v"    
`include "Radix16_Pipe.v"    
`include "Ctrl_PipeReg1.v"    
`include "R16_PipeReg2.v"    
`include "R16_PipeReg4.v"    
`include "R16_PipeReg4_2.v"    
`include "R16_NPipeReg2.v"    
`include "R16_NPipeReg3.v"    
`include "Mod192.v"    
`include "Mod192PD.v"    
`include "MulMod128.v"    
`include "MulMod128PD.v"    
`include "Mul64.v"    
`include "ModMux.v"    
`include "R16_DC.v"    
`include "R16_WAddr.v"    
`include "CLA4.v"  
`include "CLA16.v"  
`include "CLA16clg.v"  
`include "CLA32.v"  
`include "CLA32clg.v"  
`include "CLA64_co.v"  
`include "CLA64clg_co.v"  
`include "CLA65.v"  
`include "CLA65clg.v"  
`include "Mux4.v"          

`include "DTFAG_top.v"
`include "DTFAG_AGU.v"
`include "Memory_wrapper.v"
`include "DTFAG_Mul_process.v"
`include "R16_input_delay.v"
`include "R16_TF_mul.v"
`include "R16_WD_delay.v"
`include "DTFAG_Mux3.v"
`include "Register_file.v"

 module FFTP(MulValid_out,                                                  
             MulD0_out,                                                     
 		       MulD1_out,                                                     
 			   MulD2_out,                                                     
 			   MulD3_out,                                                     
 			   MulD4_out,                                                     
 			   MulD5_out,                                                     
 			   MulD6_out,                                                     
 			   MulD7_out,                                                     
 			   MulD8_out,                                                     
 			   MulD9_out,                                                     
 			   MulD10_out,                                                    
 			   MulD11_out,                                                    
 			   MulD12_out,                                                    
 			   MulD13_out,                                                    
 			   MulD14_out,                                                    
 			   MulD15_out,                                                    
 			   ExtB0_D0_in,                                                   
 			   ExtB0_D1_in,                                                   
 			   ExtB0_D2_in,                                                   
 			   ExtB0_D3_in,                                                   
 			   ExtB0_D4_in,                                                   
 			   ExtB0_D5_in,                                                   
 			   ExtB0_D6_in,                                                   
 			   ExtB0_D7_in,  
               ExtB0_D8_in,                                                   
 			   ExtB0_D9_in,                                                   
 			   ExtB0_D10_in,                                                   
 			   ExtB0_D11_in,                                                   
 			   ExtB0_D12_in,                                                   
 			   ExtB0_D13_in,                                                   
 			   ExtB0_D14_in,                                                   
 			   ExtB0_D15_in,	

 			   ExtB1_D0_in,                                                   
 			   ExtB1_D1_in,                                                   
 			   ExtB1_D2_in,                                                   
 			   ExtB1_D3_in,                                                   
 			   ExtB1_D4_in,                                                   
 			   ExtB1_D5_in,                                                   
 			   ExtB1_D6_in,                                                   
 			   ExtB1_D7_in,        
               ExtB1_D8_in,                                                   
 			   ExtB1_D9_in,                                                   
 			   ExtB1_D10_in,                                                   
 			   ExtB1_D11_in,                                                   
 			   ExtB1_D12_in,                                                   
 			   ExtB1_D13_in,                                                   
 			   ExtB1_D14_in,                                                   
 			   ExtB1_D15_in,		                                           
 			   N_in,                                                          
 			   ExtValid_in,                                                   
               rst_n,                                                         
               clk                                                            
             ) ;                                                            
 			                                                                  
 			                                  
 parameter P_WIDTH     = 64 ; 			                                  
 parameter A_WIDTH     = 11;
 parameter SD_WIDTH    = 128 ;                                              
 parameter ROMA_WIDTH  = 12;
 parameter DC_WIDTH    = 15;
                                                                            
                                                                            
 output                MulValid_out ;                                       
                                                                            
 output[P_WIDTH-1:0]   MulD0_out ;                                          
 output[P_WIDTH-1:0]   MulD1_out ;                                          
 output[P_WIDTH-1:0]   MulD2_out ;                                          
 output[P_WIDTH-1:0]   MulD3_out ;                                          
 output[P_WIDTH-1:0]   MulD4_out ;                                          
 output[P_WIDTH-1:0]   MulD5_out ;                                          
 output[P_WIDTH-1:0]   MulD6_out ;                                          
 output[P_WIDTH-1:0]   MulD7_out ;                                          
 output[P_WIDTH-1:0]   MulD8_out ;                                          
 output[P_WIDTH-1:0]   MulD9_out ;                                          
 output[P_WIDTH-1:0]   MulD10_out ;                                         
 output[P_WIDTH-1:0]   MulD11_out ;                                         
 output[P_WIDTH-1:0]   MulD12_out ;                                         
 output[P_WIDTH-1:0]   MulD13_out ;                                         
 output[P_WIDTH-1:0]   MulD14_out ;                                         
 output[P_WIDTH-1:0]   MulD15_out ;                                         
                                                                            
                                                                            
 input  [P_WIDTH-1:0] ExtB0_D0_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D1_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D2_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D3_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D4_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D5_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D6_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D7_in ;  
 input  [P_WIDTH-1:0] ExtB0_D8_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D9_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D10_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D11_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D12_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D13_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D14_in ;                                         
 input  [P_WIDTH-1:0] ExtB0_D15_in ; 

 input  [P_WIDTH-1:0] ExtB1_D0_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D1_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D2_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D3_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D4_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D5_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D6_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D7_in ;    
 input  [P_WIDTH-1:0] ExtB1_D8_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D9_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D10_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D11_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D12_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D13_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D14_in ;                                         
 input  [P_WIDTH-1:0] ExtB1_D15_in ;                                      
 input  [P_WIDTH-1:0] N_in ;                                                
 input                ExtValid_in ;                                         
 input                rst_n ;                                               
 input                clk ;                                                 
 //============================================= 
                                    
 wire [SD_WIDTH-1:0]  Data_out0 ;                                           
 wire [SD_WIDTH-1:0]  Data_out1 ;                                           
 wire [SD_WIDTH-1:0]  Data_out2 ;                                           
 wire [SD_WIDTH-1:0]  Data_out3 ;                                           
 wire [SD_WIDTH-1:0]  Data_out4 ;                                           
 wire [SD_WIDTH-1:0]  Data_out5 ;                                           
 wire [SD_WIDTH-1:0]  Data_out6 ;                                           
 wire [SD_WIDTH-1:0]  Data_out7 ;                                           
 wire [SD_WIDTH-1:0]  Data_out8 ;                                           
 wire [SD_WIDTH-1:0]  Data_out9 ;                                           
 wire [SD_WIDTH-1:0]  Data_out10 ;                                          
 wire [SD_WIDTH-1:0]  Data_out11 ;                                          
 wire [SD_WIDTH-1:0]  Data_out12 ;                                          
 wire [SD_WIDTH-1:0]  Data_out13 ;                                          
 wire [SD_WIDTH-1:0]  Data_out14 ;                                          
 wire [SD_WIDTH-1:0]  Data_out15 ;                                          
 wire                 cen_wire ;                                            
 wire                 wen0_wire ;                                           
 wire                 wen1_wire ;                                           
 wire                 SD_sel_wire ;                                         
 wire [A_WIDTH-1:0]   ExtMA_wire ;                                          
 wire [A_WIDTH-1:0]   AGUMA_wire ;                                          
 wire [A_WIDTH-1:0]   MA0_wire ;                                            
 wire [A_WIDTH-1:0]   MA1_wire ;                                            
 wire                 AGU_en_wire ;                                         
 wire [SD_WIDTH-1:0]  BN0_MEM0_wire ;                                       
 wire [SD_WIDTH-1:0]  BN0_MEM1_wire ;                                       
 wire [SD_WIDTH-1:0]  BN0_MEM2_wire ;                                       
 wire [SD_WIDTH-1:0]  BN0_MEM3_wire ;                                       
 wire [SD_WIDTH-1:0]  BN0_MEM4_wire ;                                       
 wire [SD_WIDTH-1:0]  BN0_MEM5_wire ;                                       
 wire [SD_WIDTH-1:0]  BN0_MEM6_wire ;                                       
 wire [SD_WIDTH-1:0]  BN0_MEM7_wire ;                                       
 wire [SD_WIDTH-1:0]  BN1_MEM0_wire ;                                       
 wire [SD_WIDTH-1:0]  BN1_MEM1_wire ;                                       
 wire [SD_WIDTH-1:0]  BN1_MEM2_wire ;                                       
 wire [SD_WIDTH-1:0]  BN1_MEM3_wire ;                                       
 wire [SD_WIDTH-1:0]  BN1_MEM4_wire ;                                       
 wire [SD_WIDTH-1:0]  BN1_MEM5_wire ;                                       
 wire [SD_WIDTH-1:0]  BN1_MEM6_wire ;                                       
 wire [SD_WIDTH-1:0]  BN1_MEM7_wire ;                                       
 wire                 BN_wire ;                                             
 wire [P_WIDTH-1:0]   RA0D_in_wire ;                                        
 wire [P_WIDTH-1:0]   RA1D_in_wire ;                                        
 wire [P_WIDTH-1:0]   RA2D_in_wire ;                                        
 wire [P_WIDTH-1:0]   RA3D_in_wire ;                                        
 wire [P_WIDTH-1:0]   RA4D_in_wire ;                                        
 wire [P_WIDTH-1:0]   RA5D_in_wire ;                                        
 wire [P_WIDTH-1:0]   RA6D_in_wire ;                                        
 wire [P_WIDTH-1:0]   RA7D_in_wire ;                                        
 wire [P_WIDTH-1:0]   RA8D_in_wire ;                                        
 wire [P_WIDTH-1:0]   RA9D_in_wire ;                                        
 wire [P_WIDTH-1:0]   RA10D_in_wire ;                                       
 wire [P_WIDTH-1:0]   RA11D_in_wire ;                                       
 wire [P_WIDTH-1:0]   RA12D_in_wire ;                                       
 wire [P_WIDTH-1:0]   RA13D_in_wire ;                                       
 wire [P_WIDTH-1:0]   RA14D_in_wire ;                                       
 wire [P_WIDTH-1:0]   RA15D_in_wire ;                                       
 wire [P_WIDTH-1:0]   RA0D_out_wire ;                                       
 wire [P_WIDTH-1:0]   RA1D_out_wire ;                                       
 wire [P_WIDTH-1:0]   RA2D_out_wire ;                                       
 wire [P_WIDTH-1:0]   RA3D_out_wire ;                                       
 wire [P_WIDTH-1:0]   RA4D_out_wire ;                                       
 wire [P_WIDTH-1:0]   RA5D_out_wire ;                                       
 wire [P_WIDTH-1:0]   RA6D_out_wire ;                                       
 wire [P_WIDTH-1:0]   RA7D_out_wire ;                                       
 wire [P_WIDTH-1:0]   RA8D_out_wire ;                                       
 wire [P_WIDTH-1:0]   RA9D_out_wire ;                                       
 wire [P_WIDTH-1:0]   RA10D_out_wire ;                                      
 wire [P_WIDTH-1:0]   RA11D_out_wire ;                                      
 wire [P_WIDTH-1:0]   RA12D_out_wire ;                                      
 wire [P_WIDTH-1:0]   RA13D_out_wire ;                                      
 wire [P_WIDTH-1:0]   RA14D_out_wire ;                                      
 wire [P_WIDTH-1:0]   RA15D_out_wire ;                                      
                                                                            
 wire                 RomCen_wire ;                                         
 wire [ROMA_WIDTH-1:0] ROMA_wire ;                                          
 wire [P_WIDTH-1:0]   ROMD0_out_wire ;                                      
 wire [SD_WIDTH-1:0]  ROMD1_out_wire ;                                      
 wire [SD_WIDTH-1:0]  ROMD2_out_wire ;                                      
 wire [SD_WIDTH-1:0]  ROMD3_out_wire ;                                      
 wire [SD_WIDTH-1:0]  ROMD4_out_wire ;                                      
 wire [SD_WIDTH-1:0]  ROMD5_out_wire ;                                      
 wire [SD_WIDTH-1:0]  ROMD6_out_wire ;                                      
 wire [SD_WIDTH-1:0]  ROMD7_out_wire ;                                      
 wire [1:0]           Mul_sel_wire ;                                        
 wire [P_WIDTH-1:0]   MulB0_wire ;                                          
 wire [P_WIDTH-1:0]   MulB1_wire ;                                          
 wire [P_WIDTH-1:0]   MulB2_wire ;                                          
 wire [P_WIDTH-1:0]   MulB3_wire ;                                          
 wire [P_WIDTH-1:0]   MulB4_wire ;                                          
 wire [P_WIDTH-1:0]   MulB5_wire ;                                          
 wire [P_WIDTH-1:0]   MulB6_wire ;                                          
 wire [P_WIDTH-1:0]   MulB7_wire ;                                          
 wire [P_WIDTH-1:0]   MulB8_wire ;                                          
 wire [P_WIDTH-1:0]   MulB9_wire ;                                          
 wire [P_WIDTH-1:0]   MulB10_wire ;                                         
 wire [P_WIDTH-1:0]   MulB11_wire ;                                         
 wire [P_WIDTH-1:0]   MulB12_wire ;                                         
 wire [P_WIDTH-1:0]   MulB13_wire ;                                         
 wire [P_WIDTH-1:0]   MulB14_wire ;                                         
 wire [P_WIDTH-1:0]   MulB15_wire ;                                         
 wire [3:0]           RDC_sel_wire ;                                        
 wire                 BND_wire ;                                            
 wire [A_WIDTH-1:0]   WMA_wire ;                                            
                                                                            
 wire [DC_WIDTH-1:0]  data_cnt_wire ;                                       
 wire [1:0]           DC_mode_sel_wire ;                                    
                                                                            
 wire                 mode_sel_wire ;  
 wire [P_WIDTH-1:0]   MulA0_wire ;                                     
 wire [P_WIDTH-1:0]   MulA1_wire ;                                          
 wire [P_WIDTH-1:0]   MulA2_wire ;                                          
 wire [P_WIDTH-1:0]   MulA3_wire ;                                          
 wire [P_WIDTH-1:0]   MulA4_wire ;                                          
 wire [P_WIDTH-1:0]   MulA5_wire ;                                          
 wire [P_WIDTH-1:0]   MulA6_wire ;                                          
 wire [P_WIDTH-1:0]   MulA7_wire ;        
 wire [P_WIDTH-1:0]   MulA8_wire ;                                  
 wire [P_WIDTH-1:0]   MulA9_wire ;                                          
 wire [P_WIDTH-1:0]   MulA10_wire ;                                         
 wire [P_WIDTH-1:0]   MulA11_wire ;                                         
 wire [P_WIDTH-1:0]   MulA12_wire ;                                         
 wire [P_WIDTH-1:0]   MulA13_wire ;                                         
 wire [P_WIDTH-1:0]   MulA14_wire ;                                         
 wire [P_WIDTH-1:0]   MulA15_wire ;                                         
                               
                                                                            
                                                                            
 wire                 rc_sel_wire ; //modify 2020/02/24                     
 wire                 m2_sel_wire ;                                                                              
 wire                  mode_sel_D_wire ;                                    
 wire [1:0]            Mul_sel_D_wire ;                                     
 wire [3:0]            RDC_sel_D_wire ;                                     
 wire [1:0]            DC_mode_sel_D_wire ;                                 
 wire                  wrfd_en_wire ;        
 wire                  FFT_fin_wire ;                                 
                                                                                                                                             
 wire [P_WIDTH-1:0]    N_D4_wire ;                                          
 wire [P_WIDTH-1:0]    ROMD0_D_wire ;                                       
 wire [SD_WIDTH-1:0]   ROMD1_D_wire ;                                       
 wire [SD_WIDTH-1:0]   ROMD2_D_wire ;                                       
 wire [SD_WIDTH-1:0]   ROMD3_D_wire ;                                       
 wire [SD_WIDTH-1:0]   ROMD4_D_wire ;                                       
 wire [SD_WIDTH-1:0]   ROMD5_D_wire ;                                       
 wire [SD_WIDTH-1:0]   ROMD6_D_wire ;                                       
 wire [SD_WIDTH-1:0]   ROMD7_D_wire ;      

 //----------DTFAG---------
 wire [3:0]            DTFAG_j;
 wire [3:0]            DTFAG_t;  
 wire [3:0]            DTFAG_i; 
 wire [1:0]			   FFT_stage;      
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay0 	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay1 	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay2 	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay3 	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay4 	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay5 	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay6 	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay7 	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay8 	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay9 	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay10	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay11	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay12	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay13	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay14	;
 wire [P_WIDTH-1:0] R16_TF_Mul_DC_delay15	;        
           
                                                                                                  
     //----------------------------------------------------    
 	CenCtrl u_CenCtrl(.MulValid_out(MulValid_out),                            
 			          .cen_out(cen_wire),                                     
 			          .wen0_out(wen0_wire),                                   
 			          .wen1_out(wen1_wire),                                   
 			          .SD_sel_out(SD_sel_wire),                               
 			          .ExtMA_out(ExtMA_wire),                                 
 					  .AGU_en_out(AGU_en_wire),                               
 					  .RomCen_out(RomCen_wire),                                                          
 					  .rc_sel_out(rc_sel_wire),                               
 					  .m2_sel_out(m2_sel_wire),  //modify 2020/02/24          
 					  .wrfd_en_out(wrfd_en_wire),     
					  .FFT_fin		(FFT_fin_wire),
					  // input                        
 					  .data_cnt_in(data_cnt_wire),                            
 					  .BND_in(BND_wire),                                      
 			          .ExtValid_in(ExtValid_in),                              
                    .rst_n(rst_n),                                          
                    .clk(clk)                                               
                    ) ;                                                     
 	                                                                          
 	//                                                                        
 	R16_AGU u_R16_AGU(.BN_out(BN_wire),                                       
 			          .MA(AGUMA_wire),                                        
 					  .ROMA(ROMA_wire), 
                      .DC_mode_sel_out(DC_mode_sel_wire),
 					  .Mul_sel_out(Mul_sel_wire),                             
 					  .RDC_sel_out(RDC_sel_wire),                             
 					  .data_cnt_reg(data_cnt_wire),  
					  .DTFAG_j(DTFAG_j),
                	  .DTFAG_t(DTFAG_t),
                	  .DTFAG_i(DTFAG_i), 
					  .FFT_stage(FFT_stage),
					  //input                          	                                       
 					  .rc_sel_in(rc_sel_wire),                                
 			          .AGU_en(AGU_en_wire),                                   
 					  .wrfd_en_in(wrfd_en_wire),                              
                    .rst_n(rst_n),                                          
                    .clk(clk),
					.FFT_fin_wire(FFT_fin_wire)                                               
                    ) ;                                                     
 	                                                                          
 	//Control Signal Pipeline Register                                        
 	Ctrl_PipeReg1 u_Ctrl_PipeReg1( 
                                    .DC_mode_sel_Dout(DC_mode_sel_D_wire),         
 				                    .Mul_sel_Dout(Mul_sel_D_wire),              
 				                    .RDC_sel_Dout(RDC_sel_D_wire),
                                    .DC_mode_sel_in(DC_mode_sel_wire),                             
 			                        .Mul_sel_in(Mul_sel_wire),                  
 			                        .RDC_sel_in(RDC_sel_wire),                  
                                    .rst_n(rst_n),                              
                                    .clk(clk)                                   
                                ) ;                                         
 	R16_WAddr u_R16_WAddr(  .BND_out(BND_wire),                                 
 			                .WMA_out(WMA_wire),                                 
                            .BN_in(BN_wire),                                 
 		                    .MA_in(AGUMA_wire),                                 
                            .rst_n(rst_n),                                   
                            .clk(clk)                                        
                        ) ;                                              
 	                                                                          
    //-----------------------------------------------------
	                                   
 	//for SRAM                                                                
 	Mux1 u_Mux1(.BN0_MEM0_Dout(BN0_MEM0_wire),                                
 			    .BN0_MEM1_Dout(BN0_MEM1_wire),                                
 				.BN0_MEM2_Dout(BN0_MEM2_wire),                                
 				.BN0_MEM3_Dout(BN0_MEM3_wire),                                
 			    .BN0_MEM4_Dout(BN0_MEM4_wire),                                
 			    .BN0_MEM5_Dout(BN0_MEM5_wire),                                
 			    .BN0_MEM6_Dout(BN0_MEM6_wire),                                
 			    .BN0_MEM7_Dout(BN0_MEM7_wire),                                
 			    .BN1_MEM0_Dout(BN1_MEM0_wire),                                
 			    .BN1_MEM1_Dout(BN1_MEM1_wire),                                
 				.BN1_MEM2_Dout(BN1_MEM2_wire),                                
 			    .BN1_MEM3_Dout(BN1_MEM3_wire),                                
 			    .BN1_MEM4_Dout(BN1_MEM4_wire),                                
 			    .BN1_MEM5_Dout(BN1_MEM5_wire),                                
 			    .BN1_MEM6_Dout(BN1_MEM6_wire),                                
 			    .BN1_MEM7_Dout(BN1_MEM7_wire),                                
 				.MA0_out(MA0_wire),                                           
 				.MA1_out(MA1_wire),                                           
 		        .ExtB0_D0_in(ExtB0_D0_in),                                    
 			    .ExtB0_D1_in(ExtB0_D1_in),                                    
 			    .ExtB0_D2_in(ExtB0_D2_in),                                    
 			    .ExtB0_D3_in(ExtB0_D3_in),                                    
 				.ExtB0_D4_in(ExtB0_D4_in),                                    
 				.ExtB0_D5_in(ExtB0_D5_in),                                    
 			    .ExtB0_D6_in(ExtB0_D6_in),                                    
 			    .ExtB0_D7_in(ExtB0_D7_in),                                    
 			    .ExtB0_D8_in(ExtB0_D8_in),                                    
 			    .ExtB0_D9_in(ExtB0_D9_in),                                    
 			    .ExtB0_D10_in(ExtB0_D10_in),                                  
 			    .ExtB0_D11_in(ExtB0_D11_in),                                  
 			    .ExtB0_D12_in(ExtB0_D12_in),                                  
 			    .ExtB0_D13_in(ExtB0_D13_in),                                  
 			    .ExtB0_D14_in(ExtB0_D14_in),                                  
 			    .ExtB0_D15_in(ExtB0_D15_in),  

 			    .ExtB1_D0_in(ExtB1_D0_in),                                    
 			    .ExtB1_D1_in(ExtB1_D1_in),                                    
                .ExtB1_D2_in(ExtB1_D2_in),                                    
 			    .ExtB1_D3_in(ExtB1_D3_in),                                    
 				.ExtB1_D4_in(ExtB1_D4_in),                                    
 			    .ExtB1_D5_in(ExtB1_D5_in),                                    
 			    .ExtB1_D6_in(ExtB1_D6_in),                                    
 			    .ExtB1_D7_in(ExtB1_D7_in),                                    
 			    .ExtB1_D8_in(ExtB1_D8_in),                                    
 			    .ExtB1_D9_in(ExtB1_D9_in),                                    
 			    .ExtB1_D10_in(ExtB1_D10_in),                                  
 			    .ExtB1_D11_in(ExtB1_D11_in),                                  
 			    .ExtB1_D12_in(ExtB1_D12_in),                                  
 			    .ExtB1_D13_in(ExtB1_D13_in),                                  
 			    .ExtB1_D14_in(ExtB1_D14_in),                                  
 			    .ExtB1_D15_in(ExtB1_D15_in),         

 				.RDC_in0 (R16_TF_Mul_DC_delay0 ),                                    
 				.RDC_in1 (R16_TF_Mul_DC_delay1 ),                                    
 				.RDC_in2 (R16_TF_Mul_DC_delay2 ),                                    
 				.RDC_in3 (R16_TF_Mul_DC_delay3 ),                                    
 				.RDC_in4 (R16_TF_Mul_DC_delay4 ),                                    
 			    .RDC_in5 (R16_TF_Mul_DC_delay5 ),                                    
 			    .RDC_in6 (R16_TF_Mul_DC_delay6 ),                                    
 			    .RDC_in7 (R16_TF_Mul_DC_delay7 ),                                    
 			    .RDC_in8 (R16_TF_Mul_DC_delay8 ),                                    
 			    .RDC_in9 (R16_TF_Mul_DC_delay9 ),                                    
 			    .RDC_in10(R16_TF_Mul_DC_delay10),                                  
 			    .RDC_in11(R16_TF_Mul_DC_delay11),                                  
 			    .RDC_in12(R16_TF_Mul_DC_delay12),                                  
 			    .RDC_in13(R16_TF_Mul_DC_delay13),                                  
 			    .RDC_in14(R16_TF_Mul_DC_delay14),                                  
 			    .RDC_in15(R16_TF_Mul_DC_delay15),                                  
 				.ExtMA_in(ExtMA_wire),                                        
 				.AGUMA_in(AGUMA_wire),                                        
 				.WMA_in(WMA_wire),                                            
 				.wen0_in(wen0_wire),                                          
 				.wen1_in(wen1_wire),                                          
 			    .SD_sel(SD_sel_wire)                                          
 			    ) ;                                                           
 	                                                                          
 	//for Radix-16                                                            
 	Mux2 u_Mux2(.RA0_out(RA0D_in_wire),                                       
 			    .RA1_out(RA1D_in_wire),                                       
 			    .RA2_out(RA2D_in_wire),                                       
 			    .RA3_out(RA3D_in_wire),                                       
 				.RA4_out(RA4D_in_wire),                                       
 			    .RA5_out(RA5D_in_wire),                                       
 			    .RA6_out(RA6D_in_wire),                                       
 			    .RA7_out(RA7D_in_wire),                                       
 			    .RA8_out(RA8D_in_wire),                                       
 			    .RA9_out(RA9D_in_wire),                                       
 			    .RA10_out(RA10D_in_wire),                                     
 			    .RA11_out(RA11D_in_wire),                                     
 			    .RA12_out(RA12D_in_wire),                                     
 			    .RA13_out(RA13D_in_wire),                                     
 			    .RA14_out(RA14D_in_wire),                                     
 			    .RA15_out(RA15D_in_wire),                                     
 		        .BN0_MEM0_in(Data_out0),                                      
 			    .BN0_MEM1_in(Data_out1),                                      
 				.BN0_MEM2_in(Data_out2),                                      
 				.BN0_MEM3_in(Data_out3),                                      
 			    .BN0_MEM4_in(Data_out4),                                      
 			    .BN0_MEM5_in(Data_out5),                                      
 			    .BN0_MEM6_in(Data_out6),                                      
 			    .BN0_MEM7_in(Data_out7),                                      
 			    .BN1_MEM0_in(Data_out8),                                      
 			    .BN1_MEM1_in(Data_out9),                                      
 				.BN1_MEM2_in(Data_out10),                                     
 			    .BN1_MEM3_in(Data_out11),                                     
 			    .BN1_MEM4_in(Data_out12),                                     
 			    .BN1_MEM5_in(Data_out13),                                     
 			    .BN1_MEM6_in(Data_out14),                                     
 			    .BN1_MEM7_in(Data_out15),                                     
 			    .BN_sel(BN_wire)                                              
 			    ) ;                                                           
 	                                                                          
 	//                                                                        
 	Radix16_Pipe u_Radix16_Pipe(.RA0_out(RA0D_out_wire),                      
 			                    .RA1_out(RA1D_out_wire),                      
 			                    .RA2_out(RA2D_out_wire),                      
 			                    .RA3_out(RA3D_out_wire),                      
 					            .RA4_out(RA4D_out_wire),                      
 			                    .RA5_out(RA5D_out_wire),                      
 			                    .RA6_out(RA6D_out_wire),                      
 			                    .RA7_out(RA7D_out_wire),                      
 			                    .RA8_out(RA8D_out_wire),                      
 			                    .RA9_out(RA9D_out_wire),                      
 			                    .RA10_out(RA10D_out_wire),                    
 			                    .RA11_out(RA11D_out_wire),                    
 			                    .RA12_out(RA12D_out_wire),                    
 			                    .RA13_out(RA13D_out_wire),                    
 			                    .RA14_out(RA14D_out_wire),                    
 			                    .RA15_out(RA15D_out_wire),                    
                                .RA0_in(RA0D_in_wire),                        
 			                    .RA1_in(RA1D_in_wire),                        
 			                    .RA2_in(RA2D_in_wire),                        
 			                    .RA3_in(RA3D_in_wire),                        
 					            .RA4_in(RA4D_in_wire),                        
 			                    .RA5_in(RA5D_in_wire),                        
 			                    .RA6_in(RA6D_in_wire),                        
 			                    .RA7_in(RA7D_in_wire),                        
 			                    .RA8_in(RA8D_in_wire),                        
 			                    .RA9_in(RA9D_in_wire),                        
 			                    .RA10_in(RA10D_in_wire),                      
 			                    .RA11_in(RA11D_in_wire),                      
 			                    .RA12_in(RA12D_in_wire),                      
 			                    .RA13_in(RA13D_in_wire),                      
 			                    .RA14_in(RA14D_in_wire),                      
 			                    .RA15_in(RA15D_in_wire),                      
 		                        .N_in(N_in),                                  
                                .rst_n(rst_n),                                
                                .clk(clk)                                     
                              ) ;     
	                                         
 	//Pipeline Register                                                       
 	R16_NPipeReg3 u_R16_NPipeReg3(.N_D4_out(N_D4_wire),                       
                                   .N_in(N_in),                             
                                   .rst_n(rst_n),                           
                                   .clk(clk)                                
                                   ) ;                                      
 	                                                              
 	//-----------------------------------------------------                   
 	// for CRUR16                                                             
 	Mux4 u_Mux4(.Result0_out(MulD0_out),                                       
 			    .Result1_out(MulD1_out),                                       
 			    .Result2_out(MulD2_out),                                       
 			    .Result3_out(MulD3_out),                                       
 				.Result4_out(MulD4_out),                                       
 			    .Result5_out(MulD5_out),                                       
 			    .Result6_out(MulD6_out),                                       
 			    .Result7_out(MulD7_out),                                       
 			    .Result8_out(MulD8_out),                                       
 			    .Result9_out(MulD9_out),                                       
 			    .Result10_out(MulD10_out),                                     
 			    .Result11_out(MulD11_out),                                     
 			    .Result12_out(MulD12_out),                                     
 			    .Result13_out(MulD13_out),                                     
 			    .Result14_out(MulD14_out),                                     
 			    .Result15_out(MulD15_out),                                     
 			    .NTTD0_in(RA0D_in_wire),                                     
                .NTTD1_in(RA1D_in_wire),                                     
                .NTTD2_in(RA2D_in_wire),                                     
                .NTTD3_in(RA3D_in_wire),                                     
 				.NTTD4_in(RA4D_in_wire),                                     
 			    .NTTD5_in(RA5D_in_wire),                                     
 			    .NTTD6_in(RA6D_in_wire),                                     
 			    .NTTD7_in(RA7D_in_wire),                                     
 			    .NTTD8_in(RA8D_in_wire),                                     
 			    .NTTD9_in(RA9D_in_wire),                                     
 			    .NTTD10_in(RA10D_in_wire),                                   
 			    .NTTD11_in(RA11D_in_wire),                                   
 			    .NTTD12_in(RA12D_in_wire),                                   
 			    .NTTD13_in(RA13D_in_wire),                                   
 			    .NTTD14_in(RA14D_in_wire),                                   
 			    .NTTD15_in(RA15D_in_wire)                                       
 			    ) ;                                                           
                
 	//---FFT1----------------------------------------------                   
 	//Bank0 Mem0                                                              
  SRAM_SP_2048_128 u0_SRAM_SP_2048_128 (.Q(Data_out0),
                                        .CLK(clk),                       
                                        .CEN(cen_wire),                  
                                        .WEN(wen0_wire),                 
                                        .A(MA0_wire),                    
                                        .D(BN0_MEM0_wire),               
                                        .EMA(3'd0)                   
                                        );                               
 	//Bank0 Mem1                                                              
  SRAM_SP_2048_128 u1_SRAM_SP_2048_128 (.Q(Data_out1),
                                        .CLK(clk),                       
                                        .CEN(cen_wire),                  
                                        .WEN(wen0_wire),                 
                                        .A(MA0_wire),                    
                                        .D(BN0_MEM1_wire),               
                                        .EMA(3'd0)                   
                                        );							      
 	//Bank0 Mem2                                                              
  SRAM_SP_2048_128 u2_SRAM_SP_2048_128 (.Q(Data_out2),
                                           .CLK(clk),                       
                                           .CEN(cen_wire),                  
                                           .WEN(wen0_wire),                 
                                           .A(MA0_wire),                    
                                           .D(BN0_MEM2_wire),               
                                           .EMA(3'd0)                   
                                           );                               
 	//Bank0 Mem3                                                              
  SRAM_SP_2048_128 u3_SRAM_SP_2048_128 (.Q(Data_out3),
                                           .CLK(clk),                       
                                           .CEN(cen_wire),                  
                                           .WEN(wen0_wire),                 
                                           .A(MA0_wire),                    
                                           .D(BN0_MEM3_wire),               
                                           .EMA(3'd0)                   
                                           );                               
 	//Bank0 Mem4                                                              
  SRAM_SP_2048_128 u4_SRAM_SP_2048_128 (.Q(Data_out4),
                                           .CLK(clk),                       
                                           .CEN(cen_wire),                  
                                           .WEN(wen0_wire),                 
                                           .A(MA0_wire),                    
                                           .D(BN0_MEM4_wire),               
                                           .EMA(3'd0)                   
                                           );							      
 	//Bank0 Mem5                                                              
  SRAM_SP_2048_128 u5_SRAM_SP_2048_128 (.Q(Data_out5),
                                           .CLK(clk),                       
                                           .CEN(cen_wire),                  
                                           .WEN(wen0_wire),                 
                                           .A(MA0_wire),                    
                                           .D(BN0_MEM5_wire),               
                                           .EMA(3'd0)                   
                                           );                               
 	//Bank0 Mem6                                                              
  SRAM_SP_2048_128 u6_SRAM_SP_2048_128 (.Q(Data_out6),
                                           .CLK(clk),                       
                                           .CEN(cen_wire),                  
                                           .WEN(wen0_wire),                 
                                           .A(MA0_wire),                    
                                           .D(BN0_MEM6_wire),               
                                           .EMA(3'd0)                   
                                           );                               
 	//Bank0 Mem7                                                              
  SRAM_SP_2048_128 u7_SRAM_SP_2048_128 (.Q(Data_out7),
                                           .CLK(clk),                       
                                           .CEN(cen_wire),                  
                                           .WEN(wen0_wire),                 
                                           .A(MA0_wire),                    
                                           .D(BN0_MEM7_wire),               
                                           .EMA(3'd0)                   
                                           );                               
 			                                                                  
 			                                                                  
 	//Bank1 Mem0                                                              
  SRAM_SP_2048_128 u8_SRAM_SP_2048_128 (.Q(Data_out8),
                                           .CLK(clk),                       
                                           .CEN(cen_wire),                  
                                           .WEN(wen1_wire),                 
                                           .A(MA1_wire),                    
                                           .D(BN1_MEM0_wire),               
                                           .EMA(3'd0)                   
                                           );							      
 	//Bank0 Mem1                                                              
  SRAM_SP_2048_128 u9_SRAM_SP_2048_128 (.Q(Data_out9),
                                           .CLK(clk),                       
                                           .CEN(cen_wire),                  
                                           .WEN(wen1_wire),                 
                                           .A(MA1_wire),                    
                                           .D(BN1_MEM1_wire),               
                                           .EMA(3'd0)                   
                                           );	                              
 	//Bank1 Mem2                                                              
  SRAM_SP_2048_128 u10_SRAM_SP_2048_128 (.Q(Data_out10),
                                            .CLK(clk),                      
                                            .CEN(cen_wire),                 
                                            .WEN(wen1_wire),                
                                            .A(MA1_wire),                   
                                            .D(BN1_MEM2_wire),              
                                            .EMA(3'd0)                  
                                            );		                      
 	//Bank1 Mem3                                                              
  SRAM_SP_2048_128 u11_SRAM_SP_2048_128 (.Q(Data_out11),
                                            .CLK(clk),                      
                                            .CEN(cen_wire),                 
                                            .WEN(wen1_wire),                
                                            .A(MA1_wire),                   
                                            .D(BN1_MEM3_wire),              
                                            .EMA(3'd0)                  
                                            );		                      
 	//Bank1 Mem4                                                              
  SRAM_SP_2048_128 u12_SRAM_SP_2048_128 (.Q(Data_out12),
                                            .CLK(clk),                      
                                            .CEN(cen_wire),                 
                                            .WEN(wen1_wire),                
                                            .A(MA1_wire),                   
                                            .D(BN1_MEM4_wire),              
                                            .EMA(3'd0)                  
                                            );	                          
 	//Bank1 Mem5                                                              
  SRAM_SP_2048_128 u13_SRAM_SP_2048_128 (.Q(Data_out13),
                                            .CLK(clk),                      
                                            .CEN(cen_wire),                 
                                            .WEN(wen1_wire),                
                                            .A(MA1_wire),                   
                                            .D(BN1_MEM5_wire),              
                                            .EMA(3'd0)                  
                                            );	                          
 	//Bank1 Mem6                                                              
  SRAM_SP_2048_128 u14_SRAM_SP_2048_128 (.Q(Data_out14),
                                            .CLK(clk),                      
                                            .CEN(cen_wire),                 
                                            .WEN(wen1_wire),                
                                            .A(MA1_wire),                   
                                            .D(BN1_MEM6_wire),              
                                            .EMA(3'd0)                  
                                            );		                      
 	//Bank1 Mem7                                                              
  SRAM_SP_2048_128 u15_SRAM_SP_2048_128 (.Q(Data_out15),
                                            .CLK(clk),                      
                                            .CEN(cen_wire),                 
                                            .WEN(wen1_wire),                
                                            .A(MA1_wire),                   
                                            .D(BN1_MEM7_wire),              
                                            .EMA(3'd0)                  
                                            );						      
     //-----------------------------------------------------     
    
	//---------------DTFAG--------------------
	DTFAG_top DTFAG_top(
		// input
		.clk			(clk		),
		.rst_n			(rst_n		),
		.ROM_CEN		(RomCen_wire),
		.DTFAG_j		(DTFAG_j	),
		.DTFAG_t		(DTFAG_t  	),
		.DTFAG_i		(DTFAG_i   	),
		.N_in			(N_in		),
		.FFT_stage_in  	(FFT_stage	),
		.Mul_sel_in		(Mul_sel_D_wire),
		.R16_data_in0 	(RA0D_out_wire ),
		.R16_data_in1 	(RA1D_out_wire ),
		.R16_data_in2 	(RA2D_out_wire ),
		.R16_data_in3 	(RA3D_out_wire ),
		.R16_data_in4 	(RA4D_out_wire ),
		.R16_data_in5 	(RA5D_out_wire ),
		.R16_data_in6 	(RA6D_out_wire ),
		.R16_data_in7 	(RA7D_out_wire ),
		.R16_data_in8 	(RA8D_out_wire ),
		.R16_data_in9 	(RA9D_out_wire ),
		.R16_data_in10	(RA10D_out_wire),
		.R16_data_in11	(RA11D_out_wire),
		.R16_data_in12	(RA12D_out_wire),
		.R16_data_in13	(RA13D_out_wire),
		.R16_data_in14	(RA14D_out_wire),
		.R16_data_in15	(RA15D_out_wire),
		.RDC_sel_D_in   (RDC_sel_D_wire),
		.DC_mode_sel_in (DC_mode_sel_D_wire),
		// output
		.R16_TF_Mul_DC_delay0 (R16_TF_Mul_DC_delay0 ),
		.R16_TF_Mul_DC_delay1 (R16_TF_Mul_DC_delay1 ),
		.R16_TF_Mul_DC_delay2 (R16_TF_Mul_DC_delay2 ),
		.R16_TF_Mul_DC_delay3 (R16_TF_Mul_DC_delay3 ),
		.R16_TF_Mul_DC_delay4 (R16_TF_Mul_DC_delay4 ),
		.R16_TF_Mul_DC_delay5 (R16_TF_Mul_DC_delay5 ),
		.R16_TF_Mul_DC_delay6 (R16_TF_Mul_DC_delay6 ),
		.R16_TF_Mul_DC_delay7 (R16_TF_Mul_DC_delay7 ),
		.R16_TF_Mul_DC_delay8 (R16_TF_Mul_DC_delay8 ),
		.R16_TF_Mul_DC_delay9 (R16_TF_Mul_DC_delay9 ),
		.R16_TF_Mul_DC_delay10(R16_TF_Mul_DC_delay10),
		.R16_TF_Mul_DC_delay11(R16_TF_Mul_DC_delay11),
		.R16_TF_Mul_DC_delay12(R16_TF_Mul_DC_delay12),
		.R16_TF_Mul_DC_delay13(R16_TF_Mul_DC_delay13),
		.R16_TF_Mul_DC_delay14(R16_TF_Mul_DC_delay14),
		.R16_TF_Mul_DC_delay15(R16_TF_Mul_DC_delay15)
	);    

	
	 
 endmodule                                                                  
