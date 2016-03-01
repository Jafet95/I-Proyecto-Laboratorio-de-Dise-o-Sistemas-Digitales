`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:52:22 02/15/2015 
// Design Name: 
// Module Name:    Universal_Binary_Counter 
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
module Universal_Binary_Counter
	
	# (parameter N = 4)
	(
		input wire clk,
		input wire reset,
		input wire en,
		input wire load,
		input wire up,
		input wire sys_clr,
		input wire [N-1:0] d,
		output wire max_value_tick,
		output wire min_value_tick,
		output wire [N-1:0] q
		
    );

//Signal Declarations
reg [N-1:0] q_act, q_next;


//Body of "state" registers
always@(posedge clk,posedge reset)
	if(reset)
		q_act <= 4'h0;
	else
		q_act <= q_next;

//Specified functions of the counter 		
always@*
	if(sys_clr)
		q_next = 4'h0;
	else if(load)
		q_next = d;
	else if(en & up)
		q_next = q_act + 4'h1;
	else if(en & ~up)
		q_next = q_act - 4'h1;
	else
		q_next = q_act;


//Output Logic
assign q = q_act;
assign max_value_tick = (q_act == 2**N - 1) ? 1'b1:1'b0;
assign min_value_tick = (q_act == 0) ? 1'b1:1'b0; 
endmodule
