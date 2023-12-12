module seq(
    input           clk,
    input           rstn,
    output          out
);

    reg [12:0] seq;

    always@(posedge clk)begin
        if (!rstn) begin
            seq <= 13'b0010111001001;
        end
        else begin
            seq <= {seq[11:0], seq[12]};
        end
    end

    assign out = seq[12];
endmodule