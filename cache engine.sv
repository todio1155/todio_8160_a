`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2026 23:55:08
// Design Name: 
// Module Name: cache engine
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

//cache com sistema de indereço automatico






module cache(

    input logic [7:0] data,
    input logic [6:0] addr,
    input logic rest_n, //não invertido
    input logic clk,
    
    output logic [6:0] addrout,
    output logic [7:0] out

    );
    
    logic [7:0] cache0; //000 1
    logic [7:0] cache1; //001 2
    logic [7:0] cache2; //010 3
    logic [7:0] cache3; //011 4
    logic [7:0] cache4; //100 5
    logic [7:0] cache5; //101 6
    logic [7:0] cache6; //110 7
    logic [7:0] cache7; //111 8
    //8 byte(64bits) de cache
    
    logic [4:0] addra = '0; //auto addr 
    
    
    always_comb begin
    
        if(addr[3]) begin
            addra = '0;
 
        end 
        else if (cache0 == '0) begin
            addra = 4'd1;
        
        end 
        else if (cache1 == '0) begin
            addra = 4'd2;
            
        end
        else if (cache2 == '0) begin
            addra = 4'd3;
        
        end
        else if (cache3 == '0) begin
            addra = 4'd4;
        
        end
        else if (cache4 == '0) begin
            addra = 4'd5;
        
        end  
        else if (cache5 == '0) begin
            addra = 4'd6;
        
        end  
        else if (cache6 == '0) begin
            addra = 4'd7;
        
        end        
        else if (cache7 == '0) begin
            addra = 4'd8;
        
        end          
        
     
                              
    end
    
    always_ff @(posedge clk) begin  
        
        if(rest_n) begin
            if(addra >= 1'b1) begin
                unique case(addra[4:0])
                
                5'd0: cache0 <= data;
                5'd1: cache1 <= data;
                5'd2: cache2 <= data;
                5'd3: cache3 <= data;
                5'd4: cache4 <= data;
                5'd5: cache5 <= data;
                5'd6: cache6 <= data;
                5'd7: cache7 <= data;
                
                endcase  
            
            end else begin
            
 
            unique case(addr[2:0]) // 0 a 7
                       
            3'd0: cache0 <= data;
            3'd1: cache1 <= data;
            3'd2: cache2 <= data;
            3'd3: cache3 <= data;
            3'd4: cache4 <= data;
            3'd5: cache5 <= data;
            3'd6: cache6 <= data;
            3'd7: cache7 <= data;
                        
            endcase
            end
              
        end else begin
        
            cache0 <= '0;
            cache1 <= '0;
            cache2 <= '0;
            cache3 <= '0;
            cache4 <= '0;
            cache5 <= '0;
            cache6 <= '0;
            cache7 <= '0;      
            addra  <= '0;
        end
    end
    
endmodule //codigo não operacional ainda não terminado
