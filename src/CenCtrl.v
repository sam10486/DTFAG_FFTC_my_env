 `timescale 1 ns/1 ps                                
 module CenCtrl(MulValid_out,                        
                cen_out,                               
                wen0_out,                              
                wen1_out,                              
                SD_sel_out,                            
                ExtMA_out,                             
                AGU_en_out,                            
                RomCen_out,                                                  
                rc_sel_out,                            
                m2_sel_out,                            
                wrfd_en_out,
                FFT_fin,   
                // input                        
                data_cnt_in,                           
                BND_in,                                
                ExtValid_in,                           
                rst_n,                               
                clk                                  
                ) ;                                  
 			   			                              
 parameter A_WIDTH  = 11 ;
 parameter DC_WIDTH = 15 ;
 parameter A_ZERO   = 11'h0;
                                     
 parameter S_WIDTH   = 4 ;           
 //INITIAL                           
 parameter INI              = 4'd0 ; 
 parameter LD_EXTD          = 4'd1 ; 
 parameter LD_EXTDF         = 4'd2 ; 
 parameter LD_STAGE1_ST     = 4'd3 ; 
 parameter ST_STAGE1        = 4'd4 ; 
 parameter WR_FIND          = 4'd5 ; 
 parameter LD_STAGE2_ST     = 4'd6 ; 
 parameter SET_OP           = 4'd7; 
 parameter SET_OPF          = 4'd8; 
   
 parameter EXTMA_V1 = 11'd2047;
 parameter DCNT_V1  = 15'd16431;
 parameter DCNT_V2  = 15'd4096;
 parameter DCNT_V3  = 15'd1;
 parameter DCNT_V4  = 15'd4095;
 parameter DCNT_V5  = 15'd8191;
 parameter DCNT_V6  = 15'd12287;
 
 
 output               MulValid_out ; 
 output               cen_out ;      
 output               wen0_out ;     
 output               wen1_out ;     
 output               SD_sel_out ;   
 output [A_WIDTH-1:0] ExtMA_out ;    
 output               AGU_en_out ;   
 output               RomCen_out ;   
 output               rc_sel_out ;   
 output               m2_sel_out ;   
 output               wrfd_en_out ; 
 output               FFT_fin; 
                                     
 input [DC_WIDTH-1:0] data_cnt_in ;  
 input                BND_in ;       
 input                ExtValid_in ;  
 input                rst_n ;        
 input                clk ;          
                                     
                                     
 reg   [S_WIDTH-1:0]  state ;        
 reg   [S_WIDTH-1:0]  next_state ;   
                                     
 reg   [A_WIDTH-1:0]  ExtMA_out ;    
 reg   [5:0]          WenCnt_reg ;   
 reg                  m2_sel_out ;   
 reg   [5:0]          Cnt1_reg ;     
                                     
                                     
 wire  [A_WIDTH-1:0]  ExtMA_wire ;   
 wire  [5:0]          WenCnt_wire ;  
 wire                 m2_sel_wire ;  
 wire  [5:0]          Cnt1_wire ;    
                                     
                                     
 	//                                
 	assign cen_out = (state == INI) ; 
 	                                  
 	//                                
 	assign wen0_out = ((state == INI)||(state == LD_EXTDF)||(state == LD_STAGE1_ST)                                                                                
 	                   ||(state == LD_STAGE2_ST)||(state == SET_OP)||(state == SET_OPF))? 1'b1 :                                                                                            
 	                  ((state == ST_STAGE1)||(state == WR_FIND))? BND_in : 1'b0 ;                                
 	                                                                                                                                                               
 	//                                                                                                                                                             
 	assign wen1_out = ((state == INI)||(state == LD_EXTDF)||(state == LD_STAGE1_ST)                                                                                
 	                   ||(state == LD_STAGE2_ST)||(state == SET_OP)||(state == SET_OPF))? 1'b1 :                                                               
 	                  ((state == ST_STAGE1)||(state == WR_FIND))? (~BND_in) : 1'b0 ;
 	                                                                                                                                                               
 	//                                                                                                                                                             
 	assign SD_sel_out = (state == INI)||(state == LD_EXTD) ;                                                                                                       
 	                                                                                                                                                               
 	// Ext Memory Address out                                                                                                                                      
 	assign ExtMA_wire = ((state == LD_EXTD))? (ExtMA_out + 1'b1) : ExtMA_out ;                                                                                     
 	                                                                                                                                                               
 	//                                                                                                                                                             
 	assign AGU_en_out = (state == LD_EXTDF)||(state == LD_STAGE1_ST)||(state == ST_STAGE1)                                                                         
 	                    ||(state == LD_STAGE2_ST)||(state == SET_OP);                                                                
 	                                                                                                                                                               
 	//                                                                                                                                                             
 	assign RomCen_out = (state == INI)||(state == LD_EXTD)||(state == SET_OP)||(state == SET_OPF) ; //modify 2020/02/24                                            
 	                                                                                                                                                               
 	// Counter for computing 47 butterfly units in stage1                                                                                                          
 	assign WenCnt_wire = ((state == LD_STAGE1_ST)||(state == LD_STAGE2_ST))? (WenCnt_reg + 1'b1) : 4'd0 ;
                                                                                                                                                                                                                                                                                                                                
 	//                                                                                                                                                             
 	//assign rc_sel_out = (state == SET_RC) ;//modify 2020/02/24                                                                                                   
 	assign rc_sel_out = (state == SET_OP);                                                                                                                         
 	//                                                                                                                                                             
 	//assign m2_sel_wire = (state == SET_RC) ; //modify 2020/02/24                                                                                                 
 	assign m2_sel_wire = (state == SET_OP);                                                                                                                        
 	//                                                                                                                                                             
 	//assign MulValid_out = (((state == SET_RC)&&(data_cnt_in>=DCNT_V3))||(state == SET_RCF)) ? 1'b1 : 1'b0 ;                                                      
 	assign MulValid_out = (((state == SET_OP)&&(data_cnt_in>=DCNT_V3))||(state == SET_OPF)) ? 1'b1 : 1'b0 ; //modify                                               
 	//                                                                                                                                                             
 	assign Cnt1_wire = (state == WR_FIND) ? (Cnt1_reg + 1'b1) : 6'd0 ;                                                                   
 	                                                                                                                                                               
 	// for RDCsel counter                                                                                                                                          
 	assign wrfd_en_out = (state == WR_FIND) ? 1'b1 : 1'b0 ;                                                                                
 	                                                                                                                                                               
 	assign FFT_fin = ( (state == SET_OP) || (state ==SET_OPF) || (state ==INI) || (state ==LD_EXTD) )? 1'd1 : 1'd0;                                                                                                                                                     
 	//                                                                                                                                                             
   always @(*) begin                                                                                                                                              
       case(state)                                                                                                                                                
           INI: begin                                                                                                                                             
                   if(ExtValid_in) next_state = LD_EXTD ;                                                                                                         
                   else next_state = INI ;                                                                                                                        
               end                                                                                                                                               
           // LOAD  Extdata to SRAM	                                                                                                                           
           LD_EXTD: begin                                                                                                                                         
                       if(ExtMA_out < EXTMA_V1) next_state = LD_EXTD ;                                                                                            
                       else next_state = LD_EXTDF ;                                                                                                               
                    end                                                                                                                                           
           // LOAD  Final Extdata to SRAM	and  Compute dataCount                                                                                                 
           LD_EXTDF: begin                                                                                                                                        
                        next_state = LD_STAGE1_ST ;                                                                                                                
                     end                                                                                                                                          
           // Compute FFT                                                                                                                                         
           LD_STAGE1_ST: begin                                                                                                                                    
                           if(WenCnt_reg < 6'd46) next_state = LD_STAGE1_ST ;                                                                                     
                           else next_state = ST_STAGE1 ;                                                                                                          
                        end                                                                                                                                      
           ST_STAGE1: begin                                                                                                                                       
                         if((data_cnt_in==DCNT_V4)||(data_cnt_in==DCNT_V5)||(data_cnt_in==DCNT_V6) ) next_state = WR_FIND ;
                         else if(data_cnt_in < DCNT_V1) next_state = ST_STAGE1 ;                       
                         else next_state = SET_OP ;                                                  
                      end                                                                            
             // Write 48 FFT data to SRAM in stage1                                                  
           WR_FIND: begin                                                                            
                       if(Cnt1_reg < 6'd47) next_state = WR_FIND ; //modify                          
                       else next_state = LD_STAGE2_ST ;                                              
                    end                                                                              
 			// Stage2 and other Stages, just Read FFT data, Counter for computing 48 butterfly units  
           LD_STAGE2_ST: begin                                                                       
                            if(WenCnt_reg < 6'd47) next_state = LD_STAGE2_ST ;                        
                            else next_state = ST_STAGE1 ;                                             
                         end                                                                                                                    
           SET_OP:begin                                                                               
                    if(data_cnt_in < DCNT_V2) next_state = SET_OP ;                                   
                    else next_state = SET_OPF ;                                                       
                 end                                                                                  
           SET_OPF:begin                                                                              
                        next_state = INI;  //modify 2020/02/24                                        
                     end			                                                                   
 		//                                                                                             
       default: next_state = INI ;  		                                                           
       endcase                                                                                        
   end                                                                                                
 
 	//                                                     
   always @(posedge clk or negedge rst_n) begin           
       if(~rst_n) begin                                   
           state <= INI ;                                 
           ExtMA_out <= A_ZERO ;                          
           WenCnt_reg <= 6'd0 ;                           
           m2_sel_out <= 1'b0 ; //modify 2020/02/24       
           Cnt1_reg <= 6'd0 ;                             
       end                                                
       else begin                                         
           state <= next_state ;                          
           ExtMA_out <= ExtMA_wire ;                      
           WenCnt_reg <= WenCnt_wire ;                    
           m2_sel_out <= m2_sel_wire ; //modify 2020/02/24
           Cnt1_reg <= Cnt1_wire ;                        
       end                                                
   end                                                    


 endmodule 
