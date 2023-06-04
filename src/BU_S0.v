`timescale 1ns/1ps                           
module BU_S0(R0_out, //add                   
             R1_out, //sub                   
             R0_in,                          
             R1_in                           
             );                              
parameter D_WIDTH = 192;                     
parameter P_WIDTH = 64;                      
                                             
output [D_WIDTH-1:0] R0_out;                 
output [D_WIDTH-1:0] R1_out;                 
                                             
input  [P_WIDTH-1:0] R0_in;                  
input  [P_WIDTH-1:0] R1_in;                  
                                             
assign R0_out = R0_in + R1_in;               
assign R1_out = {32'd0,R1_in,32'd0,R0_in};   
                                             
endmodule                                    
