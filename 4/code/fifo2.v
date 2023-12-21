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
    wire         input_ev;
    wire         output_ev;

    assign input_ev  = input_valid  && input_enable;
    assign output_ev = output_valid && output_enable;

    always @(posedge clk or negedge rstn) begin
        if (rstn == 0)begin
            write_addr      <= 5'b0;
            read_addr       <= 5'b0;
            input_enable    <= 1'b1;
            output_valid    <= 1'b0;
            data_out[ 7: 0] <= 8'bxxxxxxxx;
        end
        else begin
            case ({input_ev, output_ev})
                4'b00: begin
                    if (write_addr - read_addr >= 2)begin
                        output_valid <= 1'b1;
                    end
                    else begin
                        output_valid <= 1'b0;
                    end
                end

                4'b01: begin
                    if (read_addr == 30) begin
                        data_out[ 7: 0] <= mem[31][ 7: 0];
                        data_out[15: 8] <= mem[30][ 7: 0];
                    end
                    else begin
                        read_addr       <= read_addr + 2;
                        data_out[ 7: 0] <= mem[read_addr + 1][ 7: 0];
                        data_out[15: 8] <= mem[read_addr][ 7: 0];
                    end

                    if (write_addr - read_addr >= 4)begin
                        output_valid <= 1'b1;
                    end
                    else begin
                        output_valid <= 1'b0;
                    end
                end

                4'b10: begin
                    if (write_addr == 31) begin
                        input_enable = 1'b0;
                        mem[31][ 7: 0] <= data_in[ 7: 0];
                    end
                    else begin
                        write_addr             <= write_addr + 1;
                        mem[write_addr][ 7: 0] <= data_in[ 7: 0];
                    end

                    if (write_addr - read_addr >= 1)begin
                        output_valid <= 1'b1;
                    end
                    else begin
                        output_valid <= 1'b0;
                    end
                end
                
                4'b11: begin
                    if (write_addr == 31) begin
                        input_enable = 1'b0;
                        mem[31][ 7: 0] <= data_in[ 7: 0];
                    end
                    else begin
                        write_addr             <= write_addr + 1;
                        mem[write_addr][ 7: 0] <= data_in[ 7: 0];
                    end

                    if (read_addr == 30) begin
                        data_out[ 7: 0] <= mem[31][ 7: 0];
                        data_out[15: 8] <= mem[30][ 7: 0];
                    end
                    else begin
                        read_addr       <= read_addr + 2;
                        data_out[ 7: 0] <= mem[read_addr + 1][ 7: 0];
                        data_out[15: 8] <= mem[read_addr][ 7: 0];
                    end

                    if (write_addr - read_addr >= 3)begin
                        output_valid <= 1'b1;
                    end
                    else begin
                        output_valid <= 1'b0;
                    end
                end
            endcase
        end
    end
endmodule