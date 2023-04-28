`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2023 05:36:46 AM
// Design Name: 
// Module Name: clk_500_Hz
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


module clk_500_Hz( clk_in, reset, clk_out );
 
	input	 	clk_in, reset; 
	output 	clk_out; 
	reg 		clk_out; 
	integer 	i; 
	//***************************************************************
	// The following verilog code will "divide" an incoming clock 
	// by the 32-bit decimal value specified in the "if condition" 
	// 
	// The value of the timer that counts the incoming clock ticks 
	// is equal to [ (Incoming Freq / Outgoing Freq) / 2 ]
	//***************************************************************

		always@ (posedge clk_in or posedge reset) begin
		if (reset == 1'b1) begin 
			i = 0; 
			clk_out = 0; 
		end 
		//got a clock, so increment the counter and
		//test to see if half a period has elapsed
		else begin 
			i = i+1; 
			if (i >= ((100000000/500)/2)) begin 
				clk_out = ~clk_out; 
				i=0; 
			end//if
		end//else
	end //always
endmodule
