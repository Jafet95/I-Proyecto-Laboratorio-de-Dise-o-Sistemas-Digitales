`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:48 02/29/2016 
// Design Name: 
// Module Name:    DivFrec 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DivFrec(clk,rst,div,clkd);
input wire clk,rst;
input wire [10:0]div;
output wire clkd;

reg [10:0]q = 0;
reg cd = 0;


always@(posedge clk, posedge rst)
	if (rst)
		begin
		q <= 0;
		cd <=0;
		end
	else 
		if (q==div)
			begin
			q <= 0;
			cd <= ~cd;
			end
		else
			q <= q + 11'b1;
		
assign clkd = cd;


endmodule 