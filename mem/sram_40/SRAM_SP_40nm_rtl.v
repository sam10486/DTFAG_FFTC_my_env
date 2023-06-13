/* FE Release Version: 3.4.22 */
/* lang compiler Version: 3.0.4 */
//
//       CONFIDENTIAL AND PROPRIETARY SOFTWARE OF ARM PHYSICAL IP, INC.
//      
//       Copyright (c) 1993 - 2023 ARM Physical IP, Inc.  All Rights Reserved.
//      
//       Use of this Software is subject to the terms and conditions of the
//       applicable license agreement with ARM Physical IP, Inc.
//       In addition, this Software is protected by patents, copyright law 
//       and international treaties.
//      
//       The copyright notice(s) in this Software does not indicate actual or
//       intended publication of this Software.
//
//      Verilog model for Synchronous Single-Port Ram
//
//       Instance Name:              SRAM_SP_2048_128
//       Words:                      2048
//       Bits:                       128
//       Mux:                        8
//       Drive:                      6
//       Write Mask:                 Off
//       Write Thru:                 Off
//       Extra Margin Adjustment:    On
//       Redundant Rows:             0
//       Redundant Columns:          0
//       Test Muxes                  On
//       Power Gating:               Off
//       Retention:                  On
//       Pipeline:                   Off
//       Weak Bit Test:	        Off
//       Read Disturb Test:	        Off
//       
//       Creation Date:  Sat Jun 10 14:25:36 2023
//       Version: 	r10p2
//
//      Modeling Assumptions: This model supports full gate level simulation
//          including proper x-handling and timing check behavior.  Unit
//          delay timing is included in the model. Back-annotation of SDF
//          (v3.0 or v2.1) is supported.  SDF can be created utilyzing the delay
//          calculation views provided with this generator and supported
//          delay calculators.  All buses are modeled [MSB:LSB].  All 
//          ports are padded with Verilog primitives.
//
//      Modeling Limitations: None.
//
//      Known Bugs: None.
//
//      Known Work Arounds: N/A
//
`timescale 1 ns/1 ps
module SRAM_SP_40nm (CENY, WENY, AY, DY, Q, CLK, CEN, WEN, A, D, EMA, EMAW, EMAS,
    TEN, BEN, TCEN, TWEN, TA, TD, TQ, RET1N, STOV);
  parameter ASSERT_PREFIX = "";
  parameter BITS = 128;
  parameter WORDS = 2048;
  parameter MUX = 8;
  parameter MEM_WIDTH = 1024; // redun block size 8, 512 on left, 512 on right
  parameter MEM_HEIGHT = 256;
  parameter WP_SIZE = 128 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 1;

  output  CENY;
  output  WENY;
  output [10:0] AY;
  output [127:0] DY;
  output [127:0] Q;
  input  CLK;
  input  CEN;
  input  WEN;
  input [10:0] A;
  input [127:0] D;
  input [2:0] EMA;
  input [1:0] EMAW;
  input  EMAS;
  input  TEN;
  input  BEN;
  input  TCEN;
  input  TWEN;
  input [10:0] TA;
  input [127:0] TD;
  input [127:0] TQ;
  input  RET1N;
  input  STOV;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif


    integer row_address;
    integer mux_address;
    reg [1023:0] mem [0:255];
    reg [1023:0] row;
    reg LAST_CLK;
    reg [1023:0] row_mask;
    reg [1023:0] new_data;
    reg [1023:0] data_out;
    reg [127:0] readLatch0;
    reg [127:0] shifted_readLatch0;
    reg [127:0] Q_int;
    reg [127:0] Q_int_delayed;
    reg [127:0] writeEnable;

    reg [BITS-1:0] memld [0:WORDS-1];
    reg [127:0] latched_DO;

    always @(posedge CLK) begin
        if (~CEN) begin
            if (~WEN) begin
                memld[A] <= D;
            end else begin
                latched_DO <= memld[A];
            end
        end
    end

    assign Q = latched_DO;

    assign CENY = 1'd0;
    assign WENY = 1'd0;
    assign AY = 10'd0;
    assign DY = 128'd0;



endmodule