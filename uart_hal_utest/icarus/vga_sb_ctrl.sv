module vga_sb_ctrl (
    input  logic        clk_i,
    input  logic        rst_i,
    input  logic        clk100m_i,
    input  logic        req_i,
    input  logic        write_enable_i,
    input  logic [ 3:0] mem_be_i,
    input  logic [31:0] addr_i,
    input  logic [31:0] write_data_i,
    output logic [31:0] read_data_o,

    output logic [3:0] vga_r_o,
    output logic [3:0] vga_g_o,
    output logic [3:0] vga_b_o,
    output logic       vga_hs_o,
    output logic       vga_vs_o
);

  logic [31:0] char_map_rdata_o;
  logic [31:0] col_map_rdata_o;
  logic [31:0] char_tiff_rdata_o;
  logic char_map_req_i;
  logic col_map_req_i;
  logic char_tiff_req_i;
  logic char_map_we_i;
  logic col_map_we_i;
  logic char_tiff_we_i;

  always_comb begin
    case (addr_i[13:12])
      2'b00:   read_data_o = char_map_rdata_o;
      2'b01:   read_data_o = col_map_rdata_o;
      2'b10:   read_data_o = char_tiff_rdata_o;
      default: read_data_o = 'b0;
    endcase
  end


  always_comb begin
    char_map_req_i = 1'b0;
    col_map_req_i = 1'b0;
    char_tiff_req_i = 1'b0;
    char_map_we_i = 1'b0;
    col_map_we_i = 1'b0;
    char_tiff_we_i = 1'b0;
    case (addr_i[13:12])
      2'b00: {char_map_req_i, char_map_we_i} = {req_i, write_enable_i};
      2'b01: {col_map_req_i, col_map_we_i} = {req_i, write_enable_i};
      2'b10: {char_tiff_req_i, char_tiff_we_i} = {req_i, write_enable_i};
    endcase
  end


  vgachargen VGA (
      .clk_i            (clk_i),
      .clk100m_i        (clk100m_i),
      .rst_i            (rst_i),
      .char_map_req_i   (char_map_req_i),
      .char_map_addr_i  (addr_i[11:2]),
      .char_map_we_i    (char_map_we_i),
      .char_map_be_i    (mem_be_i),
      .char_map_wdata_i (write_data_i),
      .char_map_rdata_o (char_map_rdata_o),
      .col_map_req_i    (col_map_req_i),
      .col_map_addr_i   (addr_i[11:2]),
      .col_map_we_i     (col_map_we_i),
      .col_map_be_i     (mem_be_i),
      .col_map_wdata_i  (write_data_i),
      .col_map_rdata_o  (col_map_rdata_o),
      .char_tiff_req_i  (char_tiff_req_i),
      .char_tiff_addr_i (addr_i[11:2]),
      .char_tiff_we_i   (char_tiff_we_i),
      .char_tiff_be_i   (mem_be_i),
      .char_tiff_wdata_i(write_data_i),
      .char_tiff_rdata_o(char_tiff_rdata_o),
      .vga_r_o          (vga_r_o),
      .vga_g_o          (vga_g_o),
      .vga_b_o          (vga_b_o),
      .vga_hs_o         (vga_hs_o),
      .vga_vs_o         (vga_vs_o)
  );

endmodule
