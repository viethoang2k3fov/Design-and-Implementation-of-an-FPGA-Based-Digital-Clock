module counter_gio (
    input wire clk,                // Clock 1Hz
    input wire rst,                // Reset đồng bộ
    input wire inc_hour,          // Tăng giờ từ phút = 59
    input wire btn_inc_hour,      // Nút nhấn chỉnh giờ (KEY[2])
    output reg [3:0] bcd_HEX4,     // Giờ hàng đơn vị
    output reg [3:0] bcd_HEX5      // Giờ hàng chục
);

    reg [4:0] hour;
    reg btn_prev = 1'b1;           // Lưu trạng thái trước đó của nút

    wire pulse_hour = (btn_prev == 1'b1 && btn_inc_hour == 1'b0);  // Phát hiện cạnh xuống

    always @(posedge clk) begin
        if (!rst) begin
            hour <= 5'd0;
            btn_prev <= 1'b1;
        end else begin
            if (inc_hour || pulse_hour) begin
                if (hour == 5'd23)
                    hour <= 5'd0;
                else
                    hour <= hour + 5'd1;
            end
            btn_prev <= btn_inc_hour;  // Cập nhật trạng thái nút
        end
    end

    // Chuyển sang BCD
    always @(*) begin
        bcd_HEX4 = hour % 10;
        bcd_HEX5 = (hour / 10) % 10;
    end

endmodule
