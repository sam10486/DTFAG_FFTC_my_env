 //==============================================
 //Writer:Shi-Yong Wu                            
 //                                              
 //Note:CP_CLA                                    
 //cyclotomic prime bit size carry lookahead adder
 //==============================================
 `timescale 1ns/1ps                              
                                                 
 module CP_CLA(                                 
   sum,                                         
   c_out,                                         
   a_in,                                        
   b_in,                                        
   c_in,                                        
 );                                             
                                                
 parameter CLA_WIDTH = 22;
 parameter CA_WIDTH = 5;
 parameter PG_WIDTH = 6;
 parameter C_1 = 0;
 parameter C_2 = 1;
 parameter C_3 = 2;
 parameter C_4 = 3;
 parameter C_5 = 4;
 parameter C_6 = 5;
 parameter SEG_1 = 4;
 parameter SEG_2 = 8;
 parameter SEG_3 = 12;
 parameter SEG_4 = 16;
 parameter SEG_5 = 20;
 parameter SEG_6 = 22;
 output[CLA_WIDTH-1:0] sum;
 output                c_out;


 input [CLA_WIDTH-1:0] a_in;
 input [CLA_WIDTH-1:0] b_in;
 input                 c_in;


 wire [PG_WIDTH-1:0] g_wire;
 wire [PG_WIDTH-1:0] p_wire;
 wire [CA_WIDTH-1:0] carry;
 	CLA4 u_CLA4_0(.sum(sum[SEG_1-1:0]),
 	                 .g_out(g_wire[C_1]),
 	                 .p_out(p_wire[C_1]),
 	                 .a_in(a_in[SEG_1-1:0]),
 	                 .b_in(b_in[SEG_1-1:0]),
 	                 .c_in(c_in)
 	                 ) ;                            
 	CLA4 u_CLA4_1(.sum(sum[SEG_2-1:SEG_1]),
 	                 .g_out(g_wire[C_2]),
 	                 .p_out(p_wire[C_2]),
 	                 .a_in(a_in[SEG_2-1:SEG_1]),
 	                 .b_in(b_in[SEG_2-1:SEG_1]),
 	                 .c_in(carry[C_1])
 	                 ) ;                            
 	CLA4 u_CLA4_2(.sum(sum[SEG_3-1:SEG_2]),
 	                 .g_out(g_wire[C_3]),
 	                 .p_out(p_wire[C_3]),
 	                 .a_in(a_in[SEG_3-1:SEG_2]),
 	                 .b_in(b_in[SEG_3-1:SEG_2]),
 	                 .c_in(carry[C_2])
 	                 ) ;                            
 	CLA4 u_CLA4_3(.sum(sum[SEG_4-1:SEG_3]),
 	                 .g_out(g_wire[C_4]),
 	                 .p_out(p_wire[C_4]),
 	                 .a_in(a_in[SEG_4-1:SEG_3]),
 	                 .b_in(b_in[SEG_4-1:SEG_3]),
 	                 .c_in(carry[C_3])
 	                 ) ;                            
 	CLA4 u_CLA4_4(.sum(sum[SEG_5-1:SEG_4]),
 	                 .g_out(g_wire[C_5]),
 	                 .p_out(p_wire[C_5]),
 	                 .a_in(a_in[SEG_5-1:SEG_4]),
 	                 .b_in(b_in[SEG_5-1:SEG_4]),
 	                 .c_in(carry[C_4])
 	                 ) ;                            
 	CLA2  u_CLA2 (.sum(sum[SEG_6-1:SEG_5]),
 	                 .g_out(g_wire[C_6]),
 	                 .p_out(p_wire[C_6]),
 	                 .a_in(a_in[SEG_6-1:SEG_5]),
 	                 .b_in(b_in[SEG_6-1:SEG_5]),
 	                 .c_in(carry[C_5])
 	                 ) ;                            
 	CLA_clg u_CLA_clg(.g_out(c_out),
 	                 .carry(carry),
 	                 .p_in0(p_wire[C_1]),
 	                 .g_in0(g_wire[C_1]),
 	                 .p_in1(p_wire[C_2]),
 	                 .g_in1(g_wire[C_2]),
 	                 .p_in2(p_wire[C_3]),
 	                 .g_in2(g_wire[C_3]),
 	                 .p_in3(p_wire[C_4]),
 	                 .g_in3(g_wire[C_4]),
 	                 .p_in4(p_wire[C_5]),
 	                 .g_in4(g_wire[C_5]),
 	                 .p_in5(p_wire[C_6]),
 	                 .g_in5(g_wire[C_6]),
 	                 .c_in(c_in)
 	                 );
 endmodule                                      
