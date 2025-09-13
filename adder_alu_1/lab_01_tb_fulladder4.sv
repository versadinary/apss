module lab_01_tb_fulladder4();

  logic [3:0] tb_a_i;
  logic [3:0] tb_b_i;
  logic       tb_carry_i;
  logic       tb_carry_o;
  logic [3:0] tb_sum_o;
  logic [8:0] test_case;

  fulladder4 DUT (
    .a_i(tb_a_i),
    .b_i(tb_b_i),
    .sum_o(tb_sum_o),
    .carry_i(tb_carry_i),
    .carry_o(tb_carry_o)
  );

  assign {tb_a_i, tb_b_i, tb_carry_i} = test_case;

  initial begin
    $display("Test has been started");
    #5ns;
    test_case = 9'd0;
    repeat(512) begin
      #5ns;
      test_case++;
    end
    $display("\nTest has been finished Check results at waveform window.\n");
    $finish();
    #5;
    $display("You're trying to run simulation that has finished. Aborting simulation.");
    $fatal();
  end

endmodule
