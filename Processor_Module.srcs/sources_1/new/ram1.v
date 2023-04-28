`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2023 01:53:58 AM
// Design Name: 
// Module Name: ram1
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


module ram1( clk , we, addr, din, dout );

	input 	clk, we; 
	input 	[15:0] addr; 
	input 	[15:0] din; 
	output 	[15:0] dout; 

	//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
	ram_256x16 ram (
  .clka(clk), // input clka
  .wea(we), // input [0 : 0] wea
  .addra(addr), // input [7 : 0] addra
  .dina(din), // input [15 : 0] dina
  .douta(dout) // output [15 : 0] douta
	);
	// INST_TAG_END ------ End INSTANTIATION Template ---------

endmodule
