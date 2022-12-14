`timescale 1ns / 1ps

module fast2slow_tb();

reg sys_clk_fast; 
reg sys_clk_slow; 
reg sys_rst_n; 
reg read ;
initial begin
    sys_clk_fast = 1'b0;
    sys_clk_slow = 1'b0;
    sys_rst_n = 1'b0;

    read = 1'b0;

    #200
    sys_rst_n = 1'b1;

    #100
    read = 1'b1;

    #20
    read = 1'b0;
    #100
    read = 1'b1;
    #20
    read = 1'b0;

end

 always #10 sys_clk_fast = ~sys_clk_fast;
 always #30 sys_clk_slow = ~sys_clk_slow;

fast2slow fast2slow_inst(
    .clk_fast       (sys_clk_fast ),
    .clk_slow       (sys_clk_slow ),
    .sys_rst_n      (sys_rst_n),
    .read           (read),
    .read_sync_pulse() 
 );
endmodule

