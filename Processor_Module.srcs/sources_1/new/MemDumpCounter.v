`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2023 01:51:42 AM
// Design Name: 
// Module Name: MemDumpCounter
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


module MemDumpCounter( clk, reset, addr );
	input clk, reset; 
	output reg [15:0] addr; 
	
	always @ (posedge clk or posedge reset)
	begin 
		if (reset == 1'b1) 
		addr <= 16'b0000_0000_0000_0000; 
		else 
		addr <= addr + 16'b0000_0000_0000_0001; 
	end 

endmodule

