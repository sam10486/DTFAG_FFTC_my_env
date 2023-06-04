`timescale 1ns/1ps         
module Pipe(R0_out,        
             R1_out,       
             R2_out,       
             R3_out,       
             R4_out,       
             R5_out,       
             R6_out,       
             R7_out,       
             R8_out,       
             R9_out,       
             R10_out,      
             R11_out,      
             R12_out,      
             R13_out,      
             R14_out,      
             R15_out,      
             R0_in,        
             R1_in,        
             R2_in,        
             R3_in,        
             R4_in,        
             R5_in,        
             R6_in,        
             R7_in,        
             R8_in,        
             R9_in,        
             R10_in,       
             R11_in,       
             R12_in,       
             R13_in,       
             R14_in,       
             R15_in,       
             clk,          
             rst_n         
            );             
 parameter D_WIDTH = 192;        
 parameter D_ZERO  = 192'd0;     
 output [D_WIDTH-1:0] R0_out;    
 output [D_WIDTH-1:0] R1_out;    
 output [D_WIDTH-1:0] R2_out;    
 output [D_WIDTH-1:0] R3_out;    
 output [D_WIDTH-1:0] R4_out;    
 output [D_WIDTH-1:0] R5_out;    
 output [D_WIDTH-1:0] R6_out;    
 output [D_WIDTH-1:0] R7_out;    
 output [D_WIDTH-1:0] R8_out;    
 output [D_WIDTH-1:0] R9_out;    
 output [D_WIDTH-1:0] R10_out;   
 output [D_WIDTH-1:0] R11_out;   
 output [D_WIDTH-1:0] R12_out;   
 output [D_WIDTH-1:0] R13_out;   
 output [D_WIDTH-1:0] R14_out;   
 output [D_WIDTH-1:0] R15_out;   
 input  [D_WIDTH-1:0] R0_in;     
 input  [D_WIDTH-1:0] R1_in;     
 input  [D_WIDTH-1:0] R2_in;     
 input  [D_WIDTH-1:0] R3_in;     
 input  [D_WIDTH-1:0] R4_in;     
 input  [D_WIDTH-1:0] R5_in;     
 input  [D_WIDTH-1:0] R6_in;     
 input  [D_WIDTH-1:0] R7_in;     
 input  [D_WIDTH-1:0] R8_in;     
 input  [D_WIDTH-1:0] R9_in;     
 input  [D_WIDTH-1:0] R10_in;    
 input  [D_WIDTH-1:0] R11_in;    
 input  [D_WIDTH-1:0] R12_in;    
 input  [D_WIDTH-1:0] R13_in;    
 input  [D_WIDTH-1:0] R14_in;    
 input  [D_WIDTH-1:0] R15_in;    
 input                clk;       
 input                rst_n;     
                                 
 reg [D_WIDTH-1:0] R0_out;       
 reg [D_WIDTH-1:0] R1_out;       
 reg [D_WIDTH-1:0] R2_out;       
 reg [D_WIDTH-1:0] R3_out;       
 reg [D_WIDTH-1:0] R4_out;       
 reg [D_WIDTH-1:0] R5_out;       
 reg [D_WIDTH-1:0] R6_out;       
 reg [D_WIDTH-1:0] R7_out;       
 reg [D_WIDTH-1:0] R8_out;       
 reg [D_WIDTH-1:0] R9_out;       
 reg [D_WIDTH-1:0] R10_out;      
 reg [D_WIDTH-1:0] R11_out;      
 reg [D_WIDTH-1:0] R12_out;      
 reg [D_WIDTH-1:0] R13_out;      
 reg [D_WIDTH-1:0] R14_out;      
 reg [D_WIDTH-1:0] R15_out;	  
                                 
 always@(posedge clk)begin       
   if(~rst_n)begin               
     R0_out  <= D_ZERO;          
     R1_out  <= D_ZERO;          
     R2_out  <= D_ZERO;          
     R3_out  <= D_ZERO;          
     R4_out  <= D_ZERO;          
     R5_out  <= D_ZERO;          
     R6_out  <= D_ZERO;          
     R7_out  <= D_ZERO;          
     R8_out  <= D_ZERO;          
     R9_out  <= D_ZERO;          
     R10_out <= D_ZERO;          
     R11_out <= D_ZERO;          
     R12_out <= D_ZERO;          
     R13_out <= D_ZERO;          
     R14_out <= D_ZERO;          
     R15_out <= D_ZERO;          
   end                           
   else begin                    
     R0_out  <= R0_in;           
     R1_out  <= R1_in;           
     R2_out  <= R2_in;           
     R3_out  <= R3_in;           
     R4_out  <= R4_in;           
     R5_out  <= R5_in;           
     R6_out  <= R6_in;           
     R7_out  <= R7_in;           
     R8_out  <= R8_in;           
     R9_out  <= R9_in;           
     R10_out <= R10_in;          
     R11_out <= R11_in;          
     R12_out <= R12_in;          
     R13_out <= R13_in;          
     R14_out <= R14_in;          
     R15_out <= R15_in;          
   end                           
 end                             
                                 
endmodule 	                      
