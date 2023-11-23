module test_sequencing11011(
);
    reg         clk;
    reg         rstn;
    reg         in;
    wire        out;

    sequencing11011 sequencing11011_inst_0 (
        .clk(    clk),
        .rstn(  rstn),
        .in(      in),
        .out(    out)
    );

    initial begin
        clk  = 0;
        rstn = 1;
        in   = 1;
        #0.1 rstn = 0;
        #1.1 rstn = 1;
    end

    initial begin
        in = 0;
    end

    always begin
        #1 clk = ~clk;
    end

    always #0.5 begin
        #2 in = $random() % 2;
    end
endmodule
