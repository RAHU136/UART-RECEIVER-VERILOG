module tb_uart_rx;

reg clk;
reg rst;
reg rx;

wire [7:0] data_out;
wire data_valid;

uart_rx uut(
    .clk(clk),
    .rst(rst),
    .rx(rx),
    .data_out(data_out),
    .data_valid(data_valid)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    rx = 1;

    #10 rst = 0;

    // START bit
    #10 rx = 0;

    // DATA = 10110011
    // LSB first = 11001101

    #10 rx = 1; // bit0
    #10 rx = 1; // bit1
    #10 rx = 0; // bit2
    #10 rx = 0; // bit3
    #10 rx = 1; // bit4
    #10 rx = 1; // bit5
    #10 rx = 0; // bit6
    #10 rx = 1; // bit7

    // STOP bit
    #10 rx = 1;

    #30;
    $finish;
end

initial
begin
    $dumpfile("uart_rx.vcd");
    $dumpvars(0,tb_uart_rx);
end

endmodule
