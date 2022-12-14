`timescale 1ns/1ps

module fast2slow ( 
    input clk_fast , //快时钟信号
    input read , //信号，快时钟信号
    input clk_slow , //慢时钟信号

    input sys_rst_n , //复位信号，低电平有效
    output wire read_sync_pulse //输出信号
);

 //reg define
 reg read_dly1 ;
 reg read_dly2 ;
 reg read_or ;

 reg read_sync ;
 reg read_sync_dly1 ;
 reg read_sync_dly2 ;

 always @(posedge clk_fast or negedge sys_rst_n) begin
    if (sys_rst_n ==1'b0) 
        read_dly1 <= 1'b0;
    else 
        read_dly1 <=read;
 end

 always @(posedge clk_fast or negedge sys_rst_n) begin
    if (sys_rst_n ==1'b0) 
        read_dly2 <= 1'b0;
    else 
        read_dly2 <= read_dly1 ;
 end

 always @(posedge clk_fast or negedge sys_rst_n) begin
    if (sys_rst_n ==1'b0) 
        read_or <= 1'b0;
    else 
        read_or <= read | read_dly1 | read_dly2;
 end

//同步过程，clk_slow采样read_or,再打两拍
 always @(posedge clk_slow or negedge sys_rst_n) begin
    if (sys_rst_n ==1'b0) begin
        read_sync <= 1'b0;
    end
    else 
        read_sync <= read_or;
 end

 always @(posedge clk_slow or negedge sys_rst_n) begin
    if (sys_rst_n ==1'b0) 
        read_sync_dly1 <= 1'b0;
    else
        read_sync_dly1 <= read_sync;
 end

 always @(posedge clk_slow or negedge sys_rst_n) begin
    if (sys_rst_n ==1'b0) 
        read_sync_dly2<= 1'b0;
    else 
        read_sync_dly2 <= read_sync_dly1;
 end

 assign read_sync_pulse = read_sync_dly1 & ~read_sync_dly2;

 endmodule

