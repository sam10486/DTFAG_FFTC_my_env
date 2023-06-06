 `timescale 1ns/1ps                                                 
 module BU(R0_out, //add                                            
           R1_out, //sub                                            
           R0_in,                                                   
           R1_in,
           N_in                                                    
           );                                                       
 parameter D_WIDTH = 64; 
                                                                    
 output [D_WIDTH-1:0] R0_out;                                       
 output [D_WIDTH-1:0] R1_out;                                       
 input  [D_WIDTH-1:0] R0_in;                                        
 input  [D_WIDTH-1:0] R1_in;          
 input  [D_WIDTH-1:0] N_in;                                   
                                                                    
 wire   [D_WIDTH:0]   Result_add;   
 wire   [D_WIDTH:0]   Result_add_; 
 wire   [D_WIDTH:0]   Result_sub; 
 wire   [D_WIDTH:0]   Result_sub_;  
 wire   [D_WIDTH-1:0] R1_in_Complement;                             
                                                                    
 assign R1_in_Complement = N_in - R1_in;             
 assign Result_add = R0_in + R1_in;                                 
 assign Result_sub = R0_in + R1_in_Complement;   
 assign Result_add_ = Result_add - N_in;
 assign Result_sub_ = Result_sub - N_in;
 //output                                                           
 assign R0_out = (Result_add_[D_WIDTH] == 1'b1) ? Result_add : Result_add_;     
 assign R1_out = (Result_sub_[D_WIDTH] == 1'b1) ? Result_sub : Result_sub_;     
                                                                    
 endmodule                                                          
