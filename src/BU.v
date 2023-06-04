 `timescale 1ns/1ps                                                 
 module BU(R0_out, //add                                            
           R1_out, //sub                                            
           R0_in,                                                   
           R1_in                                                    
           );                                                       
 parameter D_WIDTH = 192;                                           
                                                                    
 output [D_WIDTH-1:0] R0_out;                                       
 output [D_WIDTH-1:0] R1_out;                                       
 input  [D_WIDTH-1:0] R0_in;                                        
 input  [D_WIDTH-1:0] R1_in;                                        
                                                                    
 wire   [D_WIDTH:0]   Result_add;                                   
 wire   [D_WIDTH:0]   Result_sub;                                   
 wire   [D_WIDTH-1:0] R1_in_Complement;                             
                                                                    
 assign R1_in_Complement = {R1_in[95:0],R1_in[191:96]};             
 assign Result_add = R0_in + R1_in;                                 
 assign Result_sub = R0_in + R1_in_Complement;                      
 //output                                                           
 assign R0_out = Result_add[D_WIDTH-1:0] + Result_add[D_WIDTH];     
 assign R1_out = Result_sub[D_WIDTH-1:0] + Result_sub[D_WIDTH];     
                                                                    
 endmodule                                                          
