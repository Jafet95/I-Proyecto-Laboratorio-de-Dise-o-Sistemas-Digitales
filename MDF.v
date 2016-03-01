`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Engineer: Yermy Benavides
// 
// Create Date:    21:08:09 02/29/2016 
// Design Name: 
// Module Name:    MDF 
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
module MDF(clk,rst,entrada,salida,q);
input wire clk,rst;
input wire [3:0]entrada;
output wire salida;
output wire [10:0]q;
	  
Traductor Conv(
    .in(entrada), 
    .out(q), 
    .clk(clk), 
    .rst(rst)
    );
	 
DivFrec DF(
    .clk(clk), 
    .rst(rst), 
    .div(q), 
    .clkd(salida)
    );	 
	 

endmodule
