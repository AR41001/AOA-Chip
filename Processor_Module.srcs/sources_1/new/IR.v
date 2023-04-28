`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2023 01:48:36 AM
// Design Name: 
// Module Name: IR
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


module IR(clk, reset,Din, Dout, ld);

	input 	clk, reset, ld; 
	input 	 [15:0] Din;
	output reg  	[15:0] Dout;  
	
	// Behavioral section for writing to the register 
	always @ ( posedge clk or posedge reset ) 
		if (reset) 
			Dout <= 16'b0; 
		else 
			if (ld) 
					Dout <= Din;  
			else	Dout <= Dout; 
			
endmodule

