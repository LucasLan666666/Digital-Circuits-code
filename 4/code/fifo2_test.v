`timescale 1ns / 1ps

module fifo2_test(
);
    reg          clk;
    reg          rstn;
    reg          input_valid;
    wire         input_enable;
    wire         output_valid;
    reg          output_enable;
    reg  [ 7: 0] data_in;
    wire [15: 0] data_out;

    fifo2 inst_fifo2_0(
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
        data_in = $random() % 9'b1_0000_0000;
    end

    always begin
        #4;
        input_valid   = ~input_valid;
    end

    always begin
        #12;
        output_enable = ~output_enable;
    end
endmodule