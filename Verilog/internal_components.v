/*
Internal Componments
Author: Elliott Varasdi

This file contains modules for the 16-processors interal components

Version: 0.01

*/


// OPCODE: 15:13 opcode, 12:9 rx,  8:5  ry

// OPCODE: 15:13 opcode, 12:9 rx,  8:0 Imm

module sign_ext(
	input [8:0] in,
	output [15:0] out
	);
	/*
	Takes in the IMM value and extends it from 9 bits to 16
	*/

	assign out = {{7{in[8]}}, in};
	
endmodule



module flipflop (
    input  d,
    input  clk,
    input  rst, 
	 input  start_value,		//Some flip flops reset to different values
    output reg q
);

    always @(posedge clk) begin
        if (rst)
            q <= start_value;
        else 
            q <= d; // next state for flip flop
    end

endmodule


module tick_FSM(
	input rst,
	input clk,
	input en,
	output [3:0] tick
	);
	/*
	One-hot coding
	Controls the current tick for the current operation. 
	*/