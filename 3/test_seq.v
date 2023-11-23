module test_seq(
);
    reg         clk;
    reg         rstn;
    wire        out;

    seq seq_inst_0 (
        .clk(    clk),
        .rstn(  rstn),
        .out(    out)
    );

    initial begin
        clk  = 0;
        rstn = 1;
        #0.1 rstn = 0;
        #1.1 rstn = 1;
    end

    always begin
        #1 clk = ~clk;
    end
endmodule
