`timescale 1ns / 1ps

module fifo(
    input               clk,
    input               rstn,
    input               input_valid,
    input               output_enable,
    output reg          input_enable,
    output reg          output_valid,
    input       [15: 0] data_in,
    output reg  [ 7: 0] data_out
);

    reg [ 7: 0] mem [31: 0];
    reg [ 4: 0] write_addr;
    reg [ 4: 0] read_addr;

    always @(posedge clk or negedge rstn) begin
        if (rstn == 0)begin
            write_addr       <= 5'b0;
            read_addr        <= 5'b0;
            input_enable     <= 1'b1;
            output_valid     <= 1'b0;
            data_out[ 7:0]   <= 8'bxxxxxxxx;
        end
        else begin
            if ((input_valid == 1'b1) && (input_enable == 1'b1)) begin
                if (write_addr == 30) begin
                    input_enable   <= 1'b0;
                    output_valid   <= 1'b1;
                    write_addr     <= 5'b0;
                    mem[30][ 7: 0] <= data_in[ 7: 0];
                    mem[31][ 7: 0] <= data_in[15: 8];
                end
                else begin
                    write_addr                 <= write_addr + 2;
                    mem[write_addr][ 7: 0]     <= data_in[ 7: 0];
                    mem[write_addr + 1][ 7: 0] <= data_in[15: 8];
                end
            end
            else if (output_valid == 1'b1 && output_enable == 1'b1) begin
                if (read_addr == 31) begin
                    input_enable    <= 1'b1;
                    output_valid    <= 1'b0;
                    read_addr       <= 5'b0;
                    data_out[ 7: 0] <= mem[31][ 7: 0];
                end
                else begin
                    read_addr       <= read_addr + 1;
                    data_out[ 7: 0] <= mem[read_addr][ 7: 0];
                end
            end
            else begin
            end
        end
    end
endmodule