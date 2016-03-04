`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:57 03/03/2016 
// Design Name: 
// Module Name:    Modificacion_Ciclo_Trabajo 
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
module Modificacion_Ciclo_Trabajo(
	input wire clk_100MHz,
	input wire clk_de_trabajo,
	input wire rst,
	input wire up,
	input wire down,
	input wire func_select,
	input wire chip_select,
	output wire signal_out,
	output wire [3:0]ciclo_actual	
	
    );
	 
Comp_16bits Comparador (
    .in(q), 
    .out(signal_out), 
    .rst(rst), 
    .ref(ref), 
    .clk(clk_trabajo)
    );
 
Registro_Universal Reg_universal (
    .aumentar(up), 
    .disminuir(down), 
    .funct_select(func_select), 
    .clk(clk_100MHz), 
    .reset(rst), 
    .chip_select(chip_select), 
    .out_aumentar(out_aumentar), 
    .out_disminuir(out_disminuir), 
    .out_funct_select(out_funct_select)
    );

  
Contador_Ascendente_Descendente Intancia_Contador_AD (
    .clk(clk_100MHz), 
    .reset(rst), 
    .enUP(out_aumentar), 
    .enDOWN(out_disminuir), 
    .q(q)
    );
	 
Universal_Binary_Counter Contador_Binario (
    .clk(clk_100MHz), 
    .rst(rst), 
    .out(ref)
    );
assign ciclo_actual = q;
	 
endmodule
