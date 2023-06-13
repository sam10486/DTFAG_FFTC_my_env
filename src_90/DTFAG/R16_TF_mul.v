`include "define.v"
module R16_TF_mul (
    input clk,
    input rst_n,
    input [`D_width-1:0] N_in,
    input [`D_width-1:0] R16_delay_in0  ,
    input [`D_width-1:0] R16_delay_in1  ,
    input [`D_width-1:0] R16_delay_in2  ,
    input [`D_width-1:0] R16_delay_in3  ,
    input [`D_width-1:0] R16_delay_in4  ,
    input [`D_width-1:0] R16_delay_in5  ,
    input [`D_width-1:0] R16_delay_in6  ,
    input [`D_width-1:0] R16_delay_in7  ,
    input [`D_width-1:0] R16_delay_in8  ,
    input [`D_width-1:0] R16_delay_in9  ,
    input [`D_width-1:0] R16_delay_in10 ,
    input [`D_width-1:0] R16_delay_in11 ,
    input [`D_width-1:0] R16_delay_in12 ,
    input [`D_width-1:0] R16_delay_in13 ,
    input [`D_width-1:0] R16_delay_in14 ,
    input [`D_width-1:0] R16_delay_in15 ,

    input [`D_width-1:0] TF_in0     ,
    input [`D_width-1:0] TF_in1     ,
    input [`D_width-1:0] TF_in2     ,
    input [`D_width-1:0] TF_in3     ,
    input [`D_width-1:0] TF_in4     ,
    input [`D_width-1:0] TF_in5     ,
    input [`D_width-1:0] TF_in6     ,
    input [`D_width-1:0] TF_in7     ,
    input [`D_width-1:0] TF_in8     ,
    input [`D_width-1:0] TF_in9     ,
    input [`D_width-1:0] TF_in10    ,
    input [`D_width-1:0] TF_in11    ,
    input [`D_width-1:0] TF_in12    ,
    input [`D_width-1:0] TF_in13    ,
    input [`D_width-1:0] TF_in14    ,
    input [`D_width-1:0] TF_in15    ,
    // output
    output [`D_width-1:0] R16_TF_Mul_out0     ,
    output [`D_width-1:0] R16_TF_Mul_out1     ,
    output [`D_width-1:0] R16_TF_Mul_out2     ,
    output [`D_width-1:0] R16_TF_Mul_out3     ,
    output [`D_width-1:0] R16_TF_Mul_out4     ,
    output [`D_width-1:0] R16_TF_Mul_out5     ,
    output [`D_width-1:0] R16_TF_Mul_out6     ,
    output [`D_width-1:0] R16_TF_Mul_out7     ,
    output [`D_width-1:0] R16_TF_Mul_out8     ,
    output [`D_width-1:0] R16_TF_Mul_out9     ,
    output [`D_width-1:0] R16_TF_Mul_out10    ,
    output [`D_width-1:0] R16_TF_Mul_out11    ,
    output [`D_width-1:0] R16_TF_Mul_out12    ,
    output [`D_width-1:0] R16_TF_Mul_out13    ,
    output [`D_width-1:0] R16_TF_Mul_out14    ,
    output [`D_width-1:0] R16_TF_Mul_out15    
    
);

    MulMod128 R16_TF_Mul_0(
        .S_out(R16_TF_Mul_out0), 
        .A_in(R16_delay_in0),       
        .B_in(TF_in0),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    
    MulMod128 R16_TF_Mul_1(
        .S_out(R16_TF_Mul_out1), 
        .A_in(R16_delay_in1),       
        .B_in(TF_in1),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_2(
        .S_out(R16_TF_Mul_out2), 
        .A_in(R16_delay_in2),       
        .B_in(TF_in2),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_3(
        .S_out(R16_TF_Mul_out3), 
        .A_in(R16_delay_in3),       
        .B_in(TF_in3),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_4(
        .S_out(R16_TF_Mul_out4), 
        .A_in(R16_delay_in4),       
        .B_in(TF_in4),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_5(
        .S_out(R16_TF_Mul_out5), 
        .A_in(R16_delay_in5),       
        .B_in(TF_in5),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_6(
        .S_out(R16_TF_Mul_out6), 
        .A_in(R16_delay_in6),       
        .B_in(TF_in6),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_7(
        .S_out(R16_TF_Mul_out7), 
        .A_in(R16_delay_in7),       
        .B_in(TF_in7),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_8(
        .S_out(R16_TF_Mul_out8), 
        .A_in(R16_delay_in8),       
        .B_in(TF_in8),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_9(
        .S_out(R16_TF_Mul_out9), 
        .A_in(R16_delay_in9),       
        .B_in(TF_in9),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_10(
        .S_out(R16_TF_Mul_out10), 
        .A_in(R16_delay_in10),       
        .B_in(TF_in10),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_11(
        .S_out(R16_TF_Mul_out11), 
        .A_in(R16_delay_in11),       
        .B_in(TF_in11),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_12(
        .S_out(R16_TF_Mul_out12), 
        .A_in(R16_delay_in12),       
        .B_in(TF_in12),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_13(
        .S_out(R16_TF_Mul_out13), 
        .A_in(R16_delay_in13),       
        .B_in(TF_in13),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_14(
        .S_out(R16_TF_Mul_out14), 
        .A_in(R16_delay_in14),       
        .B_in(TF_in14),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 R16_TF_Mul_15(
        .S_out(R16_TF_Mul_out15), 
        .A_in(R16_delay_in15),       
        .B_in(TF_in15),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );

    
endmodule