`timescale 1ns / 1ps

module freq_div_decimal(
	clk,
	rst,
	clk_out
	);
    
    input          clk;
	input          rst;
	output         clk_out;
    
    reg  [3:0]   cnt1;
    reg  [3:0]   cnt2;
    reg          clk_out;

always @(posedge clk or posedge rst) begin  //7次2分频
	if (rst) begin
		cnt1 <= 'd0;
	end
	else if ((cnt2 < 'd7) &&(cnt1 == 'd1)) begin
		cnt1 <= 'd0;
	end
	else if (cnt1 == 'd2) begin
		cnt1 <= 'd0;
	end
	else begin
		cnt1 <= cnt1 + 'd1;
	end
end

always @(posedge clk or posedge rst) begin  //2次3分频
	if (rst) begin
		cnt2 <= 'd0;
	end
	else if ((cnt2 == 'd8) && (cnt1 == 'd2)) begin
		cnt2 <= 'd0;
	end
	else if ((cnt1 == 'd1) && (cnt2 < 'd7)) begin
		cnt2 <= cnt2 + 'd1;
	end
	else if (cnt1 == 'd2) begin
		cnt2 <= cnt2 + 'd1;
	end
	else begin
		cnt2 <= cnt2;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		clk_out <= 'd0;
	end
	else if ((cnt1 == 'd1) && (cnt2 < 'd7)) begin
		clk_out <= 'd1;
	end
	else if (cnt1 == 'd2) begin
		clk_out <= 'd1;
	end
	else begin
		clk_out <= 'd0;
	end
end
endmodule
