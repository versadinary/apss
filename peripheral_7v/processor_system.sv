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

   import decoder_pkg::*;
   import peripheral_pkg::*;

   logic                                    sysclk, rst;
   sys_clk_rst_gen divider(
                           .ex_clk_i(clk_i),
                           .ex_areset_n_i(resetn_i),
                           .div_i(5),
                           .sys_clk_o(sysclk),
                           .sys_reset_o(rst)
                        );


   logic                            stall, stall_tg, mwe, mreq;
   logic [31:0]                     mwd, maddr, mrd, rom_ins, rom_addr;
   logic [2:0]                      msize;
   logic                            lsu_req, lsu_we, ready;
   logic [3:0]                      lsu_be;
   logic [31:0]                     lsu_wd, addr, lsu_rd;
   logic                            irq_req, irq_ret;
   logic [31:0]                     dmem_rd, hex_rd, ps2_rd;
   logic [255:0]                    ohe;

   assign ohe = 256'd1 << addr[31:24];

   processor_core core(
                       .clk_i(sysclk),
                       .rst_i(rst),
                       .stall_i(stall),
                       .instr_i(rom_ins),
                       .mem_rd_i(mrd),
                       .irq_req_i(irq_req),

                       .instr_addr_o(rom_addr),
                       .mem_addr_o(maddr),
                       .mem_size_o(msize),
                       .mem_req_o(mreq),
                       .mem_we_o(mwe),
                       .mem_wd_o(mwd),
                       .irq_ret_o(irq_ret)
                       );

   lsu lsu_main(
                .clk_i(sysclk),
                .rst_i(rst),
                .core_req_i(mreq),
                .core_we_i(mwe),
                .core_size_i(msize),
                .core_addr_i(maddr),
                .core_wd_i(mwd),
                .core_rd_o(mrd),
                .core_stall_o(stall),
                .mem_req_o(lsu_req),
                .mem_we_o(lsu_we),
                .mem_be_o(lsu_be),
                .mem_addr_o(addr),
                .mem_wd_o(lsu_wd),
                .mem_rd_i(lsu_rd),
                .mem_ready_i(/* ready */ 1'b1)
                );

   instr_mem imem(
                  .read_addr_i(rom_addr),
                  .read_data_o(rom_ins)
                  );

   data_mem dmem(
                 .clk_i(sysclk),
                 .mem_req_i(lsu_req & ohe[DMEM_ADDR_HIGH]),
                 .write_enable_i(lsu_we),
                 .byte_enable_i(lsu_be),
                 .addr_i({8'd0, addr[23:0]}),
                 .write_data_i(lsu_wd),
                 .read_data_o(dmem_rd)
                 // .ready_o(ready)
                 );


   hex_sb_ctrl hex(
                   .clk_i(sysclk),
                   .rst_i(rst),
                   .addr_i({8'd0, addr[23:0]}),
                   .req_i(lsu_req & ohe[HEX_ADDR_HIGH]),
                   .write_data_i(lsu_wd),
                   .write_enable_i(lsu_we),
                   .read_data_o(hex_rd),
                   .hex_led(hex_led_o),
                   .hex_sel(hex_sel_o)
                   );

   ps2_sb_ctrl ps2(
                   .clk_i(sysclk),
                   .rst_i(rst),
                   .addr_i({8'd0, addr[23:0]}),
                   .req_i(lsu_req & ohe[PS2_ADDR_HIGH]),
                   .write_data_i(lsu_wd),
                   .write_enable_i(lsu_we),
                   .read_data_o(ps2_rd),
                   .interrupt_request_o(irq_req),
                   .interrupt_return_i(irq_ret),
                   .kclk_i(kclk_i),
                   .kdata_i(kdata_i)
                   );

   always @ (*) begin
      case (addr[31:24])
        DMEM_ADDR_HIGH: lsu_rd = dmem_rd;
        HEX_ADDR_HIGH: lsu_rd = hex_rd;
        PS2_ADDR_HIGH: lsu_rd = ps2_rd;
      endcase
   end


endmodule
