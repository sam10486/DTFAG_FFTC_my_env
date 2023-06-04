`timescale 1 ns/1 ps                                                                       
module Mux3(MulB0_out,                                                                     
			  MulB1_out,                                                                     
			  MulB2_out,                                                                     
			  MulB3_out,                                                                     
			  MulB4_out,                                                                     
			  MulB5_out,                                                                     
			  MulB6_out,                                                                     
			  MulB7_out,                                                                     
			  MulB8_out,                                                                     
			  MulB9_out,                                                                     
			  MulB10_out,                                                                    
			  MulB11_out,                                                                    
			  MulB12_out,                                                                    
			  MulB13_out,                                                                    
			  MulB14_out,                                                                    
			  MulB15_out,  

			  MulA0_out,                                                                   
			  MulA1_out,                                                                     
			  MulA2_out,                                                                     
			  MulA3_out,                                                                     
			  MulA4_out,                                                                     
			  MulA5_out,                                                                     
			  MulA6_out,                                                                     
			  MulA7_out,    
			  MulA8_out,                                                                     
			  MulA9_out,                                                                     
			  MulA10_out,                                                                    
			  MulA11_out,                                                                    
			  MulA12_out,                                                                    
			  MulA13_out,                                                                    
			  MulA14_out,                                                                    
			  MulA15_out,                                                                    
                                                               
              ROMD0_in,                                                                      
			  ROMD1_in,                                                                      
			  ROMD2_in,                                                                      
			  ROMD3_in,                                                                      
			  ROMD4_in,                                                                      
			  ROMD5_in,                                                                      
			  ROMD6_in,                                                                      
			  ROMD7_in,                                                                      

			  RA0D_in,                                                     
			  RA1D_in,                                                                       
			  RA2D_in,                                                                       
			  RA3D_in,                                                                       
			  RA4D_in,                                                                       
			  RA5D_in,                                                                       
			  RA6D_in,                                                                       
			  RA7D_in,     
			  RA8D_in,                                                                      
			  RA9D_in,                                                                       
			  RA10D_in,                                                                      
			  RA11D_in,                                                                      
			  RA12D_in,                                                                      
			  RA13D_in,                                                                      
			  RA14D_in,                                                                      
			  RA15D_in,                                                                      
			  Mul_sel,                                                                                                 
			  ) ;                                                                            
			                                                                                 
parameter P_WIDTH   = 64 ;                                                                 
parameter SD_WIDTH  = 128 ;                                                                
parameter SEG1  = 64 ;                                                                     
parameter SEG2  = 128 ;                                                                    
                                                                                           
parameter P_ONE   = 64'd1 ;                                                                
parameter PINV    = 64'd18446462594437939201; // inverse N                                    
                                                                                           
output [P_WIDTH-1:0] MulB0_out ;                                                           
output [P_WIDTH-1:0] MulB1_out ;                                                           
output [P_WIDTH-1:0] MulB2_out ;                                                           
output [P_WIDTH-1:0] MulB3_out ;                                                           
output [P_WIDTH-1:0] MulB4_out ;                                                           
output [P_WIDTH-1:0] MulB5_out ;                                                           
output [P_WIDTH-1:0] MulB6_out ;                                                           
output [P_WIDTH-1:0] MulB7_out ;                                                           
output [P_WIDTH-1:0] MulB8_out ;                                                           
output [P_WIDTH-1:0] MulB9_out ;                                                           
output [P_WIDTH-1:0] MulB10_out ;                                                          
output [P_WIDTH-1:0] MulB11_out ;                                                          
output [P_WIDTH-1:0] MulB12_out ;                                                          
output [P_WIDTH-1:0] MulB13_out ;                                                          
output [P_WIDTH-1:0] MulB14_out ;                                                          
output [P_WIDTH-1:0] MulB15_out ;                                                          

output [P_WIDTH-1:0] MulA0_out ;								                                                           
output [P_WIDTH-1:0] MulA1_out ;                                                           
output [P_WIDTH-1:0] MulA2_out ;                                                           
output [P_WIDTH-1:0] MulA3_out ;                                                           
output [P_WIDTH-1:0] MulA4_out ;                                                           
output [P_WIDTH-1:0] MulA5_out ;                                                           
output [P_WIDTH-1:0] MulA6_out ;                                                           
output [P_WIDTH-1:0] MulA7_out ;  
output [P_WIDTH-1:0] MulA8_out ;                                                         
output [P_WIDTH-1:0] MulA9_out ;                                                           
output [P_WIDTH-1:0] MulA10_out ;                                                          
output [P_WIDTH-1:0] MulA11_out ;                                                          
output [P_WIDTH-1:0] MulA12_out ;                                                          
output [P_WIDTH-1:0] MulA13_out ;                                                          
output [P_WIDTH-1:0] MulA14_out ;                                                          
output [P_WIDTH-1:0] MulA15_out ;                                                          
                                                                                           
                                                     
input [P_WIDTH-1:0]  ROMD0_in ;                                                            
input [SD_WIDTH-1:0] ROMD1_in ;                                                            
input [SD_WIDTH-1:0] ROMD2_in ;                                                            
input [SD_WIDTH-1:0] ROMD3_in ;                                                            
input [SD_WIDTH-1:0] ROMD4_in ;                                                            
input [SD_WIDTH-1:0] ROMD5_in ;                                                            
input [SD_WIDTH-1:0] ROMD6_in ;                                                            
input [SD_WIDTH-1:0] ROMD7_in ;                                                            

input [P_WIDTH-1:0]  RA0D_in ;								                         
input [P_WIDTH-1:0]  RA1D_in ;                                                             
input [P_WIDTH-1:0]  RA2D_in ;                                                             
input [P_WIDTH-1:0]  RA3D_in ;                                                             
input [P_WIDTH-1:0]  RA4D_in ;                                                             
input [P_WIDTH-1:0]  RA5D_in ;                                                             
input [P_WIDTH-1:0]  RA6D_in ;                                                             
input [P_WIDTH-1:0]  RA7D_in ;  
input [P_WIDTH-1:0]  RA8D_in ;                                                           
input [P_WIDTH-1:0]  RA9D_in ;                                                             
input [P_WIDTH-1:0]  RA10D_in ;                                                            
input [P_WIDTH-1:0]  RA11D_in ;                                                            
input [P_WIDTH-1:0]  RA12D_in ;                                                            
input [P_WIDTH-1:0]  RA13D_in ;                                                            
input [P_WIDTH-1:0]  RA14D_in ;                                                            
input [P_WIDTH-1:0]  RA15D_in ;                                                            
input [1:0]          Mul_sel ;                                                             
                                                         
                                                                                           
                                                                                           
                                                                                           
	//                                                                                       
	assign MulB0_out = (Mul_sel==1'd1) ? P_ONE : 64'd0;                                 
	//                                                                                       
	assign MulB1_out  = (Mul_sel==1'd1) ? ROMD0_in : 64'd0 ;                                         
	//                                                                                       
	assign MulB2_out  = (Mul_sel==1'd1) ? ROMD1_in[SEG2-1:SEG1] : 64'd0 ;				                         
	//                                                                                       
	assign MulB3_out  = (Mul_sel==1'd1) ? ROMD1_in[SEG1-1:0] : 64'd0 ;			                         
	//                                                                                       
	assign MulB4_out  = (Mul_sel==1'd1) ? ROMD2_in[SEG2-1:SEG1] : 64'd0 ;							                         
	//                                                                                       
	assign MulB5_out  = (Mul_sel==1'd1) ? ROMD2_in[SEG1-1:0] : 64'd0 ;	                                     
	//                                                                                       
	assign MulB6_out  = (Mul_sel==1'd1) ? ROMD3_in[SEG2-1:SEG1] : 64'd0 ;				                         
	//                                                                                       
	assign MulB7_out  = (Mul_sel==1'd1) ? ROMD3_in[SEG1-1:0] : 64'd0 ;	                                     
	//                                                                                       
	assign MulB8_out  = (Mul_sel==1'd1) ? ROMD4_in[SEG2-1:SEG1] : 64'd0 ;				                         
	//                                                                                       
	assign MulB9_out  = (Mul_sel==1'd1) ? ROMD4_in[SEG1-1:0] : 64'd0 ;	                                     
	//                                                                                       
	assign MulB10_out = (Mul_sel==1'd1) ? ROMD5_in[SEG2-1:SEG1] : 64'd0 ;				                         
	//                                                                                       
	assign MulB11_out = (Mul_sel==1'd1) ? ROMD5_in[SEG1-1:0] : 64'd0 ;	                                     
	//                                                                                       
	assign MulB12_out = (Mul_sel==1'd1) ? ROMD6_in[SEG2-1:SEG1] : 64'd0 ;				                         
	//                                                                                       
	assign MulB13_out = (Mul_sel==1'd1) ? ROMD6_in[SEG1-1:0] : 64'd0 ;	                                     
	//                                                                                       
	assign MulB14_out = (Mul_sel==1'd1) ? ROMD7_in[SEG2-1:SEG1] : 64'd0 ;				                         
	//                                                                                       
	assign MulB15_out = (Mul_sel==1'd1) ? ROMD7_in[SEG1-1:0] : 64'd0 ;	                                     
	                                                                                         
	                                                                                         
    // change RA output position in IFFT                 
	assign MulA0_out = (Mul_sel==1'd1) ? RA0D_in : 64'd0; 

	assign MulA1_out = (Mul_sel==1'd1) ? RA1D_in : 64'd0;                                
	//                                                                                       
	assign MulA2_out = (Mul_sel==1'd1) ? RA2D_in : 64'd0;                                
	//                                                                                       
	assign MulA3_out = (Mul_sel==1'd1) ? RA3D_in : 64'd0;                                
	//                                                                                       
	assign MulA4_out = (Mul_sel==1'd1) ? RA4D_in : 64'd0;                                
	//                                                                                       
	assign MulA5_out = (Mul_sel==1'd1) ? RA5D_in : 64'd0;                                
	//                                                                                       
	assign MulA6_out = (Mul_sel==1'd1) ? RA6D_in : 64'd0;                                
	//                                                                                       
	assign MulA7_out = (Mul_sel==1'd1) ? RA7D_in : 64'd0;             
	//
	assign MulA8_out = (Mul_sel==1'd1) ? RA8D_in : 64'd0;                                 
	//                                                                                       
	assign MulA9_out = (Mul_sel==1'd1) ? RA9D_in : 64'd0;                                 
	//                                                                                       
	assign MulA10_out = (Mul_sel==1'd1) ? RA10D_in : 64'd0;                               
	//                                                                                       
	assign MulA11_out = (Mul_sel==1'd1) ? RA11D_in : 64'd0;                               
	//                                                                                       
	assign MulA12_out = (Mul_sel==1'd1) ? RA12D_in : 64'd0;                               
	//                                                                                       
	assign MulA13_out = (Mul_sel==1'd1) ? RA13D_in : 64'd0;                               
	//                                                                                       
	assign MulA14_out = (Mul_sel==1'd1) ? RA14D_in : 64'd0;                               
	//                                                                                       
	assign MulA15_out = (Mul_sel==1'd1) ? RA15D_in : 64'd0;                               
	                                                                                         
	                                                                                         
endmodule                                                                                  
