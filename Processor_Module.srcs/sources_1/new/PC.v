`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2023 01:52:34 AM
// Design Name: 
// Module Name: PC
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


module PC(clk, reset, ld, incr, Din, Dout);

	input 	clk, reset, ld, incr; 
	input 	[15:0] Din; 
	output reg 	[15:0] Dout;  
	
	// Behavioral section for writing to the register 
	always @ ( posedge clk or posedge reset ) 
		if (reset) 
			Dout <= 16'b0; 
		else 
			if (ld) 
					Dout <= Din; 
			else if (incr)
					Dout <= Dout + 1; 
			else	Dout <= Dout; 

endmodule

