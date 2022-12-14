
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/08 11:25:42
// Design Name: 
// Module Name: freq_div_tb
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
module freq_div_tb();
 
	reg   clk;
	reg   rst;
	wire  clk_out;
 
	initial begin
		clk = 'd0;
		rst = 'd1;
		#20
		rst = 'd0;
	end
    
	always #10 clk = ~clk;

	freq_div_decimal inst_freq_div_decimal (
		.clk(clk), 
		.rst(rst), 
		.clk_out(clk_out)
	);
endmodule