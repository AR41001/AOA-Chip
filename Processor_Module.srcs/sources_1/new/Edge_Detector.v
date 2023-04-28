`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2023 06:05:12 AM
// Design Name: 
// Module Name: Edge_Detector
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


module Edge_Detector(
  input clk,
  input reset,
  input in,
  output reg out
);

  reg in_prev;
  
  always @(posedge clk, posedge reset) begin
    if (reset) begin
      in_prev <= 1'b0;
      out <= 1'b0;
    end else begin
      in_prev <= in;
      if (in && !in_prev) begin
        out <= 1'b1;
      end else begin
        out <= 1'b0;
      end
    end
  end
  
endmodule
