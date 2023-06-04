 `timescale 1 ns/1 ps                                
 module R16_AGU(BN_out,                              
                MA,                                  
                ROMA,                                
                Mul_sel_out,                         
                RDC_sel_out,                         
                data_cnt_reg,                        
                DC_mode_sel_out,   
                DTFAG_j,
                DTFAG_t,
                DTFAG_i,  
                FFT_stage,       
                //input                                  
                rc_sel_in,                           
                AGU_en,                              
                wrfd_en_in,                          
                rst_n,                               
                clk,
                FFT_fin_wire                                  
                ) ;                                  
 parameter A_WIDTH     = 11;
 parameter DC_WIDTH    = 15;
 parameter BC_WIDTH    = 12;
 parameter SC_WIDTH    = 3;
 parameter ROMA_WIDTH  = 12;
 
 parameter DC_ZERO   = 15'h0 ;
 parameter ROMA_ZERO = 12'h0 ;
 
parameter S0      = 3'd0; 
parameter S1      = 3'd1; 
parameter S2      = 3'd2; 
parameter S3      = 3'd3; 

 parameter DCNT_V1    = 15'd16431; //data counter value1 for data_cnt_wire      
 parameter DCNT_V2    = 15'd4096; //data counter value2 for data_cnt_wire      

 parameter DCNT_BP1 = 3 ;
 parameter DCNT_BP2 = 4 ;
 parameter DCNT_BP3 = 11 ;
 parameter DCNT_BP4 = 12 ;


 output                  BN_out ;                                    
 output [A_WIDTH-1:0]    MA ;                                        
 output [ROMA_WIDTH-1:0] ROMA ;                                      
 output [1:0]            Mul_sel_out ;                               
 output [3:0]            RDC_sel_out ;                               
 output [DC_WIDTH-1:0]   data_cnt_reg ;                              
 output [1:0]            DC_mode_sel_out ;    
 output reg [3:0]            DTFAG_j;
 output reg [3:0]            DTFAG_t;  
 output reg [3:0]            DTFAG_i;
 output     [1:0]            FFT_stage;     

                                                                                                  
 input                   rc_sel_in ;                                 
 input                   AGU_en ;                                    
 input                   wrfd_en_in ;                                
 input                   rst_n ;                                     
 input                   clk ;    
 input                   FFT_fin_wire ;                                       
                                                                     
                                                                     
 reg   [1:0]          DC_mode_sel_out;                               
 reg   [DC_WIDTH-1:0] data_cnt_reg ; // data counter                 
 reg   [3:0]          RDCsel_cnt_reg ; // RDC select counter         
 reg                  BN_out ;                                       
 reg   [3:0]          RDC_sel_out ;                                  
 reg   [1:0]          Mul_sel_out ;                                  
                                                                     
                                                                     
 wire           DC_mode_sel_wire ;                             
 wire  [DC_WIDTH-1:0] data_cnt_wire ;                                
 wire  [3:0]          RDCsel_cnt_wire ;                              
 wire  [BC_WIDTH-1:0] BC_wire ; // butterfly counter                 
 wire                 xor_d0_wire;
 wire                 xor_d1_wire;
 wire                 xor_d2_wire;
 wire                 xor_d3_wire;
 wire                 xor_d4_wire;
 wire                 xor_d5_wire;
 wire                 xor_d6_wire;
 wire  [SC_WIDTH-1:0] SC_wire ; // stage counter 
 wire  [BC_WIDTH-1:0] BC_RR_wire ;               
 wire                 BN_wire ;                  
 wire [3:0]           RDC_sel_wire ;             
 wire            Mul_sel_wire ;             

 reg [1:0] cnt;                                                                                                                                                  
                                                                                                                                                                                                                     
 	//                                                                                                          
   assign data_cnt_wire = (((AGU_en==1'b1)&&(data_cnt_reg==DCNT_V1))||                                         
                           ((rc_sel_in==1'b1)&&(AGU_en==1'b1)&&(data_cnt_reg==DCNT_V2)))?                      
                           DC_ZERO : (AGU_en==1'b1)?
                           (data_cnt_reg + 1'b1) : data_cnt_reg ;                                              
                                                                                                               
 	//                                                                                                          
   assign RDCsel_cnt_wire = (((AGU_en==1'b1)&&(data_cnt_reg==DCNT_V1))||                                       
                             ((rc_sel_in==1'b1)&&(AGU_en==1'b1)&&(data_cnt_reg==DCNT_V2)))?                     
                             4'd0 : ((AGU_en==1'b1)||(wrfd_en_in==1'b1))?
                             (RDCsel_cnt_reg + 1'b1) : RDCsel_cnt_reg ;                                         
 	                                                                                                            
 	// for Gray code 	 
   assign xor_d0_wire = data_cnt_reg[11]^data_cnt_reg[10];
   assign xor_d1_wire = data_cnt_reg[10]^data_cnt_reg[9];
   assign xor_d2_wire = data_cnt_reg[9]^data_cnt_reg[8];
   assign xor_d3_wire = data_cnt_reg[8]^data_cnt_reg[7];
   assign xor_d4_wire = data_cnt_reg[7]^data_cnt_reg[6];
   assign xor_d5_wire = data_cnt_reg[6]^data_cnt_reg[5];
   assign xor_d6_wire = data_cnt_reg[5]^data_cnt_reg[4];

   assign BC_wire = (rc_sel_in==1'b1)?                                                  
                    ({data_cnt_reg[DCNT_BP1:0],data_cnt_reg[DCNT_BP3:DCNT_BP2]}):       
                    ({data_cnt_reg[DCNT_BP1:0],                                         
                      data_cnt_reg[DCNT_BP3],                                           
                      xor_d0_wire,
                      xor_d1_wire,
                      xor_d2_wire,
                      xor_d3_wire,
                      xor_d4_wire,
                      xor_d5_wire,
                      xor_d6_wire
                       }) ;

   //                                                                                                                 
   assign SC_wire = data_cnt_reg[DC_WIDTH-1:DCNT_BP4] ;                                                               
                                                                                                                      
   // Barrel shifter, rc_sel_in=1, right rotate 4-bit                                                                 
   /*assign BC_RR_wire = ((SC_wire == S0)||(SC_wire == S3))&&(rc_sel_in == 1'b0)? BC_wire:
                       ((SC_wire == S1&&(rc_sel_in == 1'b0))||(rc_sel_in==1'b1)) ? 
                       {BC_wire[3:0],BC_wire[BC_WIDTH-1:4]} :
                       ((SC_wire == S2) && (rc_sel_in == 1'b0)) ? 
                       {BC_wire[7:0],BC_wire[BC_WIDTH-1:8]} :
                       BC_wire;*/

    assign BC_RR_wire =  ( rc_sel_in == 1'b1 )? ({BC_wire[7:6],BC_wire[5:4],BC_wire[11:8],BC_wire[3:0]}):
                      ((SC_wire == S0)||(SC_wire == S3))? BC_wire:
                      (SC_wire == S1) ? {BC_wire[3:0],BC_wire[BC_WIDTH-1:4]} :
                      (SC_wire == S2) ? {BC_wire[7:0],BC_wire[BC_WIDTH-1:8]} : BC_wire;
                                                                                                                      
   // Bank,  rc_sel_in=1 BN_wire=(^BC_RR_wire)                                                                        
   assign BN_wire = (^BC_RR_wire) ;                                              
   // Address, rc_sel_in=1 MA=(BC_RR_wire[BC_WIDTH-1:1])                                                              
   assign MA = (BC_RR_wire[BC_WIDTH-1:1]) ;                         
                                                                                                                      
   // ROM Address                                                                                                     
   assign ROMA = (SC_wire==S0)? (BC_RR_wire) :                                                                        
               (SC_wire ==S1)? ({BC_RR_wire[7:0],4'd0}) : 
               (SC_wire ==S2)? ({BC_RR_wire[3:0],8'd0}) : 
                 ROMA_ZERO;
   //                                                                                                                 
   assign Mul_sel_wire = (FFT_fin_wire==1'b1)? 1'd0 : 1'd1 ;                                                               
                                                                                                                      
   //                                                                                                                 
   assign RDC_sel_wire = (wrfd_en_in==1'b1) ? RDCsel_cnt_reg : data_cnt_reg[3:0]  ;                                   
                                                                                                                      
   //FFT final stage mode select                                                                                      
   //                                                                                                                 
   assign  DC_mode_sel_wire = ( SC_wire == S3)? 1'd1 : 1'd0;                                 
                                                                                                                      
                                                                                                                      
                                                                                                                      
                                                                                                                      
   //                                                                                                                 
   always @(posedge clk or negedge rst_n) begin                                                                       
   	if(~rst_n) begin                                                                                               
           data_cnt_reg <= DC_ZERO ;                                                                                  
           BN_out <= 1'b0 ;                                                                                           
           RDC_sel_out <= 4'd0 ;                                                                                      
           Mul_sel_out <= 2'd0 ;                                                                                      
           DC_mode_sel_out <= 2'd0 ;                                                                                  
           RDCsel_cnt_reg <= 4'd0 ;                                                                                   
   	end                                                                                                            
   	else begin                                                                                                     
           data_cnt_reg <= data_cnt_wire ;                                                                            
           BN_out <= BN_wire ;                                                                                        
           RDC_sel_out <= RDC_sel_wire ;                                                                              
           Mul_sel_out <= Mul_sel_wire ;                                                                              
           DC_mode_sel_out <= DC_mode_sel_wire ;                                                                      
           RDCsel_cnt_reg <= RDCsel_cnt_wire ;                                                                        
   	end                                                                                                            
   end                                                                                                                




  //-------------DTFAG parameter-------------------------
  reg [1:0] FFT_stage_tmp;
  reg [1:0] FFT_stage_pip [0:48];
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      FFT_stage_tmp <= 2'd0;
    end else begin
      case (data_cnt_reg[DC_WIDTH-1:DC_WIDTH-1-2])
        3'b000: begin
          FFT_stage_tmp <= 2'd0;
        end
        3'b001: begin
          FFT_stage_tmp <= 2'd1;
        end
        3'b010: begin
          FFT_stage_tmp <= 2'd2;
        end
        3'b011: begin
          FFT_stage_tmp <= 2'd3;
        end 
        default: begin
          FFT_stage_tmp <= 2'd0;
        end 
      endcase
    end
  end
  always @(*) begin
    FFT_stage_pip[0] = FFT_stage_tmp;
  end
  always @(posedge clk or negedge rst_n) begin: delay_48
    integer i;
    if (~rst_n) begin
      for (i = 0; i<48 ; i=i+1) begin
        FFT_stage_pip[i+1] <= 2'd0;
      end
    end else begin
      for (i = 0; i<48; i=i+1) begin
        FFT_stage_pip[i+1] <= FFT_stage_pip[i];
      end
    end
  end
  assign FFT_stage = FFT_stage_pip[48];

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      DTFAG_j <= 4'd0;
    end else begin
      if (AGU_en) begin
        DTFAG_j <= DTFAG_j + 4'd1;
      end else begin
        DTFAG_j <= 4'd0;
      end
    end
  end

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      DTFAG_t <= 4'd0;
    end else begin
      if (AGU_en) begin
        if (DTFAG_j == 4'd15 && DTFAG_t == 4'd15) begin
          DTFAG_t <= 4'd0;
        end else begin
          if (DTFAG_j == 4'd15) begin
            DTFAG_t <= DTFAG_t + 4'd1;
          end else begin
            DTFAG_t <= DTFAG_t;
          end
        end
      end
    end
  end

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      DTFAG_i <= 4'd0;
    end else begin
      if (AGU_en) begin
        if (DTFAG_j == 4'd15 && DTFAG_t == 4'd15 && DTFAG_i == 4'd15) begin
          DTFAG_i <= 4'd0;
        end else begin
          if (DTFAG_j == 4'd15 && DTFAG_t == 4'd15) begin
            DTFAG_i <= DTFAG_i + 4'd1;
          end else begin
            DTFAG_i <= DTFAG_i;
          end
        end
      end
    end
  end

 endmodule                                                  

