`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2023 06:12:37 AM
// Design Name: 
// Module Name: Button_Press
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


module Button_Press(
  input clk,  // 100 MHz clock input
  input [3:0] BUTTONS,  // Button inputs
  output wire Increase_duty,  // Output to increase duty cycle
  output wire Decrease_duty  // Output to decrease duty cycle
);

  reg [27:0] counter_debounce = 0;  // Counter for creating slow clock enable signals
  wire slow_clk_enable;  // Slow clock enable signal for debouncing FFs
  reg [1:0] button_state = 2'b11;  // Current state of button inputs (0: released, 1: pressed)
  
  // Debouncing button inputs
  always @(posedge clk) begin
    counter_debounce <= counter_debounce + 1;
  end
  
  assign slow_clk_enable = counter_debounce >= 1 ? 1'b1 : 1'b0;

  always @(posedge clk) begin
    if (slow_clk_enable) begin
    button_state <= {BUTTONS, button_state[1:0]};  // Update button state
    end
  end

  // Generate increase_duty and decrease_duty signals based on button presses
  assign Increase_duty = button_state == 2'b01 ? 1'b1 : 1'b0;
  assign Decrease_duty = button_state == 2'b10 ? 1'b1 : 1'b0;

  // Debouncing DFFs for button inputs
  wire wire1, wire2, wire3, wire4;
  DFF_PWM button_dff1(clk, slow_clk_enable, button_state[0], wire1);
  DFF_PWM button_dff2(clk, slow_clk_enable, wire1, wire2);
  DFF_PWM button_dff3(clk, slow_clk_enable, button_state[1], wire3);
  DFF_PWM button_dff4(clk, slow_clk_enable, wire3, wire4);
  
endmodule
