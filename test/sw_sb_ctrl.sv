module sw_sb_ctrl(
/*
    Часть интерфейса модуля, отвечающая за подключение к системной шине
*/
                  input logic         clk_i,
                  input logic         rst_i,
                  input logic         req_i,
                  input logic         write_enable_i,
                  input logic [31:0]  addr_i,
                  input logic [31:0]  write_data_i, // не используется, добавлен для
                                     // совместимости с системной шиной
                  output logic [31:0] read_data_o,

/*
    Часть интерфейса модуля, отвечающая за отправку запросов на прерывание
    процессорного ядра
*/

                  output logic        interrupt_request_o,
                  input logic         interrupt_return_i,

/*
    Часть интерфейса модуля, отвечающая за подключение к периферии
*/
                  input logic [15:0]  sw_i
);

   logic [15:0]                       sw_ff;
   logic                              data_change;

   always_ff @(posedge clk_i or posedge rst_i) begin
      if (rst_i) begin
         sw_ff <= 'd0;
      end
      else begin
         sw_ff <= sw_i;
         data_change <= (sw_i != sw_ff);
      end
   end

   always_comb begin
      if (!write_enable_i & req_i & !addr_i) begin
         assign read_data_o = {16'd0, sw_i};
      end
   end



endmodule
