`timescale 1ns/1ps

module slow2fast_tb();

reg    clk_slow;
reg    clk_fast;
reg    data_from_slow;
reg    data_to_fast;

initial begin
    clk_slow = 1'b1;
    clk_fast = 1'b1;
  
    data_from_slow = 1'b0;
    #500
    data_from_slow = 1'b1;
    #400
    data_from_slow = 1'b0;
    #550
    data_from_slow = 1'b1;
    #900
    data_from_slow = 1'b0;

end

always #50  clk_fast <= ~clk_fast;
always #200 clk_slow <= ~clk_slow;

slow2fast_EdgeDetect inst_slow2fast_EdgeDetect(
    .clk_slow       (clk_slow),
    .clk_fast       (clk_fast),
    .data_from_slow (data_from_slow),
    .data_to_fast   ()

);

endmodule