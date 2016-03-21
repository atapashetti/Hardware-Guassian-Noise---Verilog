`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2016 02:50:11 PM
// Design Name: 
// Module Name: cos_sine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cos_sine(clk, rst, U1, g0, g1 );
input clk, rst;
input [15:0] U1;
output [15:0] g0, g1;

reg [18: 0] c0[127:0];
reg [11:0] c1[127:0];

wire [1:0]quad;
reg [13:0]xga, xgb, yga, ygb;

initial begin
$readmemh("Z:\ELEN249\netlist\ip_catalog\HwNG\HwNG.srcs\sources_1\new\cos_coef_c0.txt", c0);
$readmemh("Z:\ELEN249\netlist\ip_catalog\HwNG\HwNG.srcs\sources_1\new\cos_coef_c1.txt", c1);
end

always @(posedge clk) begin
if((!rst) )
	begin
	//   g0 = sin(2* pi* U1);
     // g1 = cos(2* pi* U1);
     
     // range reduction
     quad =  U1[15:14];
     xga = U1[13:0];
     xgb =  14'h1fff- U1[13:0] ;// g0 = fi(1-2^-14,1,14,14); g0.hex = 1fff
     
     //approximate cos and sine values
     yga = c1[xga[6:0]] *  xga[6:0] + c1[xga[6:0]];
     ygb = c1[xgb[6:0]] * xgb[6:0] + c1[xgb[6:0]];
     
     //range reconstruction
    case( quad)       
             2'b00 : begin
                     g0 =  ygb;
                     g1 =  yga;
                                         
                 end
     
             2'b01 : begin
                     g0 =  yga;
                     g1 =  -ygb;
                 end
         
             2'b10 : begin
                     g0 =  -ygb;
                     g1 = - yga;
                 end
         
             2'b11 : begin
                     g0 =  -yga;
                     g1 =  ygb;
                 end   
	endcase
	end
end
endmodule
