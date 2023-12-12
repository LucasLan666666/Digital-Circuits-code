`timescale 1ns / 1ps
module fifo_test(
);
    reg         clk;
    reg         rstn;
    reg         input_valid;
    wire        input_enable;
    wire        output_valid;
    reg         output_enable;
    reg  [15:0] data_in;
    wire [ 7:0] data_out;

    fifo inst_fifo_0(
        .clk(                       clk),
        .rstn(                     rstn),
        .input_valid(       input_valid),
        .input_enable(     input_enable),
        .output_valid(     output_valid),
        .output_enable(   output_enable),
        .data_in(               data_in),
        .data_out(             data_out)
    );

    always #2 begin
        clk = ~clk;
    end

    initial begin
        clk           = 1'b0;
        rstn          = 1'b1;
        input_valid   = 1'b1;
        output_enable = 1'b0;
        #1 rstn = 1'b0;
        #2 rstn = 1'b1;
    end

    always begin
        #4;
        data_in = $random() % 17'b1_00000000_00000000;
    end

    always begin
        input_valid   = 1'b0;
        output_enable = 1'b0;
        #8
        input_valid   = 1'b1;
        output_enable = 1'b0;
        #4;
        input_valid   = 1'b0;
        output_enable = 1'b1;
        #12;
        input_valid   = 1'b1;
        output_enable = 1'b1;
        #12;
        input_valid   = 1'b1;
        output_enable = 1'b0;
        #28;
        input_valid   = 1'b0;
        output_enable = 1'b0;
        #4;
        input_valid   = 1'b0;
        output_enable = 1'b1;
        #72
        $finish;
    end
endmodule