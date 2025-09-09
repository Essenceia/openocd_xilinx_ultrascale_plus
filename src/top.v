module top (
	input wire Clk_100mhz_p_i, 
	input wire Clk_100mhz_n_i,

	output wire [3:0] Led_o 
);

assign Led_o = 4'b1010;

endmodule
