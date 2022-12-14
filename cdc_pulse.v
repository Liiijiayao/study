`timescale 1ns/1ps

module cdc_pulse(    
    sender_clk_i, 
    sender_reset_i,     	// sync high
    sender_pulse_i,
    
    receiver_clk_i, 
    receiver_reset_i,
    receiver_pulse_o
);

    input							sender_clk_i;
	input							sender_reset_i;
	input							sender_pulse_i;

	input							receiver_clk_i;
	input							receiver_reset_i;
	output							receiver_pulse_o;

 

 endmodule

