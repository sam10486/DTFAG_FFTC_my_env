`include "define.v"
module R16_input_delay (
    input rst_n,
    input clk,
    input [`D_width-1:0] data_in0   ,
    input [`D_width-1:0] data_in1   ,
    input [`D_width-1:0] data_in2   ,
    input [`D_width-1:0] data_in3   ,
    input [`D_width-1:0] data_in4   ,
    input [`D_width-1:0] data_in5   ,
    input [`D_width-1:0] data_in6   ,
    input [`D_width-1:0] data_in7   ,
    input [`D_width-1:0] data_in8   ,
    input [`D_width-1:0] data_in9   ,
    input [`D_width-1:0] data_in10  ,
    input [`D_width-1:0] data_in11  ,
    input [`D_width-1:0] data_in12  ,
    input [`D_width-1:0] data_in13  ,
    input [`D_width-1:0] data_in14  ,
    input [`D_width-1:0] data_in15  ,

    output [`D_width-1:0] R16_out_delay_data0   ,
    output [`D_width-1:0] R16_out_delay_data1   ,
    output [`D_width-1:0] R16_out_delay_data2   ,
    output [`D_width-1:0] R16_out_delay_data3   ,
    output [`D_width-1:0] R16_out_delay_data4   ,
    output [`D_width-1:0] R16_out_delay_data5   ,
    output [`D_width-1:0] R16_out_delay_data6   ,
    output [`D_width-1:0] R16_out_delay_data7   ,
    output [`D_width-1:0] R16_out_delay_data8   ,
    output [`D_width-1:0] R16_out_delay_data9   ,
    output [`D_width-1:0] R16_out_delay_data10  ,
    output [`D_width-1:0] R16_out_delay_data11  ,
    output [`D_width-1:0] R16_out_delay_data12  ,
    output [`D_width-1:0] R16_out_delay_data13  ,
    output [`D_width-1:0] R16_out_delay_data14  ,
    output [`D_width-1:0] R16_out_delay_data15  

);

    reg [`D_width-1:0] R16_delay_arr_d0  [0:2]   ;
    reg [`D_width-1:0] R16_delay_arr_d1  [0:2]   ;
    reg [`D_width-1:0] R16_delay_arr_d2  [0:2]   ;
    reg [`D_width-1:0] R16_delay_arr_d3  [0:2]   ;
    reg [`D_width-1:0] R16_delay_arr_d4  [0:2]   ;
    reg [`D_width-1:0] R16_delay_arr_d5  [0:2]   ;
    reg [`D_width-1:0] R16_delay_arr_d6  [0:2]   ;
    reg [`D_width-1:0] R16_delay_arr_d7  [0:2]   ;
    reg [`D_width-1:0] R16_delay_arr_d8  [0:2]   ;
    reg [`D_width-1:0] R16_delay_arr_d9  [0:2]   ;
    reg [`D_width-1:0] R16_delay_arr_d10 [0:2]  ;
    reg [`D_width-1:0] R16_delay_arr_d11 [0:2]  ;
    reg [`D_width-1:0] R16_delay_arr_d12 [0:2]  ;
    reg [`D_width-1:0] R16_delay_arr_d13 [0:2]  ;
    reg [`D_width-1:0] R16_delay_arr_d14 [0:2]  ;
    reg [`D_width-1:0] R16_delay_arr_d15 [0:2]  ;

    always @(*) begin
        R16_delay_arr_d0 [0]   = data_in0 ;
        R16_delay_arr_d1 [0]   = data_in1 ;
        R16_delay_arr_d2 [0]   = data_in2 ;
        R16_delay_arr_d3 [0]   = data_in3 ;
        R16_delay_arr_d4 [0]   = data_in4 ;
        R16_delay_arr_d5 [0]   = data_in5 ;
        R16_delay_arr_d6 [0]   = data_in6 ;
        R16_delay_arr_d7 [0]   = data_in7 ;
        R16_delay_arr_d8 [0]   = data_in8 ;
        R16_delay_arr_d9 [0]   = data_in9 ;
        R16_delay_arr_d10[0]   = data_in10;
        R16_delay_arr_d11[0]   = data_in11;
        R16_delay_arr_d12[0]   = data_in12;
        R16_delay_arr_d13[0]   = data_in13;
        R16_delay_arr_d14[0]   = data_in14;
        R16_delay_arr_d15[0]   = data_in15;
    end

    always @(posedge clk or negedge rst_n) begin: delay
        integer i;
        if (~rst_n) begin
            for (i = 0; i<2; i=i+1) begin
                R16_delay_arr_d0 [i+1] <= 64'd0;
                R16_delay_arr_d1 [i+1] <= 64'd0;
                R16_delay_arr_d2 [i+1] <= 64'd0;
                R16_delay_arr_d3 [i+1] <= 64'd0;
                R16_delay_arr_d4 [i+1] <= 64'd0;
                R16_delay_arr_d5 [i+1] <= 64'd0;
                R16_delay_arr_d6 [i+1] <= 64'd0;
                R16_delay_arr_d7 [i+1] <= 64'd0;
                R16_delay_arr_d8 [i+1] <= 64'd0;
                R16_delay_arr_d9 [i+1] <= 64'd0;
                R16_delay_arr_d10[i+1] <= 64'd0;
                R16_delay_arr_d11[i+1] <= 64'd0;
                R16_delay_arr_d12[i+1] <= 64'd0;
                R16_delay_arr_d13[i+1] <= 64'd0;
                R16_delay_arr_d14[i+1] <= 64'd0;
                R16_delay_arr_d15[i+1] <= 64'd0;
            end
        end else begin
            for (i = 0; i<2; i=i+1) begin
                R16_delay_arr_d0 [i+1] <= R16_delay_arr_d0 [i];
                R16_delay_arr_d1 [i+1] <= R16_delay_arr_d1 [i];
                R16_delay_arr_d2 [i+1] <= R16_delay_arr_d2 [i];
                R16_delay_arr_d3 [i+1] <= R16_delay_arr_d3 [i];
                R16_delay_arr_d4 [i+1] <= R16_delay_arr_d4 [i];
                R16_delay_arr_d5 [i+1] <= R16_delay_arr_d5 [i];
                R16_delay_arr_d6 [i+1] <= R16_delay_arr_d6 [i];
                R16_delay_arr_d7 [i+1] <= R16_delay_arr_d7 [i];
                R16_delay_arr_d8 [i+1] <= R16_delay_arr_d8 [i];
                R16_delay_arr_d9 [i+1] <= R16_delay_arr_d9 [i];
                R16_delay_arr_d10[i+1] <= R16_delay_arr_d10[i];
                R16_delay_arr_d11[i+1] <= R16_delay_arr_d11[i];
                R16_delay_arr_d12[i+1] <= R16_delay_arr_d12[i];
                R16_delay_arr_d13[i+1] <= R16_delay_arr_d13[i];
                R16_delay_arr_d14[i+1] <= R16_delay_arr_d14[i];
                R16_delay_arr_d15[i+1] <= R16_delay_arr_d15[i];
            end
        end
    end
    
    assign R16_out_delay_data0  = R16_delay_arr_d0 [2]   ;
    assign R16_out_delay_data1  = R16_delay_arr_d1 [2]   ;
    assign R16_out_delay_data2  = R16_delay_arr_d2 [2]   ;
    assign R16_out_delay_data3  = R16_delay_arr_d3 [2]   ;
    assign R16_out_delay_data4  = R16_delay_arr_d4 [2]   ;
    assign R16_out_delay_data5  = R16_delay_arr_d5 [2]   ;
    assign R16_out_delay_data6  = R16_delay_arr_d6 [2]   ;
    assign R16_out_delay_data7  = R16_delay_arr_d7 [2]   ;
    assign R16_out_delay_data8  = R16_delay_arr_d8 [2]   ;
    assign R16_out_delay_data9  = R16_delay_arr_d9 [2]   ;
    assign R16_out_delay_data10 = R16_delay_arr_d10[2]  ;
    assign R16_out_delay_data11 = R16_delay_arr_d11[2]  ;
    assign R16_out_delay_data12 = R16_delay_arr_d12[2]  ;
    assign R16_out_delay_data13 = R16_delay_arr_d13[2]  ;
    assign R16_out_delay_data14 = R16_delay_arr_d14[2]  ;
    assign R16_out_delay_data15 = R16_delay_arr_d15[2]  ;
endmodule