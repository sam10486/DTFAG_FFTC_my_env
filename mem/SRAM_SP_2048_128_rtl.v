//
//      CONFIDENTIAL  AND  PROPRIETARY SOFTWARE OF ARM Physical IP, INC.
//      
//      Copyright (c) 1993-2023  ARM Physical IP, Inc.  All  Rights Reserved.
//      
//      Use of this Software is subject to the terms and conditions  of the
//      applicable license agreement with ARM Physical IP, Inc.  In addition,
//      this Software is protected by patents, copyright law and international
//      treaties.
//      
//      The copyright notice(s) in this Software does not indicate actual or
//      intended publication of this Software.
//      
//      name:			Advantage Single-Port SRAM Generator
//           			TSMC 90nm CLN90G Process
//      version:		2007Q4V2
//      comment:		
//      configuration:	 -instname "SRAM_SP_2048_128" -words 2048 -bits 128 -frequency 200 -ring_width 2.0 -mux 8 -write_mask off -wp_size 8 -top_layer "met5-9" -power_type rings -horiz met3 -vert met4 -redundancy off -rcols 2 -rrows 2 -bmux off -ser none -ema on -cust_comment "" -bus_notation on -left_bus_delim "[" -right_bus_delim "]" -pwr_gnd_rename "VDD:VDD,VSS:VSS" -prefix "" -pin_space 0.0 -name_case upper -check_instname on -diodes on -inside_ring_type VSS -drive 6 -asvm off -corners ff_1.1_-40.0,ff_1.1_.0,tt_1.0_25.0,ss_0.9_125.0
//
//      Verilog model for Synchronous Single-Port Ram
//
//      Instance Name:              SRAM_SP_2048_128
//      Words:                      2048
//      Bits:                       128
//      Mux:                        8
//      Drive:                      6
//      Write Mask:                 Off
//      Extra Margin Adjustment:    On
//      Accelerated Retention Test: Off
//      Redundant Rows:             0
//      Redundant Columns:          0
//      Test Muxes                  Off
//
//      Creation Date:  2023-04-26 11:19:18Z
//      Version: 	2007Q4V2
//
//      Modeling Assumptions: This model supports full gate level simulation
//          including proper x-handling and timing check behavior.  Unit
//          delay timing is included in the model. Back-annotation of SDF
//          (v2.1) is supported.  SDF can be created utilyzing the delay
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
`celldefine
  module SRAM_SP_2048_128 (
                Q,
                CLK,
                CEN,
                WEN,
                A,
                D,
                EMA
                );
   parameter                BITS = 128;
   parameter                WORD_DEPTH = 2048;
   parameter                ADDR_WIDTH = 11;
   parameter                WORDX = {BITS{1'bx}};
   parameter                WORD1 = {BITS{1'b1}};
   parameter                ADDRX = {ADDR_WIDTH{1'bx}};
   parameter                ADDR1 = {ADDR_WIDTH{1'b1}};
   parameter                WEN_WIDTH = 1;
   parameter                WP_SIZE    = 128 ;
   parameter                RCOLS = 0;
   parameter                MASKX = {WEN_WIDTH{1'bx}};
   parameter                MASK1 = {WEN_WIDTH{1'b1}};
   parameter                MASK0 = {WEN_WIDTH{1'b0}};
   parameter                MUX = 8;
   parameter                COL_ADDR_WIDTH = 3;
   parameter                RROWS = 0;
   parameter                UPM_WIDTH = 3;
   parameter                UPM0 = {UPM_WIDTH{1'b0}};
   parameter                RCA_WIDTH = 1;
   parameter                RED_COLUMNS = 2;
	
   output [127:0]           Q;
   input                    CLK;
   input                    CEN;
   input                    WEN;
   input [10:0]             A;
   input [127:0]            D;
   input [2:0]              EMA;

   reg [BITS+RED_COLUMNS-1:0]             mem [0:WORD_DEPTH-1];
   reg [BITS+RED_COLUMNS-1:0]             rows [(MUX*4)-1:0];   // added 2 bits for column redundancy

    reg [127:0] latched_DO;

    always @(posedge CLK) begin
        if (~CEN) begin
            if (~WEN) begin
                mem[A] <= D;
            end else begin
                latched_DO <= mem[A];
            end
        end
    end

    assign Q = latched_DO;

endmodule