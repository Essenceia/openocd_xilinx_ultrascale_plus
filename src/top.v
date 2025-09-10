module top (
	input wire Clk_100mhz_p_i, 
	input wire Clk_100mhz_n_i,

	output wire [3:0] Led_o 
);
    wire        clk_ibuf;
	reg  [28:0] ctr_q; 
	reg         unused_ctr_q;


    IBUFDS #(
        .DIFF_TERM("TRUE"),
        .IOSTANDARD("LVDS")
    ) m_ibufds (
        .I(Clk_100mhz_p_i),
        .IB(Clk_100mhz_n_i),
        .O(clk_ibuf)
    );

    BUFG m_bufg (
        .I(clk_ibuf),
        .O(clk)
    );

	always @(posedge clk)
		{ unused_ctr_q, ctr_q } <= ctr_q + 29'b1;	
	
	assign Led_o = ctr_q[28:25];
endmodule
