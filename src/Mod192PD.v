`timescale 1 ns/1 ps                                   
module Mod192PD(Ninv1_out,                             
                Ninv2_out,                             
			    efD_out,                                 
				daD_out,                                 
			    bcD_out,                                 
				adD_out,                                 
			    t1D_out,                                 
				t4D_out,                                 
				t6invD_out,                              
			    t1_s_in,                                 
			    t1_c_in,                                 
				t4_s_in,                                 
			    t4_c_in,                                 
				t6_in,                                   
                A_in,                                  
		        N_in                                     
                ) ;                                    
parameter D_WIDTH     = 192 ;                          
parameter P_WIDTH     = 64 ;                           
parameter SEG_ZERO    = 32'h0 ;                        
                                                       
output [P_WIDTH-1:0] Ninv1_out ;                       
output [P_WIDTH:0]   Ninv2_out ;                       
output [P_WIDTH-1:0] efD_out ;                         
output [P_WIDTH-1:0] daD_out ;                         
output [P_WIDTH-1:0] bcD_out ;                         
output [P_WIDTH-1:0] adD_out ;                         
output [P_WIDTH:0]   t1D_out ;                         
output [P_WIDTH:0]   t4D_out ;                         
output [P_WIDTH-1:0] t6invD_out ;                      
                                                       
input [P_WIDTH-1:0] t1_s_in ;                          
input               t1_c_in ;                          
input [P_WIDTH-1:0] t4_s_in ;                          
input               t4_c_in ;                          
input [P_WIDTH-1:0] t6_in ;                            
input [D_WIDTH-1:0] A_in ;                             
input [P_WIDTH-1:0] N_in ;                             
                                                       
	                                                     
	//64-bit inverter N                                  
	assign Ninv1_out = (~N_in) ;                         
	//65-bit inverter N                                  
	assign Ninv2_out = ~{1'b0, N_in} ;                   
	//(2^32e)+f                                          
	assign efD_out = {A_in[63:32], A_in[31:0]} ;         
	//(2^32d+a) mod prime	                             
	assign daD_out = {A_in[95:64], A_in[191:160]} ;      
	//(2^32b+c) mod prime	                             
	assign bcD_out = {A_in[159:128], A_in[127:96]} ;     
	//(2^32a+d) mod prime	                             
	assign adD_out = {A_in[191:160], A_in[95:64]} ;      
	//65-bit t1                                          
	assign t1D_out = {t1_c_in,t1_s_in} ;                 
	//65-bit t4                                          
	assign t4D_out = {t4_c_in,t4_s_in} ;                 
	// inverter t6                                       
	assign t6invD_out = (~t6_in) ;                       
	                                                     
endmodule                                              
