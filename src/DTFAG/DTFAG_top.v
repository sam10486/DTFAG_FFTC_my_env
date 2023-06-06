`include "define.v"

module DTFAG_top (
    input clk,
    input rst_n,
    input ROM_CEN,
    input [`radix_width-1:0] DTFAG_j,
    input [`radix_width-1:0] DTFAG_t,
    input [`radix_width-1:0] DTFAG_i,
    input [`D_width-1:0] N_in,
    input [1:0] FFT_stage_in,
    input [1:0] Mul_sel_in,
    input [`D_width-1:0] R16_data_in0    , 
    input [`D_width-1:0] R16_data_in1    , 
    input [`D_width-1:0] R16_data_in2    , 
    input [`D_width-1:0] R16_data_in3    , 
    input [`D_width-1:0] R16_data_in4    , 
    input [`D_width-1:0] R16_data_in5    , 
    input [`D_width-1:0] R16_data_in6    , 
    input [`D_width-1:0] R16_data_in7    , 
    input [`D_width-1:0] R16_data_in8    , 
    input [`D_width-1:0] R16_data_in9    , 
    input [`D_width-1:0] R16_data_in10   ,
    input [`D_width-1:0] R16_data_in11   ,
    input [`D_width-1:0] R16_data_in12   ,
    input [`D_width-1:0] R16_data_in13   ,
    input [`D_width-1:0] R16_data_in14   ,
    input [`D_width-1:0] R16_data_in15   ,
    input [3:0]          RDC_sel_D_in    ,
    input [1:0]          DC_mode_sel_in  ,
    output [`D_width-1:0] R16_TF_Mul_DC_delay0 	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay1 	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay2 	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay3 	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay4 	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay5 	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay6 	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay7 	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay8 	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay9 	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay10	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay11	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay12	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay13	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay14	,
    output [`D_width-1:0] R16_TF_Mul_DC_delay15	

);

    wire ROM_CEN_AGU;
    wire [`radix_width-1:0] MA0;
    wire [`radix_width-1:0] MA1;
    wire [`radix_width-1:0] MA2;

    
    wire [`D_width-1:0]    ROM0_b0     ;
    wire [`D_width-1:0]    ROM0_b1     ;
    wire [`D_width-1:0]    ROM0_b2     ;
    wire [`D_width-1:0]    ROM0_b3     ;
    wire [`D_width-1:0]    ROM0_b4     ;
    wire [`D_width-1:0]    ROM0_b5     ;
    wire [`D_width-1:0]    ROM0_b6     ;
    wire [`D_width-1:0]    ROM0_b7     ;
    wire [`D_width-1:0]    ROM0_b8     ;
    wire [`D_width-1:0]    ROM0_b9     ;
    wire [`D_width-1:0]    ROM0_b10    ;
    wire [`D_width-1:0]    ROM0_b11    ;
    wire [`D_width-1:0]    ROM0_b12    ;
    wire [`D_width-1:0]    ROM0_b13    ;
    wire [`D_width-1:0]    ROM0_b14    ;
    wire [`D_width-1:0]    ROM0_b15    ;

    wire [`D_width-1:0]    ROM1_b0     ;
    wire [`D_width-1:0]    ROM1_b1     ;
    wire [`D_width-1:0]    ROM1_b2     ;
    wire [`D_width-1:0]    ROM1_b3     ;
    wire [`D_width-1:0]    ROM1_b4     ;
    wire [`D_width-1:0]    ROM1_b5     ;
    wire [`D_width-1:0]    ROM1_b6     ;
    wire [`D_width-1:0]    ROM1_b7     ;
    wire [`D_width-1:0]    ROM1_b8     ;
    wire [`D_width-1:0]    ROM1_b9     ;
    wire [`D_width-1:0]    ROM1_b10    ;
    wire [`D_width-1:0]    ROM1_b11    ;
    wire [`D_width-1:0]    ROM1_b12    ;
    wire [`D_width-1:0]    ROM1_b13    ;
    wire [`D_width-1:0]    ROM1_b14    ;
    wire [`D_width-1:0]    ROM1_b15    ;

    wire [`D_width-1:0]    ROM2_b0     ;
    wire [`D_width-1:0]    ROM2_b1     ;
    wire [`D_width-1:0]    ROM2_b2     ;
    wire [`D_width-1:0]    ROM2_b3     ;
    wire [`D_width-1:0]    ROM2_b4     ;
    wire [`D_width-1:0]    ROM2_b5     ;
    wire [`D_width-1:0]    ROM2_b6     ;
    wire [`D_width-1:0]    ROM2_b7     ;
    wire [`D_width-1:0]    ROM2_b8     ;
    wire [`D_width-1:0]    ROM2_b9     ;
    wire [`D_width-1:0]    ROM2_b10    ;
    wire [`D_width-1:0]    ROM2_b11    ;
    wire [`D_width-1:0]    ROM2_b12    ;
    wire [`D_width-1:0]    ROM2_b13    ;
    wire [`D_width-1:0]    ROM2_b14    ;
    wire [`D_width-1:0]    ROM2_b15    ;


    wire [`D_width-1:0] Process2_out0     ;
    wire [`D_width-1:0] Process2_out1     ;
    wire [`D_width-1:0] Process2_out2     ;
    wire [`D_width-1:0] Process2_out3     ;
    wire [`D_width-1:0] Process2_out4     ;
    wire [`D_width-1:0] Process2_out5     ;
    wire [`D_width-1:0] Process2_out6     ;
    wire [`D_width-1:0] Process2_out7     ;
    wire [`D_width-1:0] Process2_out8     ;
    wire [`D_width-1:0] Process2_out9     ;
    wire [`D_width-1:0] Process2_out10    ;
    wire [`D_width-1:0] Process2_out11    ;
    wire [`D_width-1:0] Process2_out12    ;
    wire [`D_width-1:0] Process2_out13    ;
    wire [`D_width-1:0] Process2_out14    ;
    wire [`D_width-1:0] Process2_out15    ;

    wire [`D_width-1:0] R16_data_Mux3_out0 	;
    wire [`D_width-1:0] R16_data_Mux3_out1 	;
    wire [`D_width-1:0] R16_data_Mux3_out2 	;
    wire [`D_width-1:0] R16_data_Mux3_out3 	;
    wire [`D_width-1:0] R16_data_Mux3_out4 	;
    wire [`D_width-1:0] R16_data_Mux3_out5 	;
    wire [`D_width-1:0] R16_data_Mux3_out6 	;
    wire [`D_width-1:0] R16_data_Mux3_out7 	;
    wire [`D_width-1:0] R16_data_Mux3_out8 	;
    wire [`D_width-1:0] R16_data_Mux3_out9 	;
    wire [`D_width-1:0] R16_data_Mux3_out10	;
    wire [`D_width-1:0] R16_data_Mux3_out11	;
    wire [`D_width-1:0] R16_data_Mux3_out12	;
    wire [`D_width-1:0] R16_data_Mux3_out13	;
    wire [`D_width-1:0] R16_data_Mux3_out14	;
    wire [`D_width-1:0] R16_data_Mux3_out15	;

    wire [`D_width-1:0] R16_out_delay_data0 	;
    wire [`D_width-1:0] R16_out_delay_data1 	;
    wire [`D_width-1:0] R16_out_delay_data2 	;
    wire [`D_width-1:0] R16_out_delay_data3 	;
    wire [`D_width-1:0] R16_out_delay_data4 	;
    wire [`D_width-1:0] R16_out_delay_data5 	;
    wire [`D_width-1:0] R16_out_delay_data6 	;
    wire [`D_width-1:0] R16_out_delay_data7 	;
    wire [`D_width-1:0] R16_out_delay_data8 	;
    wire [`D_width-1:0] R16_out_delay_data9 	;
    wire [`D_width-1:0] R16_out_delay_data10	;
    wire [`D_width-1:0] R16_out_delay_data11	;
    wire [`D_width-1:0] R16_out_delay_data12	;
    wire [`D_width-1:0] R16_out_delay_data13	;
    wire [`D_width-1:0] R16_out_delay_data14	;
    wire [`D_width-1:0] R16_out_delay_data15	;  

    wire [`D_width-1:0] R16_TF_Mul_out0   ;
    wire [`D_width-1:0] R16_TF_Mul_out1   ;
    wire [`D_width-1:0] R16_TF_Mul_out2   ;
    wire [`D_width-1:0] R16_TF_Mul_out3   ;
    wire [`D_width-1:0] R16_TF_Mul_out4   ;
    wire [`D_width-1:0] R16_TF_Mul_out5   ;
    wire [`D_width-1:0] R16_TF_Mul_out6   ;
    wire [`D_width-1:0] R16_TF_Mul_out7   ;
    wire [`D_width-1:0] R16_TF_Mul_out8   ;
    wire [`D_width-1:0] R16_TF_Mul_out9   ;
    wire [`D_width-1:0] R16_TF_Mul_out10  ;
    wire [`D_width-1:0] R16_TF_Mul_out11  ;
    wire [`D_width-1:0] R16_TF_Mul_out12  ;
    wire [`D_width-1:0] R16_TF_Mul_out13  ;
    wire [`D_width-1:0] R16_TF_Mul_out14  ;
    wire [`D_width-1:0] R16_TF_Mul_out15  ;

    wire [`D_width-1:0] R16_TF_Mul_DC0 	;
    wire [`D_width-1:0] R16_TF_Mul_DC1 	;
    wire [`D_width-1:0] R16_TF_Mul_DC2 	;
    wire [`D_width-1:0] R16_TF_Mul_DC3 	;
    wire [`D_width-1:0] R16_TF_Mul_DC4 	;
    wire [`D_width-1:0] R16_TF_Mul_DC5 	;
    wire [`D_width-1:0] R16_TF_Mul_DC6 	;
    wire [`D_width-1:0] R16_TF_Mul_DC7 	;
    wire [`D_width-1:0] R16_TF_Mul_DC8 	;
    wire [`D_width-1:0] R16_TF_Mul_DC9 	;
    wire [`D_width-1:0] R16_TF_Mul_DC10	;
    wire [`D_width-1:0] R16_TF_Mul_DC11	;
    wire [`D_width-1:0] R16_TF_Mul_DC12	;
    wire [`D_width-1:0] R16_TF_Mul_DC13	;
    wire [`D_width-1:0] R16_TF_Mul_DC14	;
    wire [`D_width-1:0] R16_TF_Mul_DC15	;  

    reg [3:0] RDC_sel_D_in_delay[0:4];
    reg [1:0] DC_mode_sel_in_delay[0:4];
    reg [1:0] Mul_sel_in_delay[0:4];
    always @(*) begin
        RDC_sel_D_in_delay[0] = RDC_sel_D_in;
        DC_mode_sel_in_delay[0]= DC_mode_sel_in;
        Mul_sel_in_delay[0] = Mul_sel_in;
    end
    always @(posedge clk or negedge rst_n) begin:delay
        integer i;
        if (~rst_n) begin
            for (i = 0; i<4; i=i+1) begin
                RDC_sel_D_in_delay[i+1]     <= 64'd0;
                DC_mode_sel_in_delay[i+1]   <= 64'd0;
                Mul_sel_in_delay[i+1]   <= 64'd0;
            end
        end else begin
            for (i = 0; i<4; i=i+1) begin
                RDC_sel_D_in_delay[i+1]     <= RDC_sel_D_in_delay[i]  ;
                DC_mode_sel_in_delay[i+1]   <= DC_mode_sel_in_delay[i];
                Mul_sel_in_delay[i+1]   <= Mul_sel_in_delay[i];
            end
        end
    end


    DTFAG_AGU DTFAG_AGU(
        // input
        .clk        (clk    ),
        .rst_n      (rst_n    ),
        .ROM_CEN_in (ROM_CEN),
        .DTFAG_i    (DTFAG_i),
        .DTFAG_t    (DTFAG_t),
        .DTFAG_j    (DTFAG_j),
        // output
        .MA0        (MA0        ),
        .MA1        (MA1        ),
        .MA2        (MA2        ),
        .ROM_CEN_out(ROM_CEN_AGU)
    );

    Memory_wrapper Memory_wrapper(
        .clk        (clk),
        .rst_n      (rst_n),
        .ROM_CEN    (ROM_CEN_AGU),
        .MA0        (MA0        ),
        .MA1        (MA1        ),
        .MA2        (MA2        ),
        // ROM0
        .ROM0_b0   (ROM0_b0 ),
        .ROM0_b1   (ROM0_b1 ),
        .ROM0_b2   (ROM0_b2 ),
        .ROM0_b3   (ROM0_b3 ),
        .ROM0_b4   (ROM0_b4 ),
        .ROM0_b5   (ROM0_b5 ),
        .ROM0_b6   (ROM0_b6 ),
        .ROM0_b7   (ROM0_b7 ),
        .ROM0_b8   (ROM0_b8 ),
        .ROM0_b9   (ROM0_b9 ),
        .ROM0_b10  (ROM0_b10),
        .ROM0_b11  (ROM0_b11),
        .ROM0_b12  (ROM0_b12),
        .ROM0_b13  (ROM0_b13),
        .ROM0_b14  (ROM0_b14),
        .ROM0_b15  (ROM0_b15),
        // ROM1
        .ROM1_b0   (ROM1_b0 ),
        .ROM1_b1   (ROM1_b1 ),
        .ROM1_b2   (ROM1_b2 ),
        .ROM1_b3   (ROM1_b3 ),
        .ROM1_b4   (ROM1_b4 ),
        .ROM1_b5   (ROM1_b5 ),
        .ROM1_b6   (ROM1_b6 ),
        .ROM1_b7   (ROM1_b7 ),
        .ROM1_b8   (ROM1_b8 ),
        .ROM1_b9   (ROM1_b9 ),
        .ROM1_b10  (ROM1_b10),
        .ROM1_b11  (ROM1_b11),
        .ROM1_b12  (ROM1_b12),
        .ROM1_b13  (ROM1_b13),
        .ROM1_b14  (ROM1_b14),
        .ROM1_b15  (ROM1_b15),
        // ROM2
        .ROM2_b0   (ROM2_b0 ),
        .ROM2_b1   (ROM2_b1 ),
        .ROM2_b2   (ROM2_b2 ),
        .ROM2_b3   (ROM2_b3 ),
        .ROM2_b4   (ROM2_b4 ),
        .ROM2_b5   (ROM2_b5 ),
        .ROM2_b6   (ROM2_b6 ),
        .ROM2_b7   (ROM2_b7 ),
        .ROM2_b8   (ROM2_b8 ),
        .ROM2_b9   (ROM2_b9 ),
        .ROM2_b10  (ROM2_b10),
        .ROM2_b11  (ROM2_b11),
        .ROM2_b12  (ROM2_b12),
        .ROM2_b13  (ROM2_b13),
        .ROM2_b14  (ROM2_b14),
        .ROM2_b15  (ROM2_b15)
    );
    
    DTFAG_Mul_process DTFAG_Mul_process(
        // input
        .clk       (clk),
        .rst_n     (rst_n),
        .FFT_stage_in(FFT_stage_in),
        // ROM
        .ROM0_in0  (ROM0_b0 ),
        .ROM0_in1  (ROM0_b1 ),
        .ROM0_in2  (ROM0_b2 ),
        .ROM0_in3  (ROM0_b3 ),
        .ROM0_in4  (ROM0_b4 ),
        .ROM0_in5  (ROM0_b5 ),
        .ROM0_in6  (ROM0_b6 ),
        .ROM0_in7  (ROM0_b7 ),
        .ROM0_in8  (ROM0_b8 ),
        .ROM0_in9  (ROM0_b9 ),
        .ROM0_in10 (ROM0_b10),
        .ROM0_in11 (ROM0_b11),
        .ROM0_in12 (ROM0_b12),
        .ROM0_in13 (ROM0_b13),
        .ROM0_in14 (ROM0_b14),
        .ROM0_in15 (ROM0_b15),
        .ROM1_in0  (ROM1_b0 ),
        .ROM1_in1  (ROM1_b1 ),
        .ROM1_in2  (ROM1_b2 ),
        .ROM1_in3  (ROM1_b3 ),
        .ROM1_in4  (ROM1_b4 ),
        .ROM1_in5  (ROM1_b5 ),
        .ROM1_in6  (ROM1_b6 ),
        .ROM1_in7  (ROM1_b7 ),
        .ROM1_in8  (ROM1_b8 ),
        .ROM1_in9  (ROM1_b9 ),
        .ROM1_in10 (ROM1_b10),
        .ROM1_in11 (ROM1_b11),
        .ROM1_in12 (ROM1_b12),
        .ROM1_in13 (ROM1_b13),
        .ROM1_in14 (ROM1_b14),
        .ROM1_in15 (ROM1_b15),
        .ROM2_in0  (ROM2_b0 ),
        .ROM2_in1  (ROM2_b1 ),
        .ROM2_in2  (ROM2_b2 ),
        .ROM2_in3  (ROM2_b3 ),
        .ROM2_in4  (ROM2_b4 ),
        .ROM2_in5  (ROM2_b5 ),
        .ROM2_in6  (ROM2_b6 ),
        .ROM2_in7  (ROM2_b7 ),
        .ROM2_in8  (ROM2_b8 ),
        .ROM2_in9  (ROM2_b9 ),
        .ROM2_in10 (ROM2_b10),
        .ROM2_in11 (ROM2_b11),
        .ROM2_in12 (ROM2_b12),
        .ROM2_in13 (ROM2_b13),
        .ROM2_in14 (ROM2_b14),
        .ROM2_in15 (ROM2_b15),
        .N_in      (N_in),
        // output
        .Process2_out0     (Process2_out0 ),
        .Process2_out1     (Process2_out1 ),
        .Process2_out2     (Process2_out2 ),
        .Process2_out3     (Process2_out3 ),
        .Process2_out4     (Process2_out4 ),
        .Process2_out5     (Process2_out5 ),
        .Process2_out6     (Process2_out6 ),
        .Process2_out7     (Process2_out7 ),
        .Process2_out8     (Process2_out8 ),
        .Process2_out9     (Process2_out9 ),
        .Process2_out10    (Process2_out10),
        .Process2_out11    (Process2_out11),
        .Process2_out12    (Process2_out12),
        .Process2_out13    (Process2_out13),
        .Process2_out14    (Process2_out14),
        .Process2_out15    (Process2_out15)
    );
    
    DTFAG_Mux3 DTFAG_Mux3(
        // output
        .MulA0_out  (R16_data_Mux3_out0 ), 
        .MulA1_out  (R16_data_Mux3_out1 ), 
        .MulA2_out  (R16_data_Mux3_out2 ), 
        .MulA3_out  (R16_data_Mux3_out3 ), 
        .MulA4_out  (R16_data_Mux3_out4 ), 
        .MulA5_out  (R16_data_Mux3_out5 ), 
        .MulA6_out  (R16_data_Mux3_out6 ), 
        .MulA7_out  (R16_data_Mux3_out7 ), 
        .MulA8_out  (R16_data_Mux3_out8 ), 
        .MulA9_out  (R16_data_Mux3_out9 ), 
        .MulA10_out (R16_data_Mux3_out10),
        .MulA11_out (R16_data_Mux3_out11),
        .MulA12_out (R16_data_Mux3_out12),
        .MulA13_out (R16_data_Mux3_out13),
        .MulA14_out (R16_data_Mux3_out14),
        .MulA15_out (R16_data_Mux3_out15),
        // input
        .R16_in0    (R16_data_in0 ),   
        .R16_in1    (R16_data_in1 ),   
        .R16_in2    (R16_data_in2 ),   
        .R16_in3    (R16_data_in3 ),   
        .R16_in4    (R16_data_in4 ),   
        .R16_in5    (R16_data_in5 ),   
        .R16_in6    (R16_data_in6 ),   
        .R16_in7    (R16_data_in7 ),   
        .R16_in8    (R16_data_in8 ),   
        .R16_in9    (R16_data_in9 ),   
        .R16_in10   (R16_data_in10),  
        .R16_in11   (R16_data_in11),  
        .R16_in12   (R16_data_in12),  
        .R16_in13   (R16_data_in13),  
        .R16_in14   (R16_data_in14),  
        .R16_in15   (R16_data_in15),  
        .Mul_sel    (Mul_sel_in_delay[4]   )   
    );
    
    wire [`D_width-1:0] Process2_out0_D     ;
    wire [`D_width-1:0] Process2_out1_D     ;
    wire [`D_width-1:0] Process2_out2_D     ;
    wire [`D_width-1:0] Process2_out3_D     ;
    wire [`D_width-1:0] Process2_out4_D     ;
    wire [`D_width-1:0] Process2_out5_D     ;
    wire [`D_width-1:0] Process2_out6_D     ;
    wire [`D_width-1:0] Process2_out7_D     ;
    wire [`D_width-1:0] Process2_out8_D     ;
    wire [`D_width-1:0] Process2_out9_D     ;
    wire [`D_width-1:0] Process2_out10_D    ;
    wire [`D_width-1:0] Process2_out11_D    ;
    wire [`D_width-1:0] Process2_out12_D    ;
    wire [`D_width-1:0] Process2_out13_D    ;
    wire [`D_width-1:0] Process2_out14_D    ;
    wire [`D_width-1:0] Process2_out15_D    ;
    TF_input_delay TF_input_delay(
		// input
		.rst_n		(rst_n),
		.clk		(clk),
		.data_in0   (Process2_out0 ),
		.data_in1   (Process2_out1 ),
		.data_in2   (Process2_out2 ),
		.data_in3   (Process2_out3 ),
		.data_in4   (Process2_out4 ),
		.data_in5   (Process2_out5 ),
		.data_in6   (Process2_out6 ),
		.data_in7   (Process2_out7 ),
		.data_in8   (Process2_out8 ),
		.data_in9   (Process2_out9 ),
		.data_in10  (Process2_out10),
		.data_in11  (Process2_out11),
		.data_in12  (Process2_out12),
		.data_in13  (Process2_out13),
		.data_in14  (Process2_out14),
		.data_in15  (Process2_out15),
		// output
		.R16_out_delay_data0   (Process2_out0_D ),
		.R16_out_delay_data1   (Process2_out1_D ),
		.R16_out_delay_data2   (Process2_out2_D ),
		.R16_out_delay_data3   (Process2_out3_D ),
		.R16_out_delay_data4   (Process2_out4_D ),
		.R16_out_delay_data5   (Process2_out5_D ),
		.R16_out_delay_data6   (Process2_out6_D ),
		.R16_out_delay_data7   (Process2_out7_D ),
		.R16_out_delay_data8   (Process2_out8_D ),
		.R16_out_delay_data9   (Process2_out9_D ),
		.R16_out_delay_data10  (Process2_out10_D),
		.R16_out_delay_data11  (Process2_out11_D),
		.R16_out_delay_data12  (Process2_out12_D),
		.R16_out_delay_data13  (Process2_out13_D),
		.R16_out_delay_data14  (Process2_out14_D),
		.R16_out_delay_data15  (Process2_out15_D)
	);

    R16_TF_mul R16_TF_mul(
        // input
        .clk             (clk),
        .rst_n           (rst_n),
        .N_in            (N_in),
        .R16_delay_in0   (R16_data_Mux3_out0 ),
        .R16_delay_in1   (R16_data_Mux3_out1 ),
        .R16_delay_in2   (R16_data_Mux3_out2 ),
        .R16_delay_in3   (R16_data_Mux3_out3 ),
        .R16_delay_in4   (R16_data_Mux3_out4 ),
        .R16_delay_in5   (R16_data_Mux3_out5 ),
        .R16_delay_in6   (R16_data_Mux3_out6 ),
        .R16_delay_in7   (R16_data_Mux3_out7 ),
        .R16_delay_in8   (R16_data_Mux3_out8 ),
        .R16_delay_in9   (R16_data_Mux3_out9 ),
        .R16_delay_in10  (R16_data_Mux3_out10),
        .R16_delay_in11  (R16_data_Mux3_out11),
        .R16_delay_in12  (R16_data_Mux3_out12),
        .R16_delay_in13  (R16_data_Mux3_out13),
        .R16_delay_in14  (R16_data_Mux3_out14),
        .R16_delay_in15  (R16_data_Mux3_out15),
        .TF_in0          (Process2_out0_D ),
        .TF_in1          (Process2_out1_D ),
        .TF_in2          (Process2_out2_D ),
        .TF_in3          (Process2_out3_D ),
        .TF_in4          (Process2_out4_D ),
        .TF_in5          (Process2_out5_D ),
        .TF_in6          (Process2_out6_D ),
        .TF_in7          (Process2_out7_D ),
        .TF_in8          (Process2_out8_D ),
        .TF_in9          (Process2_out9_D ),
        .TF_in10         (Process2_out10_D),
        .TF_in11         (Process2_out11_D),
        .TF_in12         (Process2_out12_D),
        .TF_in13         (Process2_out13_D),
        .TF_in14         (Process2_out14_D),
        .TF_in15         (Process2_out15_D),
        // output
        .R16_TF_Mul_out0     (R16_TF_Mul_out0 ),
        .R16_TF_Mul_out1     (R16_TF_Mul_out1 ),
        .R16_TF_Mul_out2     (R16_TF_Mul_out2 ),
        .R16_TF_Mul_out3     (R16_TF_Mul_out3 ),
        .R16_TF_Mul_out4     (R16_TF_Mul_out4 ),
        .R16_TF_Mul_out5     (R16_TF_Mul_out5 ),
        .R16_TF_Mul_out6     (R16_TF_Mul_out6 ),
        .R16_TF_Mul_out7     (R16_TF_Mul_out7 ),
        .R16_TF_Mul_out8     (R16_TF_Mul_out8 ),
        .R16_TF_Mul_out9     (R16_TF_Mul_out9 ),
        .R16_TF_Mul_out10    (R16_TF_Mul_out10),
        .R16_TF_Mul_out11    (R16_TF_Mul_out11),
        .R16_TF_Mul_out12    (R16_TF_Mul_out12),
        .R16_TF_Mul_out13    (R16_TF_Mul_out13),
        .R16_TF_Mul_out14    (R16_TF_Mul_out14),
        .R16_TF_Mul_out15    (R16_TF_Mul_out15)
    );

    R16_DC DTFAG_R16_DC(
					.RDC_out0	(R16_TF_Mul_DC0 ),                                 
 			        .RDC_out1	(R16_TF_Mul_DC1 ),                                 
 			        .RDC_out2	(R16_TF_Mul_DC2 ),                                 
 			        .RDC_out3	(R16_TF_Mul_DC3 ),                                 
 					.RDC_out4	(R16_TF_Mul_DC4 ),                                 
 			        .RDC_out5	(R16_TF_Mul_DC5 ),                                 
 			        .RDC_out6	(R16_TF_Mul_DC6 ),                                 
 			        .RDC_out7	(R16_TF_Mul_DC7 ),                                 
 			        .RDC_out8	(R16_TF_Mul_DC8 ),                                 
 			        .RDC_out9	(R16_TF_Mul_DC9 ),                                 
 			        .RDC_out10	(R16_TF_Mul_DC10),                               
 			        .RDC_out11	(R16_TF_Mul_DC11),                               
 			        .RDC_out12	(R16_TF_Mul_DC12),                               
 			        .RDC_out13	(R16_TF_Mul_DC13),                               
 			        .RDC_out14	(R16_TF_Mul_DC14),                               
 			        .RDC_out15	(R16_TF_Mul_DC15),                               
                    .RDC_in0	(R16_TF_Mul_out0 ),                               
 		            .RDC_in1	(R16_TF_Mul_out1 ),                               
 			        .RDC_in2	(R16_TF_Mul_out2 ),                               
 			        .RDC_in3	(R16_TF_Mul_out3 ),                               
 					.RDC_in4	(R16_TF_Mul_out4 ),                               
 			        .RDC_in5	(R16_TF_Mul_out5 ),                               
 			        .RDC_in6	(R16_TF_Mul_out6 ),                               
 			        .RDC_in7	(R16_TF_Mul_out7 ),                               
 			        .RDC_in8	(R16_TF_Mul_out8 ),                               
 			        .RDC_in9	(R16_TF_Mul_out9 ),                               
 			        .RDC_in10	(R16_TF_Mul_out10),                             
 			        .RDC_in11	(R16_TF_Mul_out11),                             
 			        .RDC_in12	(R16_TF_Mul_out12),                             
 			        .RDC_in13	(R16_TF_Mul_out13),                             
 			        .RDC_in14	(R16_TF_Mul_out14),                             
 			        .RDC_in15	(R16_TF_Mul_out15),                             
 			        .RDC_sel(RDC_sel_D_in_delay[4]),                                 
 				    .DC_mode_sel(DC_mode_sel_in_delay[4]),                   
                    .rst_n(rst_n),                                         
                    .clk(clk)                                              
                     ) ;
    
    R16_WD_delay R16_WD_delay(
        // input
        .clk                (clk),
        .rst_n              (rst_n),
        .R16_WD_delay_in0   (R16_TF_Mul_DC0 ),
        .R16_WD_delay_in1   (R16_TF_Mul_DC1 ),
        .R16_WD_delay_in2   (R16_TF_Mul_DC2 ),
        .R16_WD_delay_in3   (R16_TF_Mul_DC3 ),
        .R16_WD_delay_in4   (R16_TF_Mul_DC4 ),
        .R16_WD_delay_in5   (R16_TF_Mul_DC5 ),
        .R16_WD_delay_in6   (R16_TF_Mul_DC6 ),
        .R16_WD_delay_in7   (R16_TF_Mul_DC7 ),
        .R16_WD_delay_in8   (R16_TF_Mul_DC8 ),
        .R16_WD_delay_in9   (R16_TF_Mul_DC9 ),
        .R16_WD_delay_in10  (R16_TF_Mul_DC10),
        .R16_WD_delay_in11  (R16_TF_Mul_DC11),
        .R16_WD_delay_in12  (R16_TF_Mul_DC12),
        .R16_WD_delay_in13  (R16_TF_Mul_DC13),
        .R16_WD_delay_in14  (R16_TF_Mul_DC14),
        .R16_WD_delay_in15  (R16_TF_Mul_DC15),
        // output
        .R16_WD_delay_out0   (R16_TF_Mul_DC_delay0 ),
        .R16_WD_delay_out1   (R16_TF_Mul_DC_delay1 ),
        .R16_WD_delay_out2   (R16_TF_Mul_DC_delay2 ),
        .R16_WD_delay_out3   (R16_TF_Mul_DC_delay3 ),
        .R16_WD_delay_out4   (R16_TF_Mul_DC_delay4 ),
        .R16_WD_delay_out5   (R16_TF_Mul_DC_delay5 ),
        .R16_WD_delay_out6   (R16_TF_Mul_DC_delay6 ),
        .R16_WD_delay_out7   (R16_TF_Mul_DC_delay7 ),
        .R16_WD_delay_out8   (R16_TF_Mul_DC_delay8 ),
        .R16_WD_delay_out9   (R16_TF_Mul_DC_delay9 ),
        .R16_WD_delay_out10  (R16_TF_Mul_DC_delay10),
        .R16_WD_delay_out11  (R16_TF_Mul_DC_delay11),
        .R16_WD_delay_out12  (R16_TF_Mul_DC_delay12),
        .R16_WD_delay_out13  (R16_TF_Mul_DC_delay13),
        .R16_WD_delay_out14  (R16_TF_Mul_DC_delay14),
        .R16_WD_delay_out15  (R16_TF_Mul_DC_delay15)
    );
    
endmodule