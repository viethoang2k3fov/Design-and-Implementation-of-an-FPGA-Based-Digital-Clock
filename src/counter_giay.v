

module counter_giay(
    input wire clk,              // Clock 1Hz
    input wire rst,              // Reset đồng bộ
    input wire btn_in,           // Nút nhấn (KEY[0], active-low)
    output reg [3:0] bcd_HEX0,   // Đơn vị giây
    output reg [3:0] bcd_HEX1,   // Chục giây
    output reg sec_tick          // Tick khi sec = 59
);

    reg [5:0] sec;
    reg toggle_en = 1'b1;        // Trạng thái chạy/dừng (mặc định chạy)
    reg btn_prev = 1'b1;         // Trạng thái nút nhấn trước đó (KEY[0] idle = 1)

    always @(posedge clk) begin
        if (!rst) begin
            sec <= 6'd0;
            toggle_en <= 1'b1;
            btn_prev <= 1'b1;
        end else begin
            // Xử lý toggle nút nhấn
            if (btn_prev == 1'b1 && btn_in == 1'b0) begin
                toggle_en <= ~toggle_en;  // Đảo trạng thái enable
            end
            btn_prev <= btn_in;  // Cập nhật trạng thái trước

            // Đếm giây nếu đang ở trạng thái chạy
            if (toggle_en) begin
                if (sec == 6'd59)
                    sec <= 6'd0;
                else
                    sec <= sec + 6'd1;
            end
        end
    end

    // Phát tick khi sec = 59
    always @(*) begin
        sec_tick = (sec == 6'd59);
    end

    // Chuyển sang BCD
    always @(*) begin
        bcd_HEX0 = sec % 10;
        bcd_HEX1 = (sec / 10) % 10;
    end

endmodule
