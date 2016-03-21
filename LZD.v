`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2016 12:50:02 PM
// Design Name: 
// Module Name: LZD_2
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

module LZD_2 (clk,  a, p,  v);
input clk;
input [1:0] a;
output reg p , v;

	always @(posedge clk)
	begin
		case(a)
			2'b11: 	begin
						p <= 1'b0;
						v <= 1'b1;
	                 end

			2'b10: begin
						p <= 1'b0;
						v <= 1'b1;
					end

			2'b01: 	begin
						p <= 1'b1;
						v <= 1'b1;
					end

			2'b00: 	begin
						p <= 1'b0;
						v <= 1'b0;
					end

			default: begin
						p <= 1'bx;
						v <= 1'bx;
					end
		endcase
	end
endmodule

// Create Date: 03/20/2016 12:50:02 PM
// Design Name: 
// Module Name: LZD_4

module LZD_4 (clk,  a, p,  v);
input clk;
input [3:0] a;
output reg  v;
output reg  [1:0]p;
 
wire vl, pl, vr, pr;

//left lzd
	LZD_2 lzdL(.clk(clk), 
	        .a(a[3:2]), 
	        .p(pl),
	        .v(vl));	
//right lzd        	
	LZD_2 lzdR(.clk(clk), 
	         .a(a[1:0]), 
	         .p(pr),
             .v(vr));	

	always @(posedge clk, pl, pr, vl, vr)
	begin

		v <= vl | vr;
				
		if(vl == 1'b1)
		begin
			p <= {1'b0, pl};
		end

		else if(vl == 1'b0)
		begin
			p <= {1'b1, pr};
		end
	end

endmodule

// Create Date: 03/20/2016 12:50:02 PM
// Design Name: 
// Module Name: LZD_8

module LZD_8 (clk,  a, p,  v);
input clk;
input [7:0] a;
output reg  v;
output reg  [2:0]p;
 
wire vl, vr;
wire [1:0] pl, pr;

//left lzd
	LZD_4 lzd4L(.clk(clk), 
	        .a(a[7:4]), 
	        .p(pl),
                        .v(vl));
//right lzd        	
	LZD_4 lzd4R(.clk(clk), 
	         .a(a[3:0]), 
	         .p(pr),
             .v(vr));

	always @(posedge clk, pl, pr, vl, vr)
	begin

		v <= vl | vr;
				
		if(vl == 1'b1)
		begin
			p <= {1'b0, pl};
		end

		else if(vl == 1'b0)
		begin
			p <= {1'b1, pr};
		end
	end

endmodule

// Create Date: 03/20/2016 12:50:02 PM
// Design Name: 
// Module Name: LZD_16

module LZD_16 (clk,  a, p,  v);
input clk;
input [15:0] a;
output reg  v;
output reg  [3:0]p;
 
wire vl, vr;
wire [2:0] pl, pr;

//left lzd
	LZD_8 lzd8L(.clk(clk), 
	        .a(a[15:8]), 
            .p(pl),
            .v(vl));	
//right lzd        	
	LZD_8 lzd8R(.clk(clk), 
	         .a(a[7:0]), 
	         .p(pr),
             .v(vr));

	always @(posedge clk, pl, pr, vl, vr)
	begin

		v <= vl | vr;
				
		if(vl == 1'b1)
		begin
			p <= {1'b0, pl};
		end

		else if(vl == 1'b0)
		begin
			p <= {1'b1, pr};
		end
	end

endmodule

// Create Date: 03/20/2016 12:50:02 PM
// Design Name: 
// Module Name: LZD_32

module LZD_32 (clk,  a, p,  v);
input clk;
input [31:0] a;
output reg  v;
output reg  [4:0]p;
 
wire vl, vr;
wire [3:0] pl, pr;

//left lzd
	LZD_16 lzd16L(.clk(clk), 
	        .a(a[31:16]), 
	        .p(pl),
            .v(vl));	
//right lzd        	
	LZD_16 lzd16R(.clk(clk), 
	         .a(a[15:0]), 
	         .p(pr),
              .v(vr));		

	always @(posedge clk, pl, pr, vl, vr)
	begin

		v <= vl | vr;
				
		if(vl == 1'b1)
		begin
			p <= {1'b0, pl};
		end

		else if(vl == 1'b0)
		begin
			p <= {1'b1, pr};
		end
	end

endmodule


// Create Date: 03/20/2016 12:50:02 PM
// Design Name: 
// Module Name: LZD_48
/*
module LZD_48 (input clk, input [47:0] a, output reg [5:0] p, output reg v);

wire vl, vr;
wire [4:0] pl;
wire [3:0] pr;
reg vr1;
reg [3:0] pr1;

	LZD_32 L9(.clk(clk), .a(a[47:16]), .p(pl[4:0]) , .v(vl));		// Left LZD32
	LZD_16 L10(.clk(clk), .a(a[15:0]), .p(pr[3:0]), .v(vr));		// Right LZD16

	always @(posedge clk, pl, pr, vl, vr)
	begin

		// Re-timing LZD16 OPs as they come one cycle early
		vr1 <= vr;
		pr1 <= pr;

		// LZD Algorithm
		v <= vl | vr1;
				
		if(vl == 1'b1)
		begin
			p <= {1'b0, pl};
		end

		else if(vl == 1'b1)// && vl == 1'b0)
		begin
			p <= {2'b1, pr1};
		end

	end

endmodule
*/

module LZD_48 (clk,  a, p,  v);
input clk;
input [47:0] a;
output reg  v;
output reg  [5:0]p;
 
wire vl, vr;
wire [4:0] pl;
wire [3:0] pr;
reg vr1;
reg [3:0] pr1;


//left lzd
	LZD_32 lzd32L(.clk(clk), 
	        .a(a[47:16]), 
	        .p(pl),
            .v(vl));	
//right lzd        	
	LZD_16 lzd16R(.clk(clk), 
	         .a(a[15:0]), 
	         .p(pr),
	         .v(vr));		

	always @(posedge clk, pl, pr, vl, vr)
	begin
    
      // Re-timing LZD16 OPs as they come one cycle early
      //used this fix from Prateek Sharma
          vr1 <= vr;
           pr1 <= pr;
            
		v <= vl | vr1;
				
		if(vl == 1'b1)
		begin
			p <= {1'b0, pl};
		end

		else if(vr1 == 1'b1)// && vl == 1'b0)
		begin
			p <= {2'b10, pr1};
		end
	end
endmodule
