`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:20 02/21/2016 
// Design Name: 
// Module Name:    Contador_conResetEnable 
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
module Contador_conResetEnable
	# (parameter N = 4) // Para definir el número de bits del contador
	(
		input wire clk,
		input wire reset,
		input wire en,
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

	if(en)
		q_next = q_act + 1'b1;
		
	else
		q_next = q_act;


//Output Logic
assign q = q_act;

endmodule
