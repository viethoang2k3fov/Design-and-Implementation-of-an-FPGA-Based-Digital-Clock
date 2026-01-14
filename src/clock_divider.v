module clock_divider (
    input wire CLOCK_50,    // Clock 50MHz từ FPGA
    output reg clk_out    // Clock chậm 1Hz cho bộ đếm
);

    parameter DIV_VALUE = 25000000; // Chia tần số từ 50MHz xuống 1Hz (50M / 2)
    reg [24:0] count; // Bộ đếm 25-bit để chia tần số

    always @(posedge CLOCK_50) begin
        if (count >= DIV_VALUE - 1) begin
            count <= 0;
            clk_out <= ~clk_out; // Đảo trạng thái để tạo xung clock 1Hz
        end else begin
            count <= count + 1;
        end
    end

endmodule