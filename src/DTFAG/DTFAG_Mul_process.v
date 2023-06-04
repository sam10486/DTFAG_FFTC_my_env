`include "define.v"
module DTFAG_Mul_process (
    input clk,
    input rst_n,
    input [1:0] FFT_stage_in,
    input [`D_width-1:0] ROM0_in0  ,
    input [`D_width-1:0] ROM0_in1  ,
    input [`D_width-1:0] ROM0_in2  ,
    input [`D_width-1:0] ROM0_in3  ,
    input [`D_width-1:0] ROM0_in4  ,
    input [`D_width-1:0] ROM0_in5  ,
    input [`D_width-1:0] ROM0_in6  ,
    input [`D_width-1:0] ROM0_in7  ,
    input [`D_width-1:0] ROM0_in8  ,
    input [`D_width-1:0] ROM0_in9  ,
    input [`D_width-1:0] ROM0_in10 ,
    input [`D_width-1:0] ROM0_in11 ,
    input [`D_width-1:0] ROM0_in12 ,
    input [`D_width-1:0] ROM0_in13 ,
    input [`D_width-1:0] ROM0_in14 ,
    input [`D_width-1:0] ROM0_in15 ,

    input [`D_width-1:0] ROM1_in0  ,
    input [`D_width-1:0] ROM1_in1  ,
    input [`D_width-1:0] ROM1_in2  ,
    input [`D_width-1:0] ROM1_in3  ,
    input [`D_width-1:0] ROM1_in4  ,
    input [`D_width-1:0] ROM1_in5  ,
    input [`D_width-1:0] ROM1_in6  ,
    input [`D_width-1:0] ROM1_in7  ,
    input [`D_width-1:0] ROM1_in8  ,
    input [`D_width-1:0] ROM1_in9  ,
    input [`D_width-1:0] ROM1_in10 ,
    input [`D_width-1:0] ROM1_in11 ,
    input [`D_width-1:0] ROM1_in12 ,
    input [`D_width-1:0] ROM1_in13 ,
    input [`D_width-1:0] ROM1_in14 ,
    input [`D_width-1:0] ROM1_in15 ,

    input [`D_width-1:0] ROM2_in0  ,
    input [`D_width-1:0] ROM2_in1  ,
    input [`D_width-1:0] ROM2_in2  ,
    input [`D_width-1:0] ROM2_in3  ,
    input [`D_width-1:0] ROM2_in4  ,
    input [`D_width-1:0] ROM2_in5  ,
    input [`D_width-1:0] ROM2_in6  ,
    input [`D_width-1:0] ROM2_in7  ,
    input [`D_width-1:0] ROM2_in8  ,
    input [`D_width-1:0] ROM2_in9  ,
    input [`D_width-1:0] ROM2_in10 ,
    input [`D_width-1:0] ROM2_in11 ,
    input [`D_width-1:0] ROM2_in12 ,
    input [`D_width-1:0] ROM2_in13 ,
    input [`D_width-1:0] ROM2_in14 ,
    input [`D_width-1:0] ROM2_in15 ,
    input [`D_width-1:0] N_in,

    output reg [`D_width-1:0] Process2_out0     ,
    output reg [`D_width-1:0] Process2_out1     ,
    output reg [`D_width-1:0] Process2_out2     ,
    output reg [`D_width-1:0] Process2_out3     ,
    output reg [`D_width-1:0] Process2_out4     ,
    output reg [`D_width-1:0] Process2_out5     ,
    output reg [`D_width-1:0] Process2_out6     ,
    output reg [`D_width-1:0] Process2_out7     ,
    output reg [`D_width-1:0] Process2_out8     ,
    output reg [`D_width-1:0] Process2_out9     ,
    output reg [`D_width-1:0] Process2_out10    ,
    output reg [`D_width-1:0] Process2_out11    ,
    output reg [`D_width-1:0] Process2_out12    ,
    output reg [`D_width-1:0] Process2_out13    ,
    output reg [`D_width-1:0] Process2_out14    ,
    output reg [`D_width-1:0] Process2_out15    

);  
    reg [`D_width-1:0] Proc1_ROM0_in1      ;
    reg [`D_width-1:0] Proc1_ROM0_in2      ;
    reg [`D_width-1:0] Proc1_ROM0_in3      ;
    reg [`D_width-1:0] Proc1_ROM0_in4      ;
    reg [`D_width-1:0] Proc1_ROM0_in5      ;
    reg [`D_width-1:0] Proc1_ROM0_in6      ;
    reg [`D_width-1:0] Proc1_ROM0_in7      ;
    reg [`D_width-1:0] Proc1_ROM0_in8      ;
    reg [`D_width-1:0] Proc1_ROM0_in9      ;
    reg [`D_width-1:0] Proc1_ROM0_in10     ;
    reg [`D_width-1:0] Proc1_ROM0_in11     ;
    reg [`D_width-1:0] Proc1_ROM0_in12     ;
    reg [`D_width-1:0] Proc1_ROM0_in13     ;
    reg [`D_width-1:0] Proc1_ROM0_in14     ;
    reg [`D_width-1:0] Proc1_ROM0_in15     ;
    
    reg [`D_width-1:0] Proc1_ROM1_in1      ;
    reg [`D_width-1:0] Proc1_ROM1_in2      ;
    reg [`D_width-1:0] Proc1_ROM1_in3      ;
    reg [`D_width-1:0] Proc1_ROM1_in4      ;
    reg [`D_width-1:0] Proc1_ROM1_in5      ;
    reg [`D_width-1:0] Proc1_ROM1_in6      ;
    reg [`D_width-1:0] Proc1_ROM1_in7      ;
    reg [`D_width-1:0] Proc1_ROM1_in8      ;
    reg [`D_width-1:0] Proc1_ROM1_in9      ;
    reg [`D_width-1:0] Proc1_ROM1_in10     ;
    reg [`D_width-1:0] Proc1_ROM1_in11     ;
    reg [`D_width-1:0] Proc1_ROM1_in12     ;
    reg [`D_width-1:0] Proc1_ROM1_in13     ;
    reg [`D_width-1:0] Proc1_ROM1_in14     ;
    reg [`D_width-1:0] Proc1_ROM1_in15     ;

    wire [`D_width-1:0] Process1_out1_tmp   ;
    wire [`D_width-1:0] Process1_out2_tmp   ;
    wire [`D_width-1:0] Process1_out3_tmp   ;
    wire [`D_width-1:0] Process1_out4_tmp   ;
    wire [`D_width-1:0] Process1_out5_tmp   ;
    wire [`D_width-1:0] Process1_out6_tmp   ;
    wire [`D_width-1:0] Process1_out7_tmp   ;
    wire [`D_width-1:0] Process1_out8_tmp   ;
    wire [`D_width-1:0] Process1_out9_tmp   ;
    wire [`D_width-1:0] Process1_out10_tmp  ;
    wire [`D_width-1:0] Process1_out11_tmp  ;
    wire [`D_width-1:0] Process1_out12_tmp  ;
    wire [`D_width-1:0] Process1_out13_tmp  ;
    wire [`D_width-1:0] Process1_out14_tmp  ;
    wire [`D_width-1:0] Process1_out15_tmp  ;

    reg [`D_width-1:0] Process1_out1   ;
    reg [`D_width-1:0] Process1_out2   ;
    reg [`D_width-1:0] Process1_out3   ;
    reg [`D_width-1:0] Process1_out4   ;
    reg [`D_width-1:0] Process1_out5   ;
    reg [`D_width-1:0] Process1_out6   ;
    reg [`D_width-1:0] Process1_out7   ;
    reg [`D_width-1:0] Process1_out8   ;
    reg [`D_width-1:0] Process1_out9   ;
    reg [`D_width-1:0] Process1_out10  ;
    reg [`D_width-1:0] Process1_out11  ;
    reg [`D_width-1:0] Process1_out12  ;
    reg [`D_width-1:0] Process1_out13  ;
    reg [`D_width-1:0] Process1_out14  ;
    reg [`D_width-1:0] Process1_out15  ;

    reg [`D_width-1:0] ROM2_in0_pip   [0:4];
    reg [`D_width-1:0] ROM2_in1_pip   [0:4];
    reg [`D_width-1:0] ROM2_in2_pip   [0:4];
    reg [`D_width-1:0] ROM2_in3_pip   [0:4];
    reg [`D_width-1:0] ROM2_in4_pip   [0:4];
    reg [`D_width-1:0] ROM2_in5_pip   [0:4];
    reg [`D_width-1:0] ROM2_in6_pip   [0:4];
    reg [`D_width-1:0] ROM2_in7_pip   [0:4];
    reg [`D_width-1:0] ROM2_in8_pip   [0:4];
    reg [`D_width-1:0] ROM2_in9_pip   [0:4];
    reg [`D_width-1:0] ROM2_in10_pip  [0:4];
    reg [`D_width-1:0] ROM2_in11_pip  [0:4];
    reg [`D_width-1:0] ROM2_in12_pip  [0:4];
    reg [`D_width-1:0] ROM2_in13_pip  [0:4];
    reg [`D_width-1:0] ROM2_in14_pip  [0:4];
    reg [`D_width-1:0] ROM2_in15_pip  [0:4];

    reg [`D_width-1:0] ROM2_in0_pip1   [0:3];

    wire [`D_width-1:0] Process2_out1_tmp   ;
    wire [`D_width-1:0] Process2_out2_tmp   ;
    wire [`D_width-1:0] Process2_out3_tmp   ;
    wire [`D_width-1:0] Process2_out4_tmp   ;
    wire [`D_width-1:0] Process2_out5_tmp   ;
    wire [`D_width-1:0] Process2_out6_tmp   ;
    wire [`D_width-1:0] Process2_out7_tmp   ;
    wire [`D_width-1:0] Process2_out8_tmp   ;
    wire [`D_width-1:0] Process2_out9_tmp   ;
    wire [`D_width-1:0] Process2_out10_tmp  ;
    wire [`D_width-1:0] Process2_out11_tmp  ;
    wire [`D_width-1:0] Process2_out12_tmp  ;
    wire [`D_width-1:0] Process2_out13_tmp  ;
    wire [`D_width-1:0] Process2_out14_tmp  ;
    wire [`D_width-1:0] Process2_out15_tmp  ;

    // ROM2 data pipeline
    always @(*) begin
        ROM2_in0_pip [0] = ROM2_in0    ;
        ROM2_in1_pip [0] = ROM2_in1    ;
        ROM2_in2_pip [0] = ROM2_in2    ;
        ROM2_in3_pip [0] = ROM2_in3    ;
        ROM2_in4_pip [0] = ROM2_in4    ;
        ROM2_in5_pip [0] = ROM2_in5    ;
        ROM2_in6_pip [0] = ROM2_in6    ;
        ROM2_in7_pip [0] = ROM2_in7    ;
        ROM2_in8_pip [0] = ROM2_in8    ;
        ROM2_in9_pip [0] = ROM2_in9    ;
        ROM2_in10_pip [0] = ROM2_in10  ;
        ROM2_in11_pip [0] = ROM2_in11  ;
        ROM2_in12_pip [0] = ROM2_in12  ;
        ROM2_in13_pip [0] = ROM2_in13  ;
        ROM2_in14_pip [0] = ROM2_in14  ;
        ROM2_in15_pip [0] = ROM2_in15  ;
    end

    always @(posedge clk or negedge rst_n) begin: ROM2_pip
        integer i;
        if (!rst_n) begin
            for (i = 0; i < 4 ; i = i + 1 ) begin
                ROM2_in0_pip [i+1] <= 64'd0    ;
                ROM2_in1_pip [i+1] <= 64'd0    ;
                ROM2_in2_pip [i+1] <= 64'd0    ;
                ROM2_in3_pip [i+1] <= 64'd0    ;
                ROM2_in4_pip [i+1] <= 64'd0    ;
                ROM2_in5_pip [i+1] <= 64'd0    ;
                ROM2_in6_pip [i+1] <= 64'd0    ;
                ROM2_in7_pip [i+1] <= 64'd0    ;
                ROM2_in8_pip [i+1] <= 64'd0    ;
                ROM2_in9_pip [i+1] <= 64'd0    ;
                ROM2_in10_pip[i+1] <= 64'd0    ;
                ROM2_in11_pip[i+1] <= 64'd0    ;
                ROM2_in12_pip[i+1] <= 64'd0    ;
                ROM2_in13_pip[i+1] <= 64'd0    ;
                ROM2_in14_pip[i+1] <= 64'd0    ;
                ROM2_in15_pip[i+1] <= 64'd0    ;
            end
        end else begin
            case (FFT_stage_in)
                2'd0: begin
                    for (i = 0; i < 4 ; i = i + 1 ) begin
                        ROM2_in0_pip [i+1] <= ROM2_in0_pip [i]    ;
                        ROM2_in1_pip [i+1] <= ROM2_in1_pip [i]    ;
                        ROM2_in2_pip [i+1] <= ROM2_in2_pip [i]    ;
                        ROM2_in3_pip [i+1] <= ROM2_in3_pip [i]    ;
                        ROM2_in4_pip [i+1] <= ROM2_in4_pip [i]    ;
                        ROM2_in5_pip [i+1] <= ROM2_in5_pip [i]    ;
                        ROM2_in6_pip [i+1] <= ROM2_in6_pip [i]    ;
                        ROM2_in7_pip [i+1] <= ROM2_in7_pip [i]    ;
                        ROM2_in8_pip [i+1] <= ROM2_in8_pip [i]    ;
                        ROM2_in9_pip [i+1] <= ROM2_in9_pip [i]    ;
                        ROM2_in10_pip[i+1] <= ROM2_in10_pip[i]    ;
                        ROM2_in11_pip[i+1] <= ROM2_in11_pip[i]    ;
                        ROM2_in12_pip[i+1] <= ROM2_in12_pip[i]    ;
                        ROM2_in13_pip[i+1] <= ROM2_in13_pip[i]    ;
                        ROM2_in14_pip[i+1] <= ROM2_in14_pip[i]    ;
                        ROM2_in15_pip[i+1] <= ROM2_in15_pip[i]    ;
                    end
                end
                default: begin
                    for (i = 0; i < 4 ; i = i + 1 ) begin
                        ROM2_in0_pip [i+1] <= 64'd1    ;
                        ROM2_in1_pip [i+1] <= 64'd1    ;
                        ROM2_in2_pip [i+1] <= 64'd1    ;
                        ROM2_in3_pip [i+1] <= 64'd1    ;
                        ROM2_in4_pip [i+1] <= 64'd1    ;
                        ROM2_in5_pip [i+1] <= 64'd1    ;
                        ROM2_in6_pip [i+1] <= 64'd1    ;
                        ROM2_in7_pip [i+1] <= 64'd1    ;
                        ROM2_in8_pip [i+1] <= 64'd1    ;
                        ROM2_in9_pip [i+1] <= 64'd1    ;
                        ROM2_in10_pip[i+1] <= 64'd1    ;
                        ROM2_in11_pip[i+1] <= 64'd1    ;
                        ROM2_in12_pip[i+1] <= 64'd1    ;
                        ROM2_in13_pip[i+1] <= 64'd1    ;
                        ROM2_in14_pip[i+1] <= 64'd1    ;
                        ROM2_in15_pip[i+1] <= 64'd1    ;
                    end
                end
            endcase
           
        end
    end

    always @(*) begin
        case (FFT_stage_in)
            2'd3: begin
                Proc1_ROM0_in1  = 64'd1 ;
                Proc1_ROM0_in2  = 64'd1 ;
                Proc1_ROM0_in3  = 64'd1 ;
                Proc1_ROM0_in4  = 64'd1 ;
                Proc1_ROM0_in5  = 64'd1 ;
                Proc1_ROM0_in6  = 64'd1 ;
                Proc1_ROM0_in7  = 64'd1 ;
                Proc1_ROM0_in8  = 64'd1 ;
                Proc1_ROM0_in9  = 64'd1 ;
                Proc1_ROM0_in10 = 64'd1 ;
                Proc1_ROM0_in11 = 64'd1 ;
                Proc1_ROM0_in12 = 64'd1 ;
                Proc1_ROM0_in13 = 64'd1 ;
                Proc1_ROM0_in14 = 64'd1 ;
                Proc1_ROM0_in15 = 64'd1 ;
            end 
            default: begin
                Proc1_ROM0_in1  = ROM0_in1  ;
                Proc1_ROM0_in2  = ROM0_in2  ;
                Proc1_ROM0_in3  = ROM0_in3  ;
                Proc1_ROM0_in4  = ROM0_in4  ;
                Proc1_ROM0_in5  = ROM0_in5  ;
                Proc1_ROM0_in6  = ROM0_in6  ;
                Proc1_ROM0_in7  = ROM0_in7  ;
                Proc1_ROM0_in8  = ROM0_in8  ;
                Proc1_ROM0_in9  = ROM0_in9  ;
                Proc1_ROM0_in10 = ROM0_in10 ;
                Proc1_ROM0_in11 = ROM0_in11 ;
                Proc1_ROM0_in12 = ROM0_in12 ;
                Proc1_ROM0_in13 = ROM0_in13 ;
                Proc1_ROM0_in14 = ROM0_in14 ;
                Proc1_ROM0_in15 = ROM0_in15 ;
            end
        endcase
    end

    always @(*) begin
        case (FFT_stage_in)
            2'd0: begin
                Proc1_ROM1_in1  = ROM1_in1  ;
                Proc1_ROM1_in2  = ROM1_in2  ;
                Proc1_ROM1_in3  = ROM1_in3  ;
                Proc1_ROM1_in4  = ROM1_in4  ;
                Proc1_ROM1_in5  = ROM1_in5  ;
                Proc1_ROM1_in6  = ROM1_in6  ;
                Proc1_ROM1_in7  = ROM1_in7  ;
                Proc1_ROM1_in8  = ROM1_in8  ;
                Proc1_ROM1_in9  = ROM1_in9  ;
                Proc1_ROM1_in10 = ROM1_in10 ;
                Proc1_ROM1_in11 = ROM1_in11 ;
                Proc1_ROM1_in12 = ROM1_in12 ;
                Proc1_ROM1_in13 = ROM1_in13 ;
                Proc1_ROM1_in14 = ROM1_in14 ;
                Proc1_ROM1_in15 = ROM1_in15 ;
            end
            2'd1: begin
                Proc1_ROM1_in1  = ROM1_in1  ;
                Proc1_ROM1_in2  = ROM1_in2  ;
                Proc1_ROM1_in3  = ROM1_in3  ;
                Proc1_ROM1_in4  = ROM1_in4  ;
                Proc1_ROM1_in5  = ROM1_in5  ;
                Proc1_ROM1_in6  = ROM1_in6  ;
                Proc1_ROM1_in7  = ROM1_in7  ;
                Proc1_ROM1_in8  = ROM1_in8  ;
                Proc1_ROM1_in9  = ROM1_in9  ;
                Proc1_ROM1_in10 = ROM1_in10 ;
                Proc1_ROM1_in11 = ROM1_in11 ;
                Proc1_ROM1_in12 = ROM1_in12 ;
                Proc1_ROM1_in13 = ROM1_in13 ;
                Proc1_ROM1_in14 = ROM1_in14 ;
                Proc1_ROM1_in15 = ROM1_in15 ;
            end
            default: begin
                Proc1_ROM1_in1  = 64'd1 ;
                Proc1_ROM1_in2  = 64'd1 ;
                Proc1_ROM1_in3  = 64'd1 ;
                Proc1_ROM1_in4  = 64'd1 ;
                Proc1_ROM1_in5  = 64'd1 ;
                Proc1_ROM1_in6  = 64'd1 ;
                Proc1_ROM1_in7  = 64'd1 ;
                Proc1_ROM1_in8  = 64'd1 ;
                Proc1_ROM1_in9  = 64'd1 ;
                Proc1_ROM1_in10 = 64'd1 ;
                Proc1_ROM1_in11 = 64'd1 ;
                Proc1_ROM1_in12 = 64'd1 ;
                Proc1_ROM1_in13 = 64'd1 ;
                Proc1_ROM1_in14 = 64'd1 ;
                Proc1_ROM1_in15 = 64'd1 ;
            end
        endcase
    end
    
    // Process 1 (v0 x v1)
    MulMod128 proc1_u1_Mul(
        .S_out(Process1_out1_tmp), 
        .A_in(Proc1_ROM0_in1),       
        .B_in(Proc1_ROM1_in1),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u2_Mul(
        .S_out(Process1_out2_tmp), 
        .A_in(Proc1_ROM0_in2),       
        .B_in(Proc1_ROM1_in2),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u3_Mul(
        .S_out(Process1_out3_tmp), 
        .A_in(Proc1_ROM0_in3),       
        .B_in(Proc1_ROM1_in3),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u4_Mul(
        .S_out(Process1_out4_tmp), 
        .A_in(Proc1_ROM0_in4),       
        .B_in(Proc1_ROM1_in4),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u5_Mul(
        .S_out(Process1_out5_tmp), 
        .A_in(Proc1_ROM0_in5),       
        .B_in(Proc1_ROM1_in5),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u6_Mul(
        .S_out(Process1_out6_tmp), 
        .A_in(Proc1_ROM0_in6),       
        .B_in(Proc1_ROM1_in6),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u7_Mul(
        .S_out(Process1_out7_tmp), 
        .A_in(Proc1_ROM0_in7),       
        .B_in(Proc1_ROM1_in7),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u8_Mul(
        .S_out(Process1_out8_tmp), 
        .A_in(Proc1_ROM0_in8),       
        .B_in(Proc1_ROM1_in8),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u9_Mul(
        .S_out(Process1_out9_tmp), 
        .A_in(Proc1_ROM0_in9),       
        .B_in(Proc1_ROM1_in9),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u10_Mul(
        .S_out(Process1_out10_tmp), 
        .A_in(Proc1_ROM0_in10),       
        .B_in(Proc1_ROM1_in10),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u11_Mul(
        .S_out(Process1_out11_tmp), 
        .A_in(Proc1_ROM0_in11),       
        .B_in(Proc1_ROM1_in11),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u12_Mul(
        .S_out(Process1_out12_tmp), 
        .A_in(Proc1_ROM0_in12),       
        .B_in(Proc1_ROM1_in12),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u13_Mul(
        .S_out(Process1_out13_tmp), 
        .A_in(Proc1_ROM0_in13),       
        .B_in(Proc1_ROM1_in13),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u14_Mul(
        .S_out(Process1_out14_tmp), 
        .A_in(Proc1_ROM0_in14),       
        .B_in(Proc1_ROM1_in14),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc1_u15_Mul(
        .S_out(Process1_out15_tmp), 
        .A_in(Proc1_ROM0_in15),       
        .B_in(Proc1_ROM1_in15),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );

    always @( posedge clk or negedge rst_n ) begin
        if (~rst_n) begin
            Process1_out1   <= 64'd0    ;
            Process1_out2   <= 64'd0    ;
            Process1_out3   <= 64'd0    ;
            Process1_out4   <= 64'd0    ;
            Process1_out5   <= 64'd0    ;
            Process1_out6   <= 64'd0    ;
            Process1_out7   <= 64'd0    ;
            Process1_out8   <= 64'd0    ;
            Process1_out9   <= 64'd0    ;
            Process1_out10  <= 64'd0    ;
            Process1_out11  <= 64'd0    ;
            Process1_out12  <= 64'd0    ;
            Process1_out13  <= 64'd0    ;
            Process1_out14  <= 64'd0    ;
            Process1_out15  <= 64'd0    ;
        end else begin
            Process1_out1   <= Process1_out1_tmp     ;
            Process1_out2   <= Process1_out2_tmp     ;
            Process1_out3   <= Process1_out3_tmp     ;
            Process1_out4   <= Process1_out4_tmp     ;
            Process1_out5   <= Process1_out5_tmp     ;
            Process1_out6   <= Process1_out6_tmp     ;
            Process1_out7   <= Process1_out7_tmp     ;
            Process1_out8   <= Process1_out8_tmp     ;
            Process1_out9   <= Process1_out9_tmp     ;
            Process1_out10  <= Process1_out10_tmp    ;
            Process1_out11  <= Process1_out11_tmp    ;
            Process1_out12  <= Process1_out12_tmp    ;
            Process1_out13  <= Process1_out13_tmp    ;
            Process1_out14  <= Process1_out14_tmp    ;
            Process1_out15  <= Process1_out15_tmp    ;
        end
    end

    // Process 2 (v0 x v1) x v2
    MulMod128 proc2_u1_Mul(
        .S_out(Process2_out1_tmp), 
        .A_in(Process1_out1),       
        .B_in(ROM2_in1_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u2_Mul(
        .S_out(Process2_out2_tmp), 
        .A_in(Process1_out2),       
        .B_in(ROM2_in2_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u3_Mul(
        .S_out(Process2_out3_tmp), 
        .A_in(Process1_out3),       
        .B_in(ROM2_in3_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u4_Mul(
        .S_out(Process2_out4_tmp), 
        .A_in(Process1_out4),       
        .B_in(ROM2_in4_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u5_Mul(
        .S_out(Process2_out5_tmp), 
        .A_in(Process1_out5),       
        .B_in(ROM2_in5_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u6_Mul(
        .S_out(Process2_out6_tmp), 
        .A_in(Process1_out6),       
        .B_in(ROM2_in6_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u7_Mul(
        .S_out(Process2_out7_tmp), 
        .A_in(Process1_out7),       
        .B_in(ROM2_in7_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u8_Mul(
        .S_out(Process2_out8_tmp), 
        .A_in(Process1_out8),       
        .B_in(ROM2_in8_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u9_Mul(
        .S_out(Process2_out9_tmp), 
        .A_in(Process1_out9),       
        .B_in(ROM2_in9_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u10_Mul(
        .S_out(Process2_out10_tmp), 
        .A_in(Process1_out10),       
        .B_in(ROM2_in10_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u11_Mul(
        .S_out(Process2_out11_tmp), 
        .A_in(Process1_out11),       
        .B_in(ROM2_in11_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u12_Mul(
        .S_out(Process2_out12_tmp), 
        .A_in(Process1_out12),       
        .B_in(ROM2_in12_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u13_Mul(
        .S_out(Process2_out13_tmp), 
        .A_in(Process1_out13),       
        .B_in(ROM2_in13_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u14_Mul(
        .S_out(Process2_out14_tmp), 
        .A_in(Process1_out14),       
        .B_in(ROM2_in14_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );
    MulMod128 proc2_u15_Mul(
        .S_out(Process2_out15_tmp), 
        .A_in(Process1_out15),       
        .B_in(ROM2_in15_pip[4]),        
        .N_in(N_in),         
        .rst_n(rst_n),            
        .clk(clk)                
    );

    always @(*) begin
        ROM2_in0_pip1[0] = ROM2_in0_pip[4];
    end
    always @(posedge clk or negedge rst_n) begin: ROM2_data0_pip1
        integer i;
        if (!rst_n) begin
            for (i = 0; i<3 ; i=i+1) begin
                ROM2_in0_pip1[i+1] <= 64'd0;
            end
        end else begin
            for (i = 0; i<3 ; i=i+1) begin
                ROM2_in0_pip1[i+1] <= ROM2_in0_pip1[i];
            end
        end
    end

    always @( posedge clk or negedge rst_n ) begin
        if (~rst_n) begin
            Process2_out0   <= 64'd0    ;
            Process2_out1   <= 64'd0    ;
            Process2_out2   <= 64'd0    ;
            Process2_out3   <= 64'd0    ;
            Process2_out4   <= 64'd0    ;
            Process2_out5   <= 64'd0    ;
            Process2_out6   <= 64'd0    ;
            Process2_out7   <= 64'd0    ;
            Process2_out8   <= 64'd0    ;
            Process2_out9   <= 64'd0    ;
            Process2_out10  <= 64'd0    ;
            Process2_out11  <= 64'd0    ;
            Process2_out12  <= 64'd0    ;
            Process2_out13  <= 64'd0    ;
            Process2_out14  <= 64'd0    ;
            Process2_out15  <= 64'd0    ;
        end else begin
            Process2_out0   <= ROM2_in0_pip1[3]      ;
            Process2_out1   <= Process2_out1_tmp     ;
            Process2_out2   <= Process2_out2_tmp     ;
            Process2_out3   <= Process2_out3_tmp     ;
            Process2_out4   <= Process2_out4_tmp     ;
            Process2_out5   <= Process2_out5_tmp     ;
            Process2_out6   <= Process2_out6_tmp     ;
            Process2_out7   <= Process2_out7_tmp     ;
            Process2_out8   <= Process2_out8_tmp     ;
            Process2_out9   <= Process2_out9_tmp     ;
            Process2_out10  <= Process2_out10_tmp    ;
            Process2_out11  <= Process2_out11_tmp    ;
            Process2_out12  <= Process2_out12_tmp    ;
            Process2_out13  <= Process2_out13_tmp    ;
            Process2_out14  <= Process2_out14_tmp    ;
            Process2_out15  <= Process2_out15_tmp    ;
        end
    end    

endmodule