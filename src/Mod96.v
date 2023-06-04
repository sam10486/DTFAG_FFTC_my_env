`timescale 1 ns/1 ps                                                             
module Mod96(S_out,                                                              
             A_in,                                                               
		     N_in,                                                                  
             rst_n,                                                              
             clk                                                                 
             ) ;                                                                 
parameter D_WIDTH     = 96 ;                                                     
parameter P_WIDTH     = 64 ;                                                     
parameter SEG_ZERO    = 32'h0 ;                                                  
parameter P_ZERO      = 64'h0 ;                                                  
                                                                                 
                                                                                 
output[P_WIDTH-1:0] S_out ;                                                      
                                                                                 
input [D_WIDTH-1:0] A_in ;                                                       
input [P_WIDTH-1:0] N_in ;                                                       
input               rst_n ;                                                      
input               clk ;                                                        
                                                                                 
                                                                                 
wire  [P_WIDTH-1:0]  Ninv1_wire ;                                                
wire  [P_WIDTH:0]    Ninv2_wire ;                                                
wire  [P_WIDTH-1:0]  efD_wire ;                                                  
wire  [P_WIDTH-1:0]  dHD_wire ;                                                  
wire  [P_WIDTH-1:0]  dLDinv_wire ;                                               
wire  [P_WIDTH:0]    t1D_wire ;                                                  
                                                                                 
wire  [P_WIDTH-1:0]  S_tefp_wire ;                                               
wire                 C_tefp_wire ;                                               
wire  [P_WIDTH-1:0]  efp_wire ;                                                  
wire  [P_WIDTH-1:0]  S_t1_wire ;                                                 
wire                 C_t1_wire ;                                                 
wire  [P_WIDTH:0]    S_t2_wire ;                                                 
wire                 C_t2_wire ;                                                 
wire  [P_WIDTH-1:0]  t3_wire ;                                                   
wire  [P_WIDTH-1:0]  S_t4_wire ;                                                 
wire                 C_t4_wire ;	                                                
wire  [P_WIDTH-1:0]  S_t5_wire ;                                                 
wire                 C_t5_wire ;                                                 
                                                                                 
wire  [P_WIDTH-1:0]  S_t1_reg_wire ;                                             
wire                 C_t1_reg_wire ;                                             
wire  [P_WIDTH-1:0]  S_t4_reg_wire ;                                             
wire                 C_t4_reg_wire ;                                             
wire  [P_WIDTH-1:0]  dLDinv_reg_wire ;                                           
wire  [P_WIDTH:0]    Ninv2_reg_wire ;                                            
wire  [P_WIDTH-1:0]  N_D2_wire ;                                                 
                                                                                 
	                                                                                
	//Pipeline Register                                                             
	R16_NPipeReg1 u_R16_NPipeReg1(.N_D2_out(N_D2_wire),                             
                                  .N_in(N_in),                                   
                                  .rst_n(rst_n),                                 
                                  .clk(clk)                                      
                                  ) ;                                            
	                                                                                
	//Pre-process Data                                                              
	Mod96PD u_Mod96PD(.Ninv1_out(Ninv1_wire), //64-bit inverter N                   
                      .Ninv2_out(Ninv2_wire), //65-bit inverter N                
			          .efD_out(efD_wire), //(2^32e)+f                               
			          .dHD_out(dHD_wire), //(2^32d)                                 
			          .dLDinv_out(dLDinv_wire), //inverter d                        
					  .t1D_out(t1D_wire), //65-bit t1                               
			          .t1_s_in(S_t1_reg_wire),                                      
			          .t1_c_in(C_t1_reg_wire),                                      
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
	                                                                                
	//(2^32e+f)+(2^32d) mod prime                                                   
	CLA64_co u1_CLA64_co(.sum(S_t1_wire),                                           
				         .c_out(C_t1_wire),                                         
                         .a_in(efp_wire),                                        
                         .b_in(dHD_wire),                                        
                         .c_in(1'b0)                                             
			             // rst_n,                                                  
                         // clk                                                  
                         ) ;                                                     
	//Pipeline Register                                                             
	R16_PipeReg3 u_R16_PipeReg3(.A0_out(S_t1_reg_wire),                             
								.Ac_out(C_t1_reg_wire),                             
								.Dinv_out(dLDinv_reg_wire),                         
								.Ninv2_out(Ninv2_reg_wire),                         
                                .A0_in(S_t1_wire),                               
								.Ac_in(C_t1_wire),                                  
								.Dinv_in(dLDinv_wire),                              
								.Ninv2_in(Ninv2_wire),                              
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
	ModMux u1_ModMux(.S_out(t3_wire),                                               
                     .A_in(S_t2_wire[P_WIDTH-1:0]), //Sel_in=1                   
		             .B_in(S_t1_reg_wire), //Sel_in=0                               
			         .Sel_in(C_t2_wire)                                             
                     ) ;                                                         
	                                                                                
	//(2^32e+f)+(2^32d)-(d) mod prime                                               
	CLA64_co u2_CLA64_co(.sum(S_t4_wire),                                           
				         .c_out(C_t4_wire),                                         
                         .a_in(t3_wire),                                         
                         .b_in(dLDinv_reg_wire),                                 
                         .c_in(1'b1)                                             
			             // rst_n,                                                  
                         // clk                                                  
                         ) ;                                                     
	//Pipeline Register                                                             
	R16_PipeReg2 u0_R16_PipeReg2(.A0_out(S_t4_reg_wire),                            
								 .Ac_out(C_t4_reg_wire),                            
                                 .A0_in(S_t4_wire),                              
								 .Ac_in(C_t4_wire),                                 
                                 .rst_n(rst_n),                                  
                                 .clk(clk)                                       
                                 ) ;                                             
	                                                                                
	//                                                                              
	CLA64_co u3_CLA64_co(.sum(S_t5_wire),                                           
				         .c_out(C_t5_wire),                                         
                         .a_in(S_t4_reg_wire),                                   
                         .b_in(N_D2_wire),                                       
                         .c_in(1'b0)                                             
			             // rst_n,                                                  
                         // clk                                                  
                         ) ;                                                     
	//                                                                              
	ModMux u2_ModMux(.S_out(S_out),                                                 
                     .A_in(S_t4_reg_wire), //Sel_in=1                            
		             .B_in(S_t5_wire), //Sel_in=0                                   
			         .Sel_in(C_t4_reg_wire)                                         
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
