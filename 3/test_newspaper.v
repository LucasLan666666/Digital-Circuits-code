module test_newspaper(
);
    reg         clk;
    reg         rstn;
    reg         coin;
    wire        newspaper;

    newspaper newspaper_inst_0 (
        .clk(                 clk),
        .rstn(               rstn),
        .coin(               coin),
        .newspaper(     newspaper)
    );

    initial begin
        clk  = 0;
        rstn = 1;
        coin   = 1;
        #0.1 rstn = 0;
        #1.1 rstn = 1;
    end

    initial begin
        coin = 0;
    end

    always begin
        #1 clk = ~clk;
    end

    always #0.5 begin
        #2 coin = $random() % 2;
    end
endmodule
