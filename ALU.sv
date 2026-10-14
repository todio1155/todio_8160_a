`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2026 10:29:23
// Design Name: 
// Module Name: ALU
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


module ALU(

    //'ifdef
    //inout wire vdd;
    //inout wire vss;
    //'enddif
    
    output logic [7:0] OUT  = '0,
    output logic [7:0] flag = '0,
    input logic clk,
    input logic rest,
    input [8:0] a_i,
    input [8:0] b_i,
    input [7:0] opcode,
    input carry // ou borrow!
    
    );
    
    logic [8:0]  areg;
    logic [8:0]  breg;
    logic [15:0] outreg;
    logic [15:0] opcodereg = '0;
    logic [7:0]  func;
    logic awire = '0;
    logic [7:0]  regis;
    logic regc;
    logic [15:0]  cacheout_l;
    logic [15:0]  cacheout_r;
    logic [15:0]  overnum ;
    
    
    always_ff @(posedge clk) begin
        
        if(rest) begin
        
            areg <= '0;
            breg <= '0;
            flag <= '0;
            regis <= '0;
            outreg <= '0;
            OUT <= '0;
            //cacheout_l <= '0; 
            //cacheout_r <= '0;
            //regc <= '0;
            //overnum <= '0;
                 
        end else begin
        areg <= a_i[8:0];
        breg <= b_i[8:0];
        flag <= '0; 
          if(opcode == 8'b100000) begin
            OUT <= regis; 

          end else begin     
            unique case(opcode[4:0]) // 5 bits
        
            8'd1  : outreg <= areg + breg + carry;  //...00001 
            8'd2  : outreg <= $signed(areg) + $signed(breg) + carry;  //...00010 
            8'd3  : outreg <= areg - breg - carry;  //...00011 na verdade e Borrow!
            8'd4  : outreg <= $signed(areg) - $signed(breg) ; //...00100
            //8'd5  : outreg <= areg * breg; //...00101
            //8'd6  : outreg <= areg / breg; //...00110 
            8'd7  : outreg <= areg << breg; //...00111
            8'd8  : outreg <= $signed(areg) <<< breg; //...01000
            8'd9  : outreg <= areg >> breg;//...01001
            8'd10 : outreg <= $signed(areg) >>> breg;//...01010
            8'd11 : outreg <= ~(areg & breg) ; //...01011 NAND
            8'd12 : outreg <= areg & breg; //...01100 AND
            8'd13 : outreg <= areg | breg; //...01101 OR
            8'd14 : outreg <= areg ^ breg; //...01110 XOR
            8'd15 : outreg <= areg ~^ breg; //...01110 XNOR
               
            default: outreg <= '0  ; // se nenhum for "true" outreg e ingual a 0
            
            endcase 
            
            //if(opcode[4:0] == 8'd2  begin
            //   flag[0] <= outreg[9]; //carry
            //   OUT <= outreg[7:0];
                
               //if(opcode[5]) begin
               //     regc <= outreg[15]; //registrador de carry
               //end
               //if(opcode[6]) begin
               // cacheout_l <= outreg; //registrador left      
               //end //se não botar else ele cricar um lacth
               //if(opcode[7]) begin
               // cacheout_r <= outreg; //registrador right
               //end
               //if(opcode[8]) begin
               // overnum <= outreg;
               //end                            
          end      
       end     
    end    
endmodule

