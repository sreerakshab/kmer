`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 21:38:23
// Design Name: 
// Module Name: kgen
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
module kgen #(
    parameter kmer_length     = 6,
    parameter number_of_kmer  = 20
)
(
    input  logic [7*number_of_kmer-1:0] base,
    input  logic clk,rst,start,
    output logic [2*kmer_length-1:0] kmer,
    output logic kmer_valid,   
    output logic done,
    output logic ready
);
 
localparam [1:0]
    idle   = 2'b00,
    op     = 2'b01,
    finish = 2'b10;
 
logic [1:0] state_next, state_reg;
logic [7*kmer_length-1:0] kmer_raw;
logic [2*kmer_length-1:0] kmer_enc;
logic [9:0] q_next, q_reg;
logic [1:0] enc0, enc1, enc2, enc3, enc4, enc5;
logic       kmer_valid_next;   
 
always_ff @(posedge clk, posedge rst)
    if (rst) begin
        state_reg<= idle;
        q_reg<= 0;
        kmer<= '0;
        kmer_valid<= 1'b0;
    end
    else begin
        state_reg<= state_next;
        q_reg<= q_next;
        kmer<= kmer_enc;         
        kmer_valid<=kmer_valid_next;  
    end
 
always_comb
begin
    state_next  = state_reg;
    q_next = q_reg;
    ready = 1'b0;
    done = 1'b0;
    kmer_valid_next= 1'b0;   
    kmer_enc= '0;     
 
    case (state_reg)
        idle: begin
            ready = 1'b1;
            if (start) begin
                state_next = op;
                q_next     = 0;
            end
        end
 
        op:
            if (q_reg == number_of_kmer - kmer_length + 1) begin
                q_next = 0;
                state_next = finish;
                
            end
            else begin
                kmer_raw = base[(q_reg*7) +: (7*kmer_length)];
                q_next   = q_reg + 1;
 
                enc0 = (kmer_raw[(6*7-1)-:7]=="A"||kmer_raw[(6*7-1)-:7]=="a") ? 2'b00 :
                       (kmer_raw[(6*7-1)-:7]=="C"||kmer_raw[(6*7-1)-:7]=="c") ? 2'b01 :
                       (kmer_raw[(6*7-1)-:7]=="G"||kmer_raw[(6*7-1)-:7]=="g") ? 2'b10 :
                       (kmer_raw[(6*7-1)-:7]=="T"||kmer_raw[(6*7-1)-:7]=="t") ? 2'b11 : 2'b00;
                enc1 = (kmer_raw[(5*7-1)-:7]=="A"||kmer_raw[(5*7-1)-:7]=="a") ? 2'b00 :
                       (kmer_raw[(5*7-1)-:7]=="C"||kmer_raw[(5*7-1)-:7]=="c") ? 2'b01 :
                       (kmer_raw[(5*7-1)-:7]=="G"||kmer_raw[(5*7-1)-:7]=="g") ? 2'b10 :
                       (kmer_raw[(5*7-1)-:7]=="T"||kmer_raw[(5*7-1)-:7]=="t") ? 2'b11 : 2'b00;
                enc2 = (kmer_raw[(4*7-1)-:7]=="A"||kmer_raw[(4*7-1)-:7]=="a") ? 2'b00 :
                       (kmer_raw[(4*7-1)-:7]=="C"||kmer_raw[(4*7-1)-:7]=="c") ? 2'b01 :
                       (kmer_raw[(4*7-1)-:7]=="G"||kmer_raw[(4*7-1)-:7]=="g") ? 2'b10 :
                       (kmer_raw[(4*7-1)-:7]=="T"||kmer_raw[(4*7-1)-:7]=="t") ? 2'b11 : 2'b00;
                enc3 = (kmer_raw[(3*7-1)-:7]=="A"||kmer_raw[(3*7-1)-:7]=="a") ? 2'b00 :
                       (kmer_raw[(3*7-1)-:7]=="C"||kmer_raw[(3*7-1)-:7]=="c") ? 2'b01 :
                       (kmer_raw[(3*7-1)-:7]=="G"||kmer_raw[(3*7-1)-:7]=="g") ? 2'b10 :
                       (kmer_raw[(3*7-1)-:7]=="T"||kmer_raw[(3*7-1)-:7]=="t") ? 2'b11 : 2'b00;
                enc4 = (kmer_raw[(2*7-1)-:7]=="A"||kmer_raw[(2*7-1)-:7]=="a") ? 2'b00 :
                       (kmer_raw[(2*7-1)-:7]=="C"||kmer_raw[(2*7-1)-:7]=="c") ? 2'b01 :
                       (kmer_raw[(2*7-1)-:7]=="G"||kmer_raw[(2*7-1)-:7]=="g") ? 2'b10 :
                       (kmer_raw[(2*7-1)-:7]=="T"||kmer_raw[(2*7-1)-:7]=="t") ? 2'b11 : 2'b00;
                enc5 = (kmer_raw[(1*7-1)-:7]=="A"||kmer_raw[(1*7-1)-:7]=="a") ? 2'b00 :
                       (kmer_raw[(1*7-1)-:7]=="C"||kmer_raw[(1*7-1)-:7]=="c") ? 2'b01 :
                       (kmer_raw[(1*7-1)-:7]=="G"||kmer_raw[(1*7-1)-:7]=="g") ? 2'b10 :
                       (kmer_raw[(1*7-1)-:7]=="T"||kmer_raw[(1*7-1)-:7]=="t") ? 2'b11 : 2'b00;
 
                kmer_enc  = {enc0, enc1, enc2, enc3, enc4, enc5};
                kmer_valid_next = 1'b1; 
                      
            end
 
        finish: begin
            state_next = idle;
            done = 1'b1;
        end
    endcase
end
 
endmodule