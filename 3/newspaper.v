module newspaper(
    input           clk,
    input           rstn,
    input           coin,
    output      reg newspaper
);

    localparam S00 = 2'b00;
    localparam S05 = 2'b01;
    localparam S10 = 2'b10;

    reg [1:0] state;
    reg [1:0] next_state;

    always@(negedge rstn or posedge clk)begin
        if (!rstn) begin
            state <= S00;
        end
        else begin
            state <= next_state;
        end
    end

    always@(state or coin)begin
        case(state)
        S00:begin
            next_state = coin ? S10 : S05;
        end
        S05:begin
            next_state = coin ? S00 : S10;
        end
        S10:begin
            next_state = coin ? S05 : S00;
        end
        default: next_state = S00;
        endcase
    end

    always @(state) begin
        case(state)
        S00:        newspaper = 1'b0;
        S05:        newspaper = coin ? 1'b1 : 1'b0;
        S10:        newspaper = 1'b1;
        default:    newspaper = 1'bx;
        endcase
    end
endmodule