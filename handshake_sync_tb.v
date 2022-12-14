`timescale 1ns / 1ps

module handshake_sync_tb();

reg sys_clk1; 
reg sys_clk2; 
reg sys_rst_n; 
reg read ;
reg read1 ;
initial begin
    sys_clk1 = 1'b0;
    sys_clk2 = 1'b0;
    sys_rst_n = 1'b0;

    read = 1'b0;

    #200
    sys_rst_n = 1'b1;

    #110
    read = 1'b1;

    #20
    read = 1'b0;
    #400
    read = 1'b1;
    #20
    read = 1'b0;

end

 always #10 sys_clk1 = ~sys_clk1;
 always #30 sys_clk2 = ~sys_clk2;

always @(posedge sys_clk1 or negedge sys_rst_n)
        if (sys_rst_n ==1'b0) 
            read1 <= 1'b0;
        else 
            read1 <=read;
 handshake_sync u_handshake_sync(
    .clk1             (sys_clk1 ),
    .clk2             (sys_clk2 ),
    .sys_rst_n        (sys_rst_n),
    .read             (read1 ),
    .read_sync_pulse  (read_sync_pulse )
 );

endmodule

