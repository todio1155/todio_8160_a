`timescale 1us / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2026 10:39:41
// Design Name: 
// Module Name: RTL
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

//
module RTL(

    //'ifdef
    //inout wire vdd;
    //inout wire vss;
    //'enddif
       
    input clk,
    input [15:0] set,
    input rest,
    output logic se

    );

    logic [15:0] pulse = '0; 
    
    always_ff @(posedge clk) begin// a cada borda de sobida positiva(posedeg) do clock(borda e quando o 0 vira 1 e o sv ver essa sobida e ativa esse bloco)
    
        if(rest & (~pulse[15])) begin // REST não estar invertido!!!
            
            if (set[15]) begin // se set bit numero 15 e high(1) então o if funciona se não vai para o else
                pulse <= set[14:0];
                pulse[15] <= '0;
            
            end else begin
            pulse <= pulse + 1'b1; // soma um pulso(1'b1) no pulse           
            end
            
            if(pulse >= 15'd32767) begin // overflow
                pulse <= '0;
            
            end
            se <= pulse[15]; // digito numero 15 do pulse
        end                    
    end 
endmodule   //codigo não operacional ainda não terminado
    