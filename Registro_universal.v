`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:41 03/01/2016 
// Design Name: 
// Module Name:    Registro_universal 
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
module Registro_Universal

	(
		input wire aumentar, //boton aumentar
		input wire disminuir, //boton disminuir
		input wire funct_select, //seleccion funcion
		input wire clk, //system clock
		input wire reset, //system reset
		input wire chip_select, //Control data
		output reg out_aumentar, //boton aumentar
		output reg out_disminuir, //boton disminuir
		output reg out_funct_select //seleccion funcion      
    );

//body

//Combinacional
always@(posedge clk, posedge reset)
	if(reset)
		begin
		out_aumentar = 1'b0;
		out_disminuir = 1'b0;
		out_funct_select = 1'b0;
		end

//Secuencial
always@*
	case(chip_select)
		//hold
		1'b1:
		begin
		out_aumentar <= out_aumentar;
		out_disminuir <= out_disminuir;
		out_funct_select <= out_funct_select;
		end
		//load
		1'b0:
		begin
		out_aumentar <= aumentar;
		out_disminuir <= disminuir;
		out_funct_select <= funct_select;
		end
	endcase

endmodule

