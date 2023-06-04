`timescale 1 ns/1 ps                                              
module MulMod128(S_out,                                           
           A_in,                                                  
		   B_in,                                                     
		   N_in,                                                     
           rst_n,                                                 
           clk                                                    
           ) ;                                                    
                                                                  
parameter P_WIDTH     = 64 ;                                      
parameter PD_WIDTH    = 128 ;                                     
parameter W_WIDTH     = 32 ;                                      
                                                                  
                                                                  
output[P_WIDTH-1:0] S_out ;                                       
                                                                  
input [P_WIDTH-1:0] A_in ;                                        
input [P_WIDTH-1:0] B_in ;                                        
input [P_WIDTH-1:0] N_in ;                                        
input               rst_n ;                                       
input               clk ;                                         
                                                                  
                                                                  
                                                                  
wire  [PD_WIDTH-1:0] Mul_wire ;                                   
                                                                  
wire  [P_WIDTH:0]    Ninv2_wire ;                                 
wire  [P_WIDTH-1:0]  t1FD_wire ;                                  
wire  [P_WIDTH-1:0]  t1D_wire ;                                   
wire  [P_WIDTH-1:0]  t3inv1D_wire ;                               
wire  [P_WIDTH-1:0]  dD_wire ;                                    
wire  [P_WIDTH:0]    t7D_wire ;                                   
                                                                  
                                                                  
wire  [W_WIDTH-1:0]  S_t1_wire ;                                  
wire                 C_t1_wire ;                                  
wire  [W_WIDTH-1:0]  S_t3_wire ;                                  
wire                 C_t3_wire ;                                  
wire  [P_WIDTH-1:0]  t2_wire ;                                    
wire  [P_WIDTH-1:0]  S_t4_wire ;                                  
wire                 C_t4_wire ;                                  
wire  [P_WIDTH-1:0]  S_t5_wire ;                                  
wire                 C_t5_wire ;                                  
wire  [P_WIDTH-1:0]  t6_wire ;                                    
wire  [P_WIDTH-1:0]  S_t7_wire ;                                  
wire                 C_t7_wire ;                                  
wire  [P_WIDTH:0]    S_t8_wire ;                                  
wire                 C_t8_wire ;                                  
                                                                  
wire  [P_WIDTH-1:0]  S_out_wire ;                                 
                                                                  
wire  [P_WIDTH-1:0]  S_t4_reg_wire ;                              
wire                 C_t4_reg_wire ;                              
wire  [P_WIDTH-1:0]  N_D1_wire ;                                  
wire  [P_WIDTH-1:0]  dD_reg_wire ;                                
wire  [P_WIDTH-1:0]  S_t7_reg_wire ;                              
wire                 C_t7_reg_wire ;                              
wire  [P_WIDTH:0]    Ninv2_reg_wire ;                             
                                                                  
	                                                                 
	//Mul                                                            
	Mul64 u_Mul64(.S_out(Mul_wire),                                  
		          .A_in(A_in),                                       
		          .B_in(B_in),                                       
                  .rst_n(rst_n),                                  
                  .clk(clk)                                       
                  ) ;                                             
                                                                  
	//Pre-process Data                                               
    MulMod128PD u_MulMod128PD(.Ninv2_out(Ninv2_wire),             
			                  .t1FD_wire(t1FD_wire),                 
				              .t1D_wire(t1D_wire),                   
			                  .t3inv1D_wire(t3inv1D_wire),           
				              .dD_wire(dD_wire),                     
			                  .t7D_wire(t7D_wire),                   
			                  .t1_s_in(S_t1_wire),                   
			                  .t3_s_in(S_t3_wire),                   
				              .t3_c_in(C_t3_wire),                   
			                  .t7_s_in(S_t7_reg_wire),               
				              .t7_c_in(C_t7_reg_wire),               
                              .Mul_in(Mul_wire),                  
		                      .N_in(N_in)                            
                               ) ;                                
	                                                                 
	//b+c                                                            
	CLA32 u0_CLA32(.sum(S_t1_wire),                                  
				   .c_out(C_t1_wire),                                
                   .a_in(Mul_wire[95:64]),                        
                   .b_in(Mul_wire[63:32]),                        
                   .c_in(1'b0)                                    
			       // rst_n,                                         
                   // clk                                         
                   ) ;                                            
	//a+b                                                            
	CLA32 u1_CLA32(.sum(S_t3_wire),                                  
				   .c_out(C_t3_wire),                                
                   .a_in(Mul_wire[127:96]),                       
                   .b_in(Mul_wire[95:64]),                        
                   .c_in(1'b0)                                    
			       // rst_n,                                         
                   // clk                                         
                   ) ;		                                     
	                                                                 
	//(2^32)(b+c)                                                    
	ModMux u0_ModMux(.S_out(t2_wire),                                
                     .A_in(t1FD_wire), //Sel_in=1                 
		             .B_in(t1D_wire), //Sel_in=0                     
			         .Sel_in(C_t1_wire)                              
                     ) ;                                          
	                                                                 
	//(2^32)(b+c)-(a+b)                                              
	CLA64_co u0_CLA64_co(.sum(S_t4_wire),                            
				         .c_out(C_t4_wire),                          
                         .a_in(t2_wire),                          
                         .b_in(t3inv1D_wire),                     
                         .c_in(1'b1)                              
			             // rst_n,                                   
                         // clk                                   
                         ) ;                                      
	//Pipeline Register                                              
	R16_PipeReg4_2 u0_R16_PipeReg4_2(.A0_out(S_t4_reg_wire),         
								     .Ac_out(C_t4_reg_wire),         
									 .N_D1_out(N_D1_wire),           
									 .D_out(dD_reg_wire),            
                                     .A0_in(S_t4_wire),           
								     .Ac_in(C_t4_wire),              
									 .N_in(N_in),                    
									 .D_in(dD_wire),                 
                                     .rst_n(rst_n),               
                                     .clk(clk)                    
                                     ) ;                          
	                                                                 
	//                                                               
	CLA64_co u1_CLA64_co(.sum(S_t5_wire),                            
				         .c_out(C_t5_wire),                          
                         .a_in(S_t4_reg_wire),                    
                         .b_in(N_D1_wire),                        
                         .c_in(1'b0)                              
			             // rst_n,                                   
                         // clk                                   
                         ) ;  			                         
	                                                                 
	//                                                               
	ModMux u1_ModMux(.S_out(t6_wire),                                
                     .A_in(S_t4_reg_wire), //Sel_in=1             
		             .B_in(S_t5_wire), //Sel_in=0                    
			         .Sel_in(C_t4_reg_wire)                          
                     ) ;                                          
	                                                                 
	//2^32)(b+c)-(a+b)+d                                             
	CLA64_co u2_CLA64_co(.sum(S_t7_wire),                            
				         .c_out(C_t7_wire),                          
                         .a_in(t6_wire),                          
                         .b_in(dD_reg_wire),                      
                         .c_in(1'b0)                              
			             // rst_n,                                   
                         // clk                                   
                         ) ;  					                 
	//Pipeline Register                                              
	R16_PipeReg4 u_R16_PipeReg4(.A0_out(S_t7_reg_wire),              
					            .Ac_out(C_t7_reg_wire),              
					            .Ninv2_D2_out(Ninv2_reg_wire),       
                                .A0_in(S_t7_wire),                
					            .Ac_in(C_t7_wire),                   
					            .Ninv2_in(Ninv2_wire),               
                                .rst_n(rst_n),                    
                                .clk(clk)                         
                                ) ;                               
	                                                                 
	//                                                               
	CLA65 u0_CLA65(.sum(S_t8_wire),                                  
				   .c_out(C_t8_wire),                                
                   .a_in(t7D_wire),                               
                   .b_in(Ninv2_reg_wire),                         
                   .c_in(1'b1)                                    
			       // rst_n,                                         
                   // clk                                         
                   ) ;                                            
	//                                                               
	ModMux u2_ModMux(.S_out(S_out),                                  
                     .A_in(S_t8_wire[P_WIDTH-1:0]), //Sel_in=1    
		             .B_in(S_t7_reg_wire), //Sel_in=0                
			         .Sel_in(C_t8_wire)                              
                     ) ;                                          
                                                                  
	                                                                 
endmodule                                                         
