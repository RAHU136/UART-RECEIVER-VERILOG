module uart_rx(
    input clk,
    input rst,
    input rx,
    output reg [7:0] data_out,
    output reg data_valid
);

reg [2:0] bit_count;
reg [2:0] state;

parameter IDLE  = 3'b000;
parameter START = 3'b001;
parameter DATA  = 3'b010;
parameter STOP  = 3'b011;
parameter DONE  = 3'b100;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        state <= IDLE;
        bit_count <= 0;
        data_out <= 8'b00000000;
        data_valid <= 0;
    end
    else
    begin
        case(state)

        IDLE:
        begin
            data_valid <= 0;

            if(rx == 0)
                state <= START;
        end

        START:
        begin
            bit_count <= 0;
            state <= DATA;
        end

        DATA:
        begin
            data_out[bit_count] <= rx;

            if(bit_count == 7)
                state <= STOP;
            else
                bit_count <= bit_count + 1;
        end

        STOP:
        begin
            if(rx == 1)
                state <= DONE;
        end

        DONE:
        begin
            data_valid <= 1;
            state <= IDLE;
        end

        default:
            state <= IDLE;

        endcase
    end
end

endmodule


