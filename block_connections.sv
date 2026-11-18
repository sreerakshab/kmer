`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 16:27:18
// Design Name: 
// Module Name: block_connections
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
module block_connections#(
parameter number_of_kmers=20,
parameter kmer_length=6
)
(
input logic clk,rst,ready,
input logic [2*kmer_length-1:0] global_input,
output logic[2*kmer_length-1:0] final_array [number_of_kmers-kmer_length:0],
output logic[3:0] final_array_ctr[number_of_kmers-kmer_length:0]
);

logic [2*kmer_length-1:0] b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15;
logic [3:0] c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;
logic f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15;
logic s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15;

block B1 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (12'd0), 
        .leftside_ctr    (10'd0),
        .leftside_filled (1'b0),
        .filled          (f1),   
        .stored_kmer     (b1),
        .stored_ctr      (c1),
        .shift_needed     (1'b0), 
        .shift_needed_out (s1)
    	);

block B2 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b1), 
        .leftside_ctr    (c1),
        .leftside_filled (f1),
        .filled          (f2),   
        .stored_kmer     (b2),
        .stored_ctr      (c2),
        .shift_needed     (s1), 
        .shift_needed_out (s2)
    	);
block B3 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b2), 
        .leftside_ctr    (c2),
        .leftside_filled (f2),
        .filled          (f3),   
        .stored_kmer     (b3),
        .stored_ctr      (c3),
        .shift_needed     (s2), 
        .shift_needed_out (s3)
    	);
block B4 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b3), 
        .leftside_ctr    (c3),
        .leftside_filled (f3),
        .filled          (f4),   
        .stored_kmer     (b4),
        .stored_ctr      (c4),
        .shift_needed     (s3), 
        .shift_needed_out (s4)
    	);
block B5 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b4), 
        .leftside_ctr    (c4),
        .leftside_filled (f4),
        .filled          (f5),   
        .stored_kmer     (b5),
        .stored_ctr      (c5),
        .shift_needed     (s4), 
        .shift_needed_out (s5)
    	);
block B6 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b5), 
        .leftside_ctr    (c5),
        .leftside_filled (f5),
        .filled          (f6),   
        .stored_kmer     (b6),
        .stored_ctr      (c6),
        .shift_needed     (s5), 
        .shift_needed_out (s6)
    	);
block B7 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b6), 
        .leftside_ctr    (c6),
        .leftside_filled (f6),
        .filled          (f7),   
        .stored_kmer     (b7),
        .stored_ctr      (c7),
        .shift_needed     (s6), 
        .shift_needed_out (s7)
    	);
block B8 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b7), 
        .leftside_ctr    (c7),
        .leftside_filled (f7),
        .filled          (f8),   
        .stored_kmer     (b8),
        .stored_ctr      (c8),
        .shift_needed     (s7), 
        .shift_needed_out (s8)
    	);
block B9 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b8), 
        .leftside_ctr    (c8),
        .leftside_filled (f8),
        .filled          (f9),   
        .stored_kmer     (b9),
        .stored_ctr      (c9),
        .shift_needed     (s8), 
        .shift_needed_out (s9)
    	);
block B10 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b9), 
        .leftside_ctr    (c9),
        .leftside_filled (f9),
        .filled          (f10),   
        .stored_kmer     (b10),
        .stored_ctr      (c10),
        .shift_needed     (s9), 
        .shift_needed_out (s10)
    	);
block B11 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b10), 
        .leftside_ctr    (c10),
        .leftside_filled (f10),
        .filled          (f11),   
        .stored_kmer     (b11),
        .stored_ctr      (c11),
        .shift_needed     (s10), 
        .shift_needed_out (s11)
    	);
block B12 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b11), 
        .leftside_ctr    (c11),
        .leftside_filled (f11),
        .filled          (f12),   
        .stored_kmer     (b12),
        .stored_ctr      (c12),
        .shift_needed     (s11), 
        .shift_needed_out (s12)
    	);
block B13 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b12), 
        .leftside_ctr    (c12),
        .leftside_filled (f12),
        .filled          (f13),   
        .stored_kmer     (b13),
        .stored_ctr      (c13),
        .shift_needed     (s12), 
        .shift_needed_out (s13)
    	);
block B14 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b13), 
        .leftside_ctr    (c13),
        .leftside_filled (f13),
        .filled          (f14),   
        .stored_kmer     (b14),
        .stored_ctr      (c14),
        .shift_needed     (s13), 
        .shift_needed_out (s14)
    	);
block B15 (
        .clk             (clk),
        .rst             (rst),
        .ready1           (ready),
        .global_input    (global_input),
        .leftside_kmer   (b14), 
        .leftside_ctr    (c14),
        .leftside_filled (f14),
        .filled          (f15),   
        .stored_kmer     (b15),
        .stored_ctr      (c15),
        .shift_needed     (s14), 
        .shift_needed_out (s15)
    	);


assign final_array[0]=b1;
assign final_array[1]=b2;
assign final_array[2]=b3;
assign final_array[3]=b4;
assign final_array[4]=b5;
assign final_array[5]=b6;
assign final_array[6]=b7;
assign final_array[7]=b8;
assign final_array[8]=b9;
assign final_array[9]=b10;
assign final_array[10]=b11;
assign final_array[11]=b12;
assign final_array[12]=b13;
assign final_array[13]=b14;
assign final_array[14]=b15;

assign final_array_ctr[0]=c1;
assign final_array_ctr[1]=c2;
assign final_array_ctr[2]=c3;
assign final_array_ctr[3]=c4;
assign final_array_ctr[4]=c5;
assign final_array_ctr[5]=c6;
assign final_array_ctr[6]=c7;
assign final_array_ctr[7]=c8;
assign final_array_ctr[8]=c9;
assign final_array_ctr[9]=c10;
assign final_array_ctr[10]=c11;
assign final_array_ctr[11]=c12;
assign final_array_ctr[12]=c13;
assign final_array_ctr[13]=c14;
assign final_array_ctr[14]=c15;

endmodule