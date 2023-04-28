`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2023 03:47:35 AM
// Design Name: 
// Module Name: Processor
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


module Processor(clk, reset, D_out,D_OUT, Address, D_in,inc, dec, mw_en, status);
	input 	clk, reset; 
	input 	[15:0] D_in; 
	output 	 D_out;
	output  inc, dec; 
	output [15:0] D_OUT;
	output Address;
	output 	[7:0] status; 
	output 	mw_en; 
	
	//wires: 
	wire 	[15:0] ir_out; 
	wire 	N, Z, C; 
	wire 	[2:0] W_Adr, R_Adr, S_Adr; 
	wire 	adr_sel, s_sel; 
	wire 	pc_ld, pc_inc, pc_sel, ir_ld; 
	wire 	rw_en; 
	wire	[3:0] Alu_Op; 
	
	// This instantiates the Control Unit module. We use this as a way to inner
	// connect the wires,inputs,and outputs from this module to the inputs,outputs
	// and wires from the control unit module.
	cu		u0 ( .clk(clk), .reset(reset), .IR(ir_out), .N(N), .Z(Z), .C(C),
					.W_Adr(W_Adr), .R_Adr(R_Adr), .S_Adr(S_Adr), 						 
					.adr_sel(adr_sel), .s_sel(s_sel), 							
					.pc_ld(pc_ld), .pc_inc(pc_inc), .pc_sel(pc_sel), .ir_ld(ir_ld), 	
					.mw_en(mw_en), .rw_en(rw_en), .alu_op(Alu_Op), .status(status)); 
			 
	// This instantiates the CPU_EU module that we use in order to inner connects 
	// the I/O and wires of this module to the I/O and wires from the cpu_eu.
	CPU_EU u1 ( .clk(clk), .reset(reset), 
					.pc_ld(pc_ld), .pc_sel(pc_sel), .pc_inc(pc_inc), .ir_ld(ir_ld), 
					.adr_sel(adr_sel), .W_En(rw_en), .S_Sel(s_sel), 
					.address(Address), .D_out(D_out), .D_in(D_in), .C(C), .N(N), .Z(Z),
					.W_Adr(W_Adr), .R_Adr(R_Adr), .S_Adr(S_Adr), .Alu_Op(Alu_Op), .ir_out(ir_out)); 
					
	Button_Press u3 ( .clk(clk), .BUTTONS(D_in), .Increase_duty(inc), .Decrease_duty(dec));
				
	PWM_Generator      u2 ( .clk(clk), .increase_duty(inc), .decrease_duty(dec), .PWM_OUT(D_OUT) );
	
    //Button_Press       u3 (  .clk(clk),  .BUTTONS(D_in), .Increase_duty(D_out), .Decrease_duty(D_out));
    



endmodule
