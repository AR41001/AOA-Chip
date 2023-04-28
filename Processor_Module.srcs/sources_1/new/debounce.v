`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2023 05:50:10 AM
// Design Name: 
// Module Name: debounce
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


module debounce( clk_in, reset, D_in, D_out );

	input  clk_in, reset, D_in; 
	output D_out; 
	wire	 D_out; 
	
	reg q9, q8, q7, q6, q5, q4, q3, q2, q1, q0; 
	
	always @ ( posedge clk_in or posedge reset) 
		if (reset == 1'b1)
			{q9, q8, q7, q6, q5, q4, q3, q2, q1, q0} <= 10'b0; 
		else begin 
			//Shift in the new sample that's on the D_in input.  
			q9 <= q8; q8 <= q7; q7 <= q6; q6 <= q5; q5 <= q4; 
			q4 <= q3; q3 <= q2; q2<=q1; q1 <= q0; q0 <= D_in; 
		end 
			//Create the debounced, one-shot pulse. 
			assign D_out = !q9 & q8 & q7 & q6 & q5 & 
						q4 & q3 & q2 & q1 & q0; 
						
endmodule
