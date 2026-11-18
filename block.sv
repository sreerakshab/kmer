`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 12:44:16
// Design Name: 
// Module Name: block
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
module block (
    input  logic clk,rst,ready1, 
    output logic filled,
    input  logic leftside_filled,
    input  logic [11:0] leftside_kmer,global_input,  
    output logic [11:0] stored_kmer,
    output logic [3:0]  stored_ctr,
    input logic[3:0] leftside_ctr ,
    input  logic shift_needed,     
    output logic shift_needed_out
     
);
    logic will_insert;
    assign will_insert =((leftside_kmer < global_input) && (global_input < stored_kmer));
    assign shift_needed_out = shift_needed | will_insert;
 
 
    always_ff @(posedge clk , posedge rst) begin
        if (rst) begin
            stored_kmer <= 12'hFFF;
            stored_ctr  <= 4'd0;
            filled  <= 1'b0;
        end 
        else if (ready1) begin
            // match
            if ((stored_kmer == global_input) && (filled == 1)) begin
                stored_ctr <= stored_ctr + 4'd1;
            end
            // insert
            else if (will_insert) begin
                stored_kmer <= global_input;
                stored_ctr  <= 4'd1;
                filled  <= 1'b1;
            end
            // shift
            else if (shift_needed) begin
                stored_kmer <= leftside_kmer;
                stored_ctr  <= leftside_ctr;
                filled  <= leftside_filled;
            end
            // hold
            else begin
                stored_kmer <= stored_kmer;
                stored_ctr  <= stored_ctr;
                filled  <= filled;
            end
        end
    end

endmodule