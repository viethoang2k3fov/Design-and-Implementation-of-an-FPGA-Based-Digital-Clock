module counter_phut (
    input  wire clk,             // Clock 1Hz
    input  wire rst,             // Reset đồng bộ
    input  wire inc_minute,      // Tín hiệu tăng phút từ counter_giay
    input  wire btn_inc_minute,  // Nút nhấn tăng phút (KEY[1])
    output reg [3:0] bcd_HEX2,   // Hàng đơn vị phút
    output reg [3:0] bcd_HEX3,   // Hàng chục phút
    output reg min_tick          // Tín hiệu báo hết 59 phút (dùng tăng giờ)
);

    reg [5:0] min;               // Lưu trữ phút
    reg btn_prev = 1'b1;         // Trạng thái trước của nút nhấn

    wire pulse_min = (btn_prev == 1'b1 && btn_inc_minute == 1'b0);  // Phát hiện cạnh xuống

    // Cập nhật trạng thái nút nhấn (btn_prev)
    always @(posedge clk) begin
        if (!rst)
            btn_prev <= 1'b1;
        else
            btn_prev <= btn_inc_minute;
    end

    // Bộ đếm phút
    always @(posedge clk) begin
        if (!rst) begin
            min <= 6'd0;
        end else if (inc_minute || pulse_min) begin
            if (min == 6'd59)
                min <= 6'd0;
            else
                min <= min + 6'd1;
        end
    end

    // Phát xung min_tick khi phút = 59 và được tăng từ counter_giay
    always @(*) begin
        min_tick = (min == 6'd59) && inc_minute;
    end

    // Chuyển sang BCD
    always @(*) begin
        bcd_HEX2 = min % 10;
        bcd_HEX3 = (min / 10) % 10;
    end

endmodule

