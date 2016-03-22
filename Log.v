`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2016 03:56:09 PM
// Design Name: 
// Module Name: Log
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
module Log(clk, rst, U0, e);
input clk, rst;
input [47:0] U0;
output [30:0] e ;

reg [29: 0] c0[255:0];
reg [21:0] c1[255:0];
reg [12:0] c2[255:0];
reg [5:0] p;
reg [5:0] expe, e1;
reg [30:0]ye ;

wire v, ln2;
wire [47:0]U0;
wire [5:0] expe;


LZD_48 lzd(
    .clk(clk),  
    .a(U0), 
    .p(expe),  
    .v(v)
    );
    
initial begin
$readmemh("Z:\ELEN249\netlist\ip_catalog\HwNG\HwNG.srcs\sources_1\new\log_coef_c0.txt", c0);
$readmemh("Z:\ELEN249\netlist\ip_catalog\HwNG\HwNG.srcs\sources_1\new\log_coef_c1.txt", c1);
$readmemh("Z:\ELEN249\netlist\ip_catalog\HwNG\HwNG.srcs\sources_1\new\log_coef_c1.txt", c1);
end

always @(posedge clk) begin
if(!rst)
	begin
	
     // range reduction
    expe = expe +1;
    xe = U0 << expe;
     
     //approximate  values
     
     ye = c2[xe[7:0]] *  xe[7:0] * xe[7:0]  + c1[xe[7:0]] *  xe[7:0] + c1[xe[7:0]];
     //range reconstruction
    
    ln2 = 0.6931; // ln(2) = 0.6931
    e1 = expe * ln2;
    e = (e1 - ye) <<1; 
	end
end
endmodule