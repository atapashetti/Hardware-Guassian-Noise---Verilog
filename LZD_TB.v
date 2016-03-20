`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2016 12:54:27 PM
// Design Name: 
// Module Name: LZD_TB
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


module LZD_TB( );
    
    parameter LZDbits = 32;
    parameter pBits =5;
    
    reg clk;
    reg [LZDbits-1:0] a;
    wire v;
    wire [pBits-1: 0] p;       
    
    LZD_8 lzd8(
    .clk(clk),  
    .a(a), 
    .p(p),  
    .v(v)
    );       
    
    always #10 clk = !clk;
      
    initial begin
    
        clk = 1'b0;
        
         #20; a = 32'h00000000;
         #20; a = 32'h00000001;
         #20; a = 32'h00000002;
         #20; a = 32'h00000004;
         #20; a = 32'h00000008;
         #20; a = 32'h00000008;
         #20; a = 32'h00000010;
         #20; a = 32'h00000021;
         #20; a = 32'h00000042;
         #20; a = 32'h00000084;
         #20; a = 32'h00000100;
         #20; a = 32'h00000208;
         
        //test case for LZD_8
                      /*
        #20; a = 8'h00;
       // #20; a = 8'h01;
        //#20; a = 8'h02;
        //#20; a = 8'h03;
       // #20; a = 8'h04;
        //#20; a = 8'h05;
      //  #20; a = 8'h06;
      //  #20; a = 8'h07;
      //  #20; a = 8'h08;
      //  #20; a = 8'h09;
      //  #20; a = 8'h0a;
      //  #20; a = 8'h0b;
      //  #20; a = 8'h0c;
        #20; a = 8'h0d;
        #20; a = 8'h0e;
        #20; a = 8'h0f;
 
        #20; a = 8'h10;
        #20; a = 8'h21;
        #20; a = 8'h32;
        #20; a = 8'h43;
        #20; a = 8'h54;
        #20; a = 8'h65;
        #20; a = 8'h76;
        #20; a = 8'h87;
        #20; a = 8'h98;
        #20; a = 8'ha9;
        #20; a = 8'hba;
        #20; a = 8'hcb;
        #20; a = 8'hdc;
        #20; a = 8'hed;
        #20; a = 8'hfe;
        #20; a = 8'hff;
        
        */
        //test case for LZD_4
              /*
        #100; a = 4'h0;
        #100; a = 4'h1;
        #100; a = 4'h2;
        #100; a = 4'h3;
        #100; a = 4'h4;
        #100; a = 4'h5;
        #100; a = 4'h6;
        #100; a = 4'h7;
        #100; a = 4'h8;
        #100; a = 4'h9;
        #100; a = 4'h8;
        #100; a = 4'ha;
        #100; a = 4'hb;
        #100; a = 4'hc;
        #100; a = 4'hd;
        #100; a = 4'he;
        #100; a = 4'hf;
        */
        
      //test case for LZD_2
      /*
        #100; a = 2'b00;
        #100; a = 2'b01;
        #100; a = 2'b10;
        #100; a = 2'b11;   
       */
                  
    end 

endmodule



