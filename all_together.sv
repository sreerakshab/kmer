`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 16:28:27
// Design Name: 
// Module Name: all_together
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


module all_together#(
    parameter kmer_length     = 6,
    parameter number_of_kmers = 20,
    parameter number_of_pes   = 15        
)
(
    input  logic clk, rst, start,
    input  logic [7*number_of_kmers-1:0] base,
    output logic done,
    output logic [11:0] final_array [number_of_kmers-kmer_length:0],
    output logic [3:0]  final_array_ctr [number_of_kmers-kmer_length:0]
);

    logic [2*kmer_length-1:0] kmer_stream;
    logic kmer_valid;
    logic kgen_idle_ready;  
    kgen #(
        .kmer_length(kmer_length),
        .number_of_kmer(number_of_kmers)
    ) kgen1 (
        .base(base),
        .clk(clk),
        .rst(rst),
        .start(start),
        .kmer(kmer_stream),
        .kmer_valid(kmer_valid),
        .done(done),
        .ready(kgen_idle_ready)
    );

    block_connections #(
        .number_of_kmers(number_of_kmers),
        .kmer_length(kmer_length)
    ) chain (
        .clk(clk),
        .rst(rst),
        .ready(kmer_valid),         
        .global_input({kmer_stream}), 
        .final_array(final_array),
        .final_array_ctr(final_array_ctr)
    );

endmodule