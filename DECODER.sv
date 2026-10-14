`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2026 00:24:24
// Design Name: 
// Module Name: DECODER
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DECODER(

    input logic [7:0] addr,
    input logic clk,
    
    output logic [255:0] out
    
    );
    
    always_ff @(posedge clk) begin
        out <= '0;
        out[addr] <= 1'b1;
    end   
endmodule //codigo não operacional ainda não terminado


