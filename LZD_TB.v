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
    
    parameter LZDbits = 48;
    parameter pBits =5;
    
    reg clk;
    reg [LZDbits-1:0] a;
    wire v;
    wire [pBits-1: 0] p;       
    
    LZD_48 lzd(
    .clk(clk),  
    .a(a), 
    .p(p),  
    .v(v)
    );       
    
    always #10 clk = !clk;
      
    initial begin
    
        clk = 1'b0;
     
        clk = 1'b0;
            #20; a = 48'b10000000_00110001_00000000_00110001_00000000_00110001;     // 0
            #20; a = 48'b01000000_00110001_00100001_00110011_00000000_11111000;     // 1
            #20; a = 48'b00000000_00110001_00000001_00110011_00000000_00000101;    // 10
            #20; a = 48'b00000000_00010001_00000000_00010001_00000000_00000101;    // 11
            #20; a = 48'b00010000_00110001_00000000_00000011_00000000_00000101;    // 3
            #20; a = 48'b00000000_00000000_00000000_00000000_00000000_00000001;    // 47
            #20; a = 48'b00000000_00000000_00000000_00000000_00000000_00000101;    // 45    
            #20; a = 48'b00000000_00000000_00000000_00000000_00000000_00100101;    // 42
            #20; a = 48'b00000000_00000000_00000000_00000000_01000000_00000101;    // 33
            #20; a = 48'b00000011_00110011_00000000_00110001_00000000_00000101;    // 6
            #20; a = 48'b00001000_00110011_00000000_00110001_00000000_00000101;    // 4
                  
          //test case for LZD_32
     /*                      
         #20; a = 32'h00000000;
         #20; a = 32'h00000001;//31
         #20; a = 32'h00000002;//30
         #20; a = 32'h00000004;//29
         #20; a = 32'h00000008;//28
         #20; a = 32'h00000010;//27
         #20; a = 32'h00000021;//26
         #20; a = 32'h00000042;//25
         #20; a = 32'h00000084;//24
         #20; a = 32'h00000100;//23
         #20; a = 32'h00000208;//22
         
         #20; a = 32'h00000400;//21
         #20; a = 32'h00000801;//20
         #20; a = 32'h00001002;//19
         #20; a = 32'h00002004;//18
         #20; a = 32'h00004008;//17
         #20; a = 32'h00008008;//16
         #20; a = 32'h00010010;//15
         #20; a = 32'h00020021;//14
         #20; a = 32'h00040042;//13
         #20; a = 32'h00080084;//12
         #20; a = 32'h00100100;//11
         #20; a = 32'h00200208;//10
     
         #20; a = 32'h00400400;//9
         #20; a = 32'h00800801;//8
         #20; a = 32'h01001002;//7
         #20; a = 32'h02002004;//6
         #20; a = 32'h04004008;//5
         #20; a = 32'h08008008;//4
         #20; a = 32'h10010010;//3
         #20; a = 32'h20020021;//2
         #20; a = 32'h40040042;//1
         #20; a = 32'h80080084;//0
*/
         
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



