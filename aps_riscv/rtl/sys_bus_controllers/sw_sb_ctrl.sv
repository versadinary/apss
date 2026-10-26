module sw_sb_ctrl(
    input logic clk_i,
    input logic rst_i,
    input logic req_i,
    input logic write_enable_i,
    input logic [31:0] addr_i,
    input logic [31:0] write_data_i,
    output logic [31:0] read_data_o,
    output logic interrupt_request_o,
    input logic interrupt_return_i,
    input logic [15:0] sw_i
);

    logic [15:0] sw_ff;

    always_ff @ (posedge clk_i) begin
        if (rst_i) sw_ff <= 16'd0;
        else sw_ff <= sw_i;
    end

    logic value_changed;
    assign value_changed = (sw_i != sw_ff);

    assign interrupt_request_o = value_changed & ~interrupt_return_i;

    always_ff @ (posedge clk_i) begin
        if (req_i & ~write_enable_i & (addr_i[7:0] == 8'h00)) begin
            read_data_o <= {16'd0, sw_i};
        end
        else read_data_o <= read_data_o;
    end



endmodule