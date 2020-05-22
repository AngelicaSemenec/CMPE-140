module mips (
        input  wire        clk,
        input  wire        rst,
        input  wire [4:0]  ra3,
        input  wire [31:0] instr,
        input  wire [31:0] rd_dm,
        output wire        we_dm,
        output wire [31:0] pc_current,
        output wire [31:0] wa_dm,
        output wire [31:0] wd_dm,
        output wire [31:0] rd3
    );
    
    wire       branch;
    wire       jump;
    wire       link;
    wire       reg_dst;
    wire       we_reg;
    wire       alu_src;
    wire       dm2reg;
    wire [3:0] alu_ctrl;
    wire       jr_sel;
    wire we_dmD;
    wire [31:0] instrD;

    datapath dp (
            .clk            (clk),
            .rst            (rst),
            .instrF         (instr),        //To IF
            .branchD        (branch),       //To ID
            .jumpD          (jump),
            .linkD          (link),
            .reg_dstD       (reg_dst),
            .we_regD        (we_reg),
            .we_dmD         (we_dmD),
            .alu_srcD       (alu_src),
            .dm2regD        (dm2reg),
            .alu_ctrlD      (alu_ctrl),
            .jr_selD        (jr_sel),
            .rd_dmM         (rd_dm),        //To MEM
            .ra3            (ra3),          //Not used
            .pc_currentF    (pc_current),   //From IF
            .wa_dmM         (wa_dm),        //From MEM
            .wd_dmM         (wd_dm),        
            .we_dmM_out     (we_dm),
            .instr_to_cu    (instrD),
            .rd3            (rd3)           //Not used
        );

    controlunit cu (
            .opcode         (instrD[31:26]),
            .funct          (instrD[5:0]),
            .branch         (branch),
            .jump           (jump),
            .link           (link),
            .reg_dst        (reg_dst),
            .we_reg         (we_reg),
            .alu_src        (alu_src),
            .we_dm          (we_dmD),
            .dm2reg         (dm2reg),
            .alu_ctrl       (alu_ctrl),
            .jr_sel         (jr_sel)
        );

endmodule