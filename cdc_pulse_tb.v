`timescale 1ns / 1ps

module cdc_pulse_tb();



cdc_pulse
cdc_pulse(    
    .sender_clk_i               (), 
    .sender_reset_i             (),
    .sender_pulse_i             (),
    
    .receiver_clk_i             (), 
    .receiver_reset_i           (),
    .receiver_pulse_o           ()
);
endmodule

