`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:03:15 02/21/2016 
// Design Name: 
// Module Name:    Contador_Ascendente_Descendente 
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
module Contador_Ascendente_Descendente

	# (parameter N = 4) // Para definir el número de bits del contador
	(
		input wire clk,
		input wire reset,
		input wire enUP,
		input wire enDOWN,
		output wire [N-1:0] q
    );

//Signal Declarations
reg [N-1:0] q_act, q_next;


//Body of "state" registers
always@(posedge clk,posedge reset)
	if(reset)
		q_act <= 0;
	else
		q_act <= q_next;

//Specified functions of the counter 		
always@*

	if(enUP)
		q_next = q_act + 1'b1;
	
	else if (enDOWN)
		q_next = q_act - 1'b1;
		
	else
		q_next = q_act;


//Output Logic
assign q = q_act;

endmodule
