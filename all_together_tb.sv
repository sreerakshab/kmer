`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: all_together_tb
//////////////////////////////////////////////////////////////////////////////////
module all_together_tb;
    localparam KMER_LEN   = 6;
    localparam NUM_BASES  = 20;
    localparam NUM_PES    = 15;   

    logic clk, rst, start;
    logic [7*NUM_BASES-1:0] base;
    logic done;
    logic [11:0] final_array     [NUM_PES-1:0];
    logic [3:0]  final_array_ctr [NUM_PES-1:0];   

    all_together #(
        .kmer_length(KMER_LEN),
        .number_of_kmers(NUM_BASES),
        .number_of_pes(NUM_PES)
    ) dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .base(base),
        .done(done),
        .final_array(final_array),
        .final_array_ctr(final_array_ctr)
    );

    always #5 clk = ~clk;

    task automatic pack_base(input string s);
        int i;
        begin
            base = '0;
            for (i = 0; i < NUM_BASES; i++) begin
                base[7*i +: 7] = s[i];
            end
        end
    endtask

    initial begin
        clk   = 0;
        rst   = 1;
        start = 0;
        base  = '0;
        pack_base("CCCCCCCCCCGGGGGGGGAA");//GATTACCCGGTTAAGATTAC  GGGGGGGGGGGGGGGGGGGG

        @(negedge clk);
        rst = 0;
        @(negedge clk);
        start = 1;
        @(negedge clk);
        start = 0;

        wait (done == 1);
        repeat (NUM_PES + 2) @(negedge clk);   
        $finish;
    end
endmodule