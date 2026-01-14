module bodem1den9 (
    input wire CLOCK_50,     // Clock 50MHz từ FPGA
    input wire RESET,   // Nút nhấn reset
	 input wire enable_input   ,
	 input wire chinh_phut   ,
	 input wire chinh_gio    ,
    output wire [6:0] HEX0 ,
	 output wire [6:0] HEX1 ,
	 output wire [6:0] HEX2 ,
	 output wire [6:0] HEX3 ,
    output wire [6:0] HEX4 ,
	 output wire [6:0] HEX5
);

    wire clk_1Hz;      // Clock đã chia tần số (1Hz)
    wire [3:0] HEX_0 ;
	 wire [3:0] HEX_1 ;
    wire [3:0] HEX_2 ;
	 wire [3:0] HEX_3 ;
	 wire [3:0] HEX_4 ;
	 wire [3:0] HEX_5 ;
	 wire tick_phut_giay   ;
	 wire tick_gio_phut    ;
	
	
	 
	

	 
    // Khối tạo xung clock 1Hz từ 50MHz
    clock_divider clk_div (
        .CLOCK_50(CLOCK_50),
        .clk_out(clk_1Hz)
    );

   
    // Khối giải mã BCD sang LED 7 đoạn
    bcd_to_7seg decoder (
 
		  .bcd_HEX0( HEX_0 ) ,
		  .bcd_HEX1( HEX_1 ) ,
		  .bcd_HEX2( HEX_2 ) ,
		  .bcd_HEX3( HEX_3 ) ,
		  .bcd_HEX4( HEX_4 ) ,
		  .bcd_HEX5( HEX_5 ) ,
        .seg0(HEX0),
		  .seg1(HEX1),
		  .seg2(HEX2),
		  .seg3(HEX3),
        .seg4(HEX4),
		  .seg5(HEX5)
    );
	 
	 
	 
	 
	 
	 counter_giay cnt_giay( 
	      .clk(clk_1Hz) ,
         .rst(RESET) ,
			.bcd_HEX0(HEX_0) ,
			.bcd_HEX1(HEX_1) ,
			.sec_tick(tick_phut_giay) ,
			.btn_in(enable_input)
);
		
	 counter_phut cnt_phut(
	      .clk(clk_1Hz) ,
         .rst(RESET) ,
			.bcd_HEX2(HEX_2) ,
			.bcd_HEX3( HEX_3 ) ,
			.min_tick(tick_gio_phut),
			.inc_minute(tick_phut_giay),
			.btn_inc_minute(chinh_phut)
);
    counter_gio cnt_gio( 
	      .clk(clk_1Hz) ,
         .rst(RESET) ,
			.bcd_HEX4(HEX_4) ,
			.bcd_HEX5(HEX_5) ,
			.inc_hour(tick_gio_phut) ,
			.btn_inc_hour(chinh_gio)
);






	      
			
			
			
endmodule
