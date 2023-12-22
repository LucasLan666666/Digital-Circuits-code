`timescale 1ns / 1ps

module fifo2(
    input               clk,
    input               rstn,
    input               input_valid,
    input               output_enable,
    output reg          input_enable,
    output reg          output_valid,
    input       [ 7: 0] data_in,
    output reg  [15: 0] data_out
);

    reg [ 7: 0] mem [31: 0];
    reg [ 4: 0] write_addr;
    reg [ 4: 0] read_addr;
    wire output_v;

    assign output_v = (write_addr - read_addr >= 2)? 1'b1 : 1'b0;

    always @(posedge clk or negedge rstn) begin
        output_valid <= output_v;
        if (rstn == 0)begin
            write_addr     <= 5'b0;
            read_addr      <= 5'b0;
            input_enable   <= 1'b1;
            output_valid   <= 1'b0;
            data_out[ 7:0] <= 8'bxxxxxxxx;
        end
        else begin
            if ((input_valid == 1'b1) && (input_enable == 1'b1)) begin
                if (write_addr == 31) begin
                    input_enable   <= 1'b0;
                    write_addr     <= 5'b0;
                    mem[31][ 7: 0] <= data_in[ 7: 0];
                end
                else begin
                    write_addr             <= write_addr + 1;
                    mem[write_addr][ 7: 0] <= data_in[ 7: 0];
                end
            end    
            if (output_v == 1'b1 && output_enable == 1'b1) begin
                if (read_addr == 30) begin
                    input_enable    <= 1'b1;
                    output_valid    <= 1'b0;
                    read_addr       <= 5'b0;
                    data_out[ 7: 0] <= mem[31][ 7: 0];
                    data_out[15: 8] <= mem[30][ 7: 0];
                end
                else begin
                    read_addr       <= read_addr + 2;
                    data_out[ 7: 0] <= mem[read_addr + 1][ 7: 0];
                    data_out[15: 8] <= mem[read_addr][ 7: 0];
                end
            end
            else begin
            end
        end
    end
endmodule