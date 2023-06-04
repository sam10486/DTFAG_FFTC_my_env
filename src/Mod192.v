`timescale 1 ns/1 ps                                                        
module Mod192(S_out,                                                        
           A_in,                                                            
		   N_in,                                                             
           rst_n,                                                           
           clk                                                              
           ) ;                                                              
parameter D_WIDTH     = 192 ;                                               
parameter P_WIDTH     = 64 ;                                                
                                                                            
parameter P_ZERO      = 64'h0 ;                                             
                                                                            
                                                                            
output[P_WIDTH-1:0] S_out ;                                                 
                                                                            
input [D_WIDTH-1:0] A_in ;                                                  
input [P_WIDTH-1:0] N_in ;                                                  
input               rst_n ;                                                 
input               clk ;                                                   
                                                                            
                                                                            
wire  [P_WIDTH-1:0]  Ninv1_wire ;                                           
wire  [P_WIDTH:0]    Ninv2_wire ;                                           
wire  [P_WIDTH-1:0]  efD_wire ;                                             
wire  [P_WIDTH-1:0]  daD_wire ;                                             
wire  [P_WIDTH-1:0]  bcD_wire ;                                             
wire  [P_WIDTH-1:0]  adD_wire ;                                             
wire  [P_WIDTH:0]    t1D_wire ;                                             
wire  [P_WIDTH:0]    t4D_wire ;                                             
wire  [P_WIDTH-1:0]  t6invD_wire ;                                          
                                                                            
                                                                            
wire  [P_WIDTH-1:0]  S_tefp_wire ;                                          
wire                 C_tefp_wire ;                                          
wire  [P_WIDTH-1:0]  efp_wire ;                                             
wire  [P_WIDTH-1:0]  S_tdap_wire ;                                          
wire                 C_tdap_wire ;                                          
wire  [P_WIDTH-1:0]  dap_wire ;                                             
wire  [P_WIDTH-1:0]  S_tbcp_wire ;                                          
wire                 C_tbcp_wire ;                                          
wire  [P_WIDTH-1:0]  bcp_wire ;                                             
wire  [P_WIDTH-1:0]  S_tadp_wire ;                                          
wire                 C_tadp_wire ;                                          
wire  [P_WIDTH-1:0]  adp_wire ;                                             
wire  [P_WIDTH-1:0]  S_t1_wire ;                                            
wire                 C_t1_wire ;                                            
wire  [P_WIDTH:0]    S_t2_wire ;                                            
wire                 C_t2_wire ;                                            
wire  [P_WIDTH-1:0]  t3_wire ;                                              
wire  [P_WIDTH-1:0]  S_t4_wire ;                                            
wire                 C_t4_wire ;                                            
wire  [P_WIDTH:0]    S_t5_wire ;                                            
wire                 C_t5_wire ;                                            
wire  [P_WIDTH-1:0]  t6_wire ;                                              
wire  [P_WIDTH-1:0]  S_t7_wire ;                                            
wire                 C_t7_wire ;                                            
wire  [P_WIDTH-1:0]  S_t8_wire ;                                            
wire                 C_t8_wire ;                                            
                                                                            
wire  [P_WIDTH-1:0]  S_t1_reg_wire ;                                        
wire                 C_t1_reg_wire ;                                        
wire  [P_WIDTH-1:0]  S_t4_reg_wire ;                                        
wire                 C_t4_reg_wire ;                                        
wire  [P_WIDTH-1:0]  S_t7_reg_wire ;                                        
wire                 C_t7_reg_wire ;                                        
wire  [P_WIDTH:0]    Ninv2_reg_wire ;                                       
wire  [P_WIDTH-1:0]  N_D2_wire ;                                            
                                                                            
                                                                            
	//Pipeline Register                                                      
    R16_NPipeReg2 u_R16_NPipeReg2(.Ninv2_D1_out(Ninv2_reg_wire),            
                                  .N_D2_out(N_D2_wire),                     
					              .Ninv2_in(Ninv2_wire),                     
                                  .N_in(N_in),                              
                                  .rst_n(rst_n),                            
                                  .clk(clk)                                 
                                  ) ;                                       
                                                                            
	//Pre-process Data                                                       
	Mod192PD u_Mod192PD(.Ninv1_out(Ninv1_wire), //64-bit inverter N          
                        .Ninv2_out(Ninv2_wire), //65-bit inverter N         
			            .efD_out(efD_wire), //(2^32e)+f                      
				        .daD_out(daD_wire), //(2^32d)+a                      
			            .bcD_out(bcD_wire), //(2^32b)+c                      
				        .adD_out(adD_wire), //(2^32a)+d                      
			            .t1D_out(t1D_wire), //65-bit t1                      
				        .t4D_out(t4D_wire), //65-bit t4                      
						.t6invD_out(t6invD_wire), // inverter t6             
			            .t1_s_in(S_t1_reg_wire),                             
			            .t1_c_in(C_t1_reg_wire),                             
				        .t4_s_in(S_t4_reg_wire),                             
			            .t4_c_in(C_t4_reg_wire),                             
						.t6_in(t6_wire),                                     
                        .A_in(A_in),                                        
		                .N_in(N_in)                                          
                        ) ;                                                 
                                                                            
	//(2^32e+f) mod prime                                                    
	CLA64_co u0_CLA64_co(.sum(S_tefp_wire),                                  
				         .c_out(C_tefp_wire),                                
                         .a_in(efD_wire),                                   
                         .b_in(Ninv1_wire),                                 
                         .c_in(1'b1)                                        
			             // rst_n,                                           
                         // clk                                             
                         ) ;                                                
	//                                                                       
	ModMux u0_ModMux(.S_out(efp_wire),                                       
                     .A_in(S_tefp_wire), //Sel_in=1, positive number        
		             .B_in(efD_wire), //Sel_in=0, negative number            
			         .Sel_in(C_tefp_wire)                                    
                     ) ;                                                    
	                                                                         
	//(2^32d+a) mod prime	                                                 
	CLA64_co u1_CLA64_co(.sum(S_tdap_wire),                                  
				         .c_out(C_tdap_wire),                                
                         .a_in(daD_wire),                                   
                         .b_in(Ninv1_wire),                                 
                         .c_in(1'b1)                                        
			             // rst_n,                                           
                         // clk                                             
                         ) ;                                                
	//                                                                       
	ModMux u1_ModMux(.S_out(dap_wire),                                       
                     .A_in(S_tdap_wire), //Sel_in=1, positive number        
		             .B_in(daD_wire), //Sel_in=0, negative number            
			         .Sel_in(C_tdap_wire)                                    
                     ) ;                                                    
	                                                                         
	//(2^32b+c) mod prime                                                    
	CLA64_co u2_CLA64_co(.sum(S_tbcp_wire),                                  
				         .c_out(C_tbcp_wire),                                
                         .a_in(bcD_wire),                                   
                         .b_in(Ninv1_wire),                                 
                         .c_in(1'b1)                                        
			             // rst_n,                                           
                         // clk                                             
                         ) ;                                                
	//                                                                       
	ModMux u2_ModMux(.S_out(bcp_wire),                                       
                     .A_in(S_tbcp_wire), //Sel_in=1, positive number        
		             .B_in(bcD_wire), //Sel_in=0, negative number            
			         .Sel_in(C_tbcp_wire)                                    
                     ) ;                                                    
	                                                                         
	//(2^32a+d) mod prime                                                    
	CLA64_co u3_CLA64_co(.sum(S_tadp_wire),                                  
				         .c_out(C_tadp_wire),                                
                         .a_in(adD_wire),                                   
                         .b_in(Ninv1_wire),                                 
                         .c_in(1'b1)                                        
			             // rst_n,                                           
                         // clk                                             
                         ) ;                                                
	//                                                                       
	ModMux u3_ModMux(.S_out(adp_wire),                                       
                     .A_in(S_tadp_wire), //Sel_in=1, positive number        
		             .B_in(adD_wire), //Sel_in=0, negative number            
			         .Sel_in(C_tadp_wire)                                    
                     ) ;                                                    
	                                                                         
	//(2^32e+f)+(2^32d+a) mod prime                                          
	CLA64_co u4_CLA64_co(.sum(S_t1_wire),                                    
				         .c_out(C_t1_wire),                                  
                         .a_in(efp_wire),                                   
                         .b_in(dap_wire),                                   
                         .c_in(1'b0)                                        
			             // rst_n,                                           
                         // clk                                             
                         ) ;                                                
	//Pipeline Register                                                      
	R16_PipeReg2 u0_R16_PipeReg2(.A0_out(S_t1_reg_wire),                     
								 .Ac_out(C_t1_reg_wire),                     
                                 .A0_in(S_t1_wire),                         
								 .Ac_in(C_t1_wire),                          
                                 .rst_n(rst_n),                             
                                 .clk(clk)                                  
                                 ) ;                                        
	                                                                         
	//                                                                       
	CLA65 u0_CLA65(.sum(S_t2_wire),                                          
				   .c_out(C_t2_wire),                                        
                   .a_in(t1D_wire),                                         
                   .b_in(Ninv2_reg_wire),                                   
                   .c_in(1'b1)                                              
			       // rst_n,                                                 
                   // clk                                                   
                   ) ;                                                      
	//                                                                       
	ModMux u4_ModMux(.S_out(t3_wire),                                        
                     .A_in(S_t2_wire[P_WIDTH-1:0]), //Sel_in=1              
		             .B_in(S_t1_reg_wire), //Sel_in=0                        
			         .Sel_in(C_t2_wire)                                      
                     ) ;                                                    
	                                                                         
	//(2^32b+c)+(2^32a+d) mod prime                                          
	CLA64_co u5_CLA64_co(.sum(S_t4_wire),                                    
				         .c_out(C_t4_wire),                                  
                         .a_in(bcp_wire),                                   
                         .b_in(adp_wire),                                   
                         .c_in(1'b0)                                        
			             // rst_n,                                           
                         // clk                                             
                         ) ;                                                
	//Pipeline Register                                                      
	R16_PipeReg2 u1_R16_PipeReg2(.A0_out(S_t4_reg_wire),                     
								 .Ac_out(C_t4_reg_wire),                     
                                 .A0_in(S_t4_wire),                         
								 .Ac_in(C_t4_wire),                          
                                 .rst_n(rst_n),                             
                                 .clk(clk)                                  
                                 ) ;                                        
	                                                                         
	//                                                                       
	CLA65 u1_CLA65(.sum(S_t5_wire),                                          
				   .c_out(C_t5_wire),                                        
                   .a_in(t4D_wire),                                         
                   .b_in(Ninv2_reg_wire),                                   
                   .c_in(1'b1)                                              
			       // rst_n,                                                 
                   // clk                                                   
                   ) ;                                                      
	//                                                                       
	ModMux u5_ModMux(.S_out(t6_wire),                                        
                     .A_in(S_t5_wire[P_WIDTH-1:0]), //Sel_in=1              
		             .B_in(S_t4_reg_wire), //Sel_in=0                        
			         .Sel_in(C_t5_wire)                                      
                     ) ;			                                         
	                                                                         
	//(2^32e+f)+(2^32d+a)-(2^32b+c)+(2^32a+d) mod prime                      
	CLA64_co u6_CLA64_co(.sum(S_t7_wire),                                    
				         .c_out(C_t7_wire),                                  
                         .a_in(t3_wire),                                    
                         .b_in(t6invD_wire),                                
                         .c_in(1'b1)                                        
			             // rst_n,                                           
                         // clk                                             
                         ) ;                                                
	//Pipeline Register                                                      
	R16_PipeReg2 u2_R16_PipeReg2(.A0_out(S_t7_reg_wire),                     
								 .Ac_out(C_t7_reg_wire),                     
                                 .A0_in(S_t7_wire),                         
								 .Ac_in(C_t7_wire),                          
                                 .rst_n(rst_n),                             
                                 .clk(clk)                                  
                                 ) ;                                        
	                                                                         
	//                                                                       
	CLA64_co u7_CLA64_co(.sum(S_t8_wire),                                    
				         .c_out(C_t8_wire),                                  
                         .a_in(S_t7_reg_wire),                              
                         .b_in(N_D2_wire),                                  
                         .c_in(1'b0)                                        
			             // rst_n,                                           
                         // clk                                             
                         ) ;                                                
	//                                                                       
	ModMux u6_ModMux(.S_out(S_out),                                          
                     .A_in(S_t7_reg_wire), //Sel_in=1                       
		             .B_in(S_t8_wire), //Sel_in=0                            
			         .Sel_in(C_t7_reg_wire)                                  
                     ) ;                                                    
	                                                                         
	                                                                         
	//                                                                       
	// always @(posedge clk or negedge rst_n) begin                          
		// if(~rst_n) begin                                                  
			// S_out <= P_ZERO ;                                             
		// end                                                               
		// else begin                                                        
			// S_out <= S_wire ;                                             
		// end                                                               
	// end                                                                   
                                                                            
endmodule                                                                   
