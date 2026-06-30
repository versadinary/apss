`timescale 1ns/1ps

module turnstile_fsm_tb;
   logic clk;
   logic rst;
   logic push;
   logic coin;
   logic is_locked;

   turnstile_fsm dut(.*);

   always #5 clk = ~clk;

   initial begin
      clk = 1'b0;
      rst = 'b1;
      {push, coin} = 'd0;
      #10 rst = ~rst;
      @(posedge clk) {coin, push} = 2'b10;
      @(posedge clk) {coin, push} = 2'b10;
      @(posedge clk) {coin, push} = 2'b01;
      @(posedge clk) {coin, push} = 2'b01;
      @(posedge clk) {coin, push} = 2'b10;
      @(posedge clk) {coin, push} = 2'b01;
      #20 $finish;

   end



endmodule // turnstile_fsm_tb
