`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2023 10:17:20 PM
// Design Name: 
// Module Name: tb
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


module tb;
 // Inputs
reg clk;
reg increase_duty;
reg decrease_duty;
// Outputs
wire PWM_OUT;
// Instantiate the PWM Generator with variable duty cycle in Verilog
PWM PWM_Generator_Unit(
 .clk(clk), 
 .increase_duty(increase_duty), 
 .decrease_duty(decrease_duty), 
 .PWM_OUT(PWM_OUT)
);
// Create 100Mhz clock
initial begin
clk = 0;
forever #5 clk = ~clk;
end 
initial begin
 increase_duty = 0;
 decrease_duty = 0;
 #100; 
   increase_duty = 1; 
 #100;// increase duty cycle by 10%
   increase_duty = 0;
 #100; 
   increase_duty = 1;
 #100;// increase duty cycle by 10%
   increase_duty = 0;
 #100; 
   increase_duty = 1;
 #100;// increase duty cycle by 10%
   increase_duty = 0;
 #100;
   decrease_duty = 1; 
 #100;//decrease duty cycle by 10%
   decrease_duty = 0;
 #100; 
   decrease_duty = 1;
 #100;//decrease duty cycle by 10%
   decrease_duty = 0;
 #100;
   decrease_duty = 1;
 #100;//decrease duty cycle by 10%
   decrease_duty = 0;
end
endmodule