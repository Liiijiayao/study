module slow2fast_EdgeDetect(
    input  wire     clk_slow,
    input  wire     clk_fast,
    input  wire     data_from_slow,
    output wire     data_to_fast
    );

    reg  data_from_slow_r;

    reg  data_d;
    reg  data_d1;
    reg  data_d2;

    always@(posedge clk_slow) begin 
        data_from_slow_r <= data_from_slow;
    end

    always@(posedge clk_fast) begin 
        data_d  <= data_from_slow_r;
        data_d1 <= data_d;
        data_d2 <= data_d1;
    end

assign data_to_fast = data_d1;
assign data_to_fast_posedge  = data_d1 & ~data_d2;//上升沿检测
assign data_to_fast_negedge  = ~data_d1 & data_d2;//下降沿检测
endmodule

