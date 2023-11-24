module sequencing11011(
    input           clk,
    input           rstn,
    input           in,
    output      reg out
);

    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;
    localparam S4 = 3'b100;
    localparam S5 = 3'b101;

    reg [3:0] state;
    reg [3:0] next_state;

    always @(negedge rstn or posedge clk) begin
        if (!rstn) begin
            state <= S0;
        end
        else begin
            state <= next_state;
        end
    end

    always @(state or in) begin
        case(state)
        S0: begin
            next_state =  in ? S1 : S0;
        end
        S1: begin
            next_state =  in ? S2 : S0;
        end
        S2: begin
            next_state =  in ? S2 : S3;
        end
        S3: begin
            next_state =  in ? S4 : S0;
        end
        S4: begin
            next_state =  in ? S5 : S0;
        end
        S5: begin
            next_state =  in ? S2 : S3;
        end
        default: next_state = S0;
        endcase
    end

    always @(state) begin
        case(state)
        S0:out = 1'b0;
        S1:out = 1'b0;
        S2:out = 1'b0;
        S3:out = 1'b0;
        S4:out = 1'b0;
        S5:out = 1'b1;
        default: out = 1'bx;
        endcase
    end
endmodule