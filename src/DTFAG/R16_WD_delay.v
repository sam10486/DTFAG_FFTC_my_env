`include "define.v"
module R16_WD_delay (
    input clk,
    input rst_n,

    input [`D_width-1:0] R16_WD_delay_in0   ,
    input [`D_width-1:0] R16_WD_delay_in1   ,
    input [`D_width-1:0] R16_WD_delay_in2   ,
    input [`D_width-1:0] R16_WD_delay_in3   ,
    input [`D_width-1:0] R16_WD_delay_in4   ,
    input [`D_width-1:0] R16_WD_delay_in5   ,
    input [`D_width-1:0] R16_WD_delay_in6   ,
    input [`D_width-1:0] R16_WD_delay_in7   ,
    input [`D_width-1:0] R16_WD_delay_in8   ,
    input [`D_width-1:0] R16_WD_delay_in9   ,
    input [`D_width-1:0] R16_WD_delay_in10  ,
    input [`D_width-1:0] R16_WD_delay_in11  ,
    input [`D_width-1:0] R16_WD_delay_in12  ,
    input [`D_width-1:0] R16_WD_delay_in13  ,
    input [`D_width-1:0] R16_WD_delay_in14  ,
    input [`D_width-1:0] R16_WD_delay_in15  ,

    output [`D_width-1:0] R16_WD_delay_out0   ,
    output [`D_width-1:0] R16_WD_delay_out1   ,
    output [`D_width-1:0] R16_WD_delay_out2   ,
    output [`D_width-1:0] R16_WD_delay_out3   ,
    output [`D_width-1:0] R16_WD_delay_out4   ,
    output [`D_width-1:0] R16_WD_delay_out5   ,
    output [`D_width-1:0] R16_WD_delay_out6   ,
    output [`D_width-1:0] R16_WD_delay_out7   ,
    output [`D_width-1:0] R16_WD_delay_out8   ,
    output [`D_width-1:0] R16_WD_delay_out9   ,
    output [`D_width-1:0] R16_WD_delay_out10  ,
    output [`D_width-1:0] R16_WD_delay_out11  ,
    output [`D_width-1:0] R16_WD_delay_out12  ,
    output [`D_width-1:0] R16_WD_delay_out13  ,
    output [`D_width-1:0] R16_WD_delay_out14  ,
    output [`D_width-1:0] R16_WD_delay_out15  
);

    reg [`D_width-1:0] R16_WD_pip0  [0:21]    ;     
    reg [`D_width-1:0] R16_WD_pip1  [0:21]    ;     
    reg [`D_width-1:0] R16_WD_pip2  [0:21]    ;     
    reg [`D_width-1:0] R16_WD_pip3  [0:21]    ;     
    reg [`D_width-1:0] R16_WD_pip4  [0:21]    ;     
    reg [`D_width-1:0] R16_WD_pip5  [0:21]    ;     
    reg [`D_width-1:0] R16_WD_pip6  [0:21]    ;     
    reg [`D_width-1:0] R16_WD_pip7  [0:21]    ;     
    reg [`D_width-1:0] R16_WD_pip8  [0:21]    ;     
    reg [`D_width-1:0] R16_WD_pip9  [0:21]    ;     
    reg [`D_width-1:0] R16_WD_pip10 [0:21]    ;
    reg [`D_width-1:0] R16_WD_pip11 [0:21]    ;
    reg [`D_width-1:0] R16_WD_pip12 [0:21]    ;
    reg [`D_width-1:0] R16_WD_pip13 [0:21]    ;
    reg [`D_width-1:0] R16_WD_pip14 [0:21]    ;
    reg [`D_width-1:0] R16_WD_pip15 [0:21]    ;

    always @(*) begin
        R16_WD_pip0 [0] = R16_WD_delay_in0   ;
        R16_WD_pip1 [0] = R16_WD_delay_in1   ;
        R16_WD_pip2 [0] = R16_WD_delay_in2   ;
        R16_WD_pip3 [0] = R16_WD_delay_in3   ;
        R16_WD_pip4 [0] = R16_WD_delay_in4   ;
        R16_WD_pip5 [0] = R16_WD_delay_in5   ;
        R16_WD_pip6 [0] = R16_WD_delay_in6   ;
        R16_WD_pip7 [0] = R16_WD_delay_in7   ;
        R16_WD_pip8 [0] = R16_WD_delay_in8   ;
        R16_WD_pip9 [0] = R16_WD_delay_in9   ;
        R16_WD_pip10[0] = R16_WD_delay_in10  ;
        R16_WD_pip11[0] = R16_WD_delay_in11  ;
        R16_WD_pip12[0] = R16_WD_delay_in12  ;
        R16_WD_pip13[0] = R16_WD_delay_in13  ;
        R16_WD_pip14[0] = R16_WD_delay_in14  ;
        R16_WD_pip15[0] = R16_WD_delay_in15  ;
    end

    always @(posedge clk or negedge rst_n) begin:delay
        integer i;
        if (~rst_n) begin
            for (i = 0; i<21; i=i+1) begin
                R16_WD_pip0 [i+1] <= 64'd0;
                R16_WD_pip1 [i+1] <= 64'd0;
                R16_WD_pip2 [i+1] <= 64'd0;
                R16_WD_pip3 [i+1] <= 64'd0;
                R16_WD_pip4 [i+1] <= 64'd0;
                R16_WD_pip5 [i+1] <= 64'd0;
                R16_WD_pip6 [i+1] <= 64'd0;
                R16_WD_pip7 [i+1] <= 64'd0;
                R16_WD_pip8 [i+1] <= 64'd0;
                R16_WD_pip9 [i+1] <= 64'd0;
                R16_WD_pip10[i+1] <= 64'd0;
                R16_WD_pip11[i+1] <= 64'd0;
                R16_WD_pip12[i+1] <= 64'd0;
                R16_WD_pip13[i+1] <= 64'd0;
                R16_WD_pip14[i+1] <= 64'd0;
                R16_WD_pip15[i+1] <= 64'd0;
            end
        end else begin
            for (i = 0; i<21; i=i+1) begin
                R16_WD_pip0 [i+1] <= R16_WD_pip0 [i];
                R16_WD_pip1 [i+1] <= R16_WD_pip1 [i];
                R16_WD_pip2 [i+1] <= R16_WD_pip2 [i];
                R16_WD_pip3 [i+1] <= R16_WD_pip3 [i];
                R16_WD_pip4 [i+1] <= R16_WD_pip4 [i];
                R16_WD_pip5 [i+1] <= R16_WD_pip5 [i];
                R16_WD_pip6 [i+1] <= R16_WD_pip6 [i];
                R16_WD_pip7 [i+1] <= R16_WD_pip7 [i];
                R16_WD_pip8 [i+1] <= R16_WD_pip8 [i];
                R16_WD_pip9 [i+1] <= R16_WD_pip9 [i];
                R16_WD_pip10[i+1] <= R16_WD_pip10[i];
                R16_WD_pip11[i+1] <= R16_WD_pip11[i];
                R16_WD_pip12[i+1] <= R16_WD_pip12[i];
                R16_WD_pip13[i+1] <= R16_WD_pip13[i];
                R16_WD_pip14[i+1] <= R16_WD_pip14[i];
                R16_WD_pip15[i+1] <= R16_WD_pip15[i];
            end
        end
    end

    assign R16_WD_delay_out0  = R16_WD_pip0 [21]    ;
    assign R16_WD_delay_out1  = R16_WD_pip1 [21]    ;
    assign R16_WD_delay_out2  = R16_WD_pip2 [21]    ;
    assign R16_WD_delay_out3  = R16_WD_pip3 [21]    ;
    assign R16_WD_delay_out4  = R16_WD_pip4 [21]    ;
    assign R16_WD_delay_out5  = R16_WD_pip5 [21]    ;
    assign R16_WD_delay_out6  = R16_WD_pip6 [21]    ;
    assign R16_WD_delay_out7  = R16_WD_pip7 [21]    ;
    assign R16_WD_delay_out8  = R16_WD_pip8 [21]    ;
    assign R16_WD_delay_out9  = R16_WD_pip9 [21]    ;
    assign R16_WD_delay_out10 = R16_WD_pip10[21]    ;
    assign R16_WD_delay_out11 = R16_WD_pip11[21]    ;
    assign R16_WD_delay_out12 = R16_WD_pip12[21]    ;
    assign R16_WD_delay_out13 = R16_WD_pip13[21]    ;
    assign R16_WD_delay_out14 = R16_WD_pip14[21]    ;
    assign R16_WD_delay_out15 = R16_WD_pip15[21]    ;

    
endmodule