`timescale 1 ns/1 ps                                           
module MulMod128PD(Ninv2_out,                                  
			       t1FD_wire,                                   
				   t1D_wire,                                    
			       t3inv1D_wire,                                
				   dD_wire,                                     
			       t7D_wire,                                    
			       t1_s_in,                                     
			       t3_s_in,                                     
				   t3_c_in,                                     
			       t7_s_in,                                     
				   t7_c_in,                                     
                   Mul_in,                                     
		           N_in                                         
                   ) ;                                         
                                                               
parameter P_WIDTH     = 64 ;                                   
parameter W_WIDTH     = 32 ;                                   
parameter PD_WIDTH    = 128 ;                                  
parameter W_ZERO      = 32'h0 ;                                
parameter W_ZERO1     = 31'h0 ;                                
                                                               
                                                               
output [P_WIDTH:0]   Ninv2_out ;                               
output [P_WIDTH-1:0] t1FD_wire ;                               
output [P_WIDTH-1:0] t1D_wire ;                                
output [P_WIDTH-1:0] t3inv1D_wire ;                            
output [P_WIDTH-1:0] dD_wire ;                                 
output [P_WIDTH:0]   t7D_wire ;                                
                                                               
                                                               
input [W_WIDTH-1:0]  t1_s_in ;                                 
input [W_WIDTH-1:0]  t3_s_in ;                                 
input                t3_c_in ;                                 
input [P_WIDTH-1:0]  t7_s_in ;                                 
input                t7_c_in ;                                 
input [PD_WIDTH-1:0] Mul_in ;                                  
input [P_WIDTH-1:0]  N_in ;                                    
                                                               
	                                                            
	//65-bit inverter N                                         
	assign Ninv2_out = ~{1'b0, N_in} ;                          
	//                                                          
	assign t1FD_wire = {t1_s_in[W_WIDTH-1:0],32'hFFFF_FFFF} ;   
	//                                                          
	assign t1D_wire = {t1_s_in[W_WIDTH-1:0],W_ZERO} ;           
	// inverter t6                                              
	assign t3inv1D_wire = (~{W_ZERO1,t3_c_in,t3_s_in}) ;        
	//	                                                        
	assign dD_wire = {W_ZERO,Mul_in[31:0]} ;                    
	//65-bit t7                                                 
	assign t7D_wire = {t7_c_in,t7_s_in} ;                       
	                                                            
	                                                            
endmodule                                                      
