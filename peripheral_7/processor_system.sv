module processor_system(
                        input logic         clk_i,
                        input logic         resetn_i,

                        // Входы и выходы периферии
                        input logic [15:0]  sw_i, // Переключатели

                        output logic [15:0] led_o, // Светодиоды

                        input logic         kclk_i, // Тактирующий сигнал клавиатуры
                        input logic         kdata_i, // Сигнал данных клавиатуры

                        output logic [ 6:0] hex_led_o, // Вывод семисегментных индикаторов
                        output logic [ 7:0] hex_sel_o, // Селектор семисегментных индикаторов

                        input logic         rx_i, // Линия приёма по UART
                        output logic        tx_o, // Линия передачи по UART

                        output logic [3:0]  vga_r_o, // Красный канал vga
                        output logic [3:0]  vga_g_o, // Зелёный канал vga
                        output logic [3:0]  vga_b_o, // Синий канал vga
                        output logic        vga_hs_o, // Линия горизонтальной синхронизации vga
                        output logic        vga_vs_o    // Линия вертикальной синхронизации vga

);
//...
   logic                                    sysclk, rst;
   sys_clk_rst_gen divider(
                           .ex_clk_i(clk_i),
                           .ex_areset_n_i(resetn_i),
                           .div_i(5),
                           .sys_clk_o(sysclk),
                           .sys_reset_o(rst)
                        );

endmodule
