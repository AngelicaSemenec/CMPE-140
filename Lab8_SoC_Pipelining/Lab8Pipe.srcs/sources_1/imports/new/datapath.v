module datapath (
        input  wire        clk,
        input  wire        rst,
        input  wire [31:0] instrF,      //Goes to IF
        input  wire        branchD,     //Goes to ID
        input  wire        jumpD,
        input  wire        linkD,
        input  wire        reg_dstD,
        input  wire        we_regD,
        input  wire        alu_srcD,
        input  wire        dm2regD,
        input  wire [3:0]  alu_ctrlD,
        input  wire        jr_selD,
        input  wire        we_dmD,
        input  wire [31:0] rd_dmM,      //Goes to MEM
        input  wire [4:0]  ra3,         //Not used
        output wire [31:0] pc_currentF, //From IF to imem
        output wire [31:0] wa_dmM,      //From MEM to dmem
        output wire [31:0] wd_dmM,
        output wire we_dmM_out,         //we_dmM_out = we_dmM, goes to dmem
        output wire [31:0] instr_to_cu, //instrD
        output wire [31:0] rd3          //Not used
    );

//Control Signals
    //Pipeline Registers
    wire [9:0] in_csDE, out_csDE;
    wire [3:0] in_csEM, out_csEM;
    wire [1:0] in_csMW, out_csMW;

    //EXE stage
    wire dm2regE, we_dmE, linkE, alu_srcE, reg_dstE, we_regE;
    wire [3:0] alu_ctrlE;
    //MEM stage
    wire dm2regM, we_dmM, linkM, we_regM;
    //WB stage
    wire dm2regW, we_regW;
    //Stage Assignments
        // ID/EXE
    assign in_csDE = {dm2regD, we_dmD, linkD, alu_ctrlD, alu_srcD, reg_dstD, we_regD};
    assign {dm2regE, we_dmE, linkE, alu_ctrlE, alu_srcE, reg_dstE, we_regE} = out_csDE;
        // EXE/MEM
    assign in_csEM = {dm2regE, we_dmE, linkE, we_regE};
    assign {dm2regM, we_dmM, linkM, we_regM} = out_csEM;
        // MEM/WB
    assign in_csMW = {dm2regM, we_regM};
    assign {dm2regW, we_regW} = out_csMW;
    
    assign we_dmM_out = we_dmM;
    
//Hazard Unit Outputs
    wire stallIF, stallID, flushE;
    wire forwardAD, forwardBD;
    wire [1:0] forwardAE, forwardBE;
    
//Datapath Stage Signals   
    //wire [4:0]  rf_wa;
    //wire [4:0]  rf_a;
    //wire [31:0] rf_d;
    //wire [31:0] pc_plus4;
    //wire [31:0] sext_imm;
    //wire [31:0] alu_pa;
    //wire [31:0] wd_rf;
    wire [31:0] pc_preF;    //From IF
    wire [31:0] pc_jmpF;
    wire [31:0] pc_nextF;
    wire        pc_srcD;    //From ID
    wire [31:0] baD;
    wire [31:0] btaD;
    wire [31:0] jtaD;
    wire [31:0] alu_pbE;    //From EXE
    wire        zero;       //Not used 
    
    wire [31:0] instrD;
    wire [4:0] rsD, rtD, rdD, rsE, rtE, rdE;
    wire [4:0] shamtD, shamtE;
        assign rsD = instrD[25:21];
        assign rtD = instrD[20:16];
        assign rdD = instrD[15:11];
        assign shamtD = instrD[10:6];
    wire [4:0] rf_wa_midE, rf_waE, rf_waM, rf_waW;
    wire [31:0] rd1D, rd2D, alu_paE, rd1E, rd2E, wd_dmE;
    wire [31:0] sext_immD, sext_immE;
    wire [31:0] pc_plus4F, pc_plus4D, pc_plus4E, pc_plus4M;
    wire [31:0] pc_plus8M;
    //ForwardD multiplexer outputs
        //Branch data A and Branch data B
    wire [31:0] br_dA, br_dB;
        assign pc_srcD = ((br_dA == br_dB) & branchD);  //Determine if branch condition is met
        assign baD = {sext_immD[29:0], 2'b00};
        assign jtaD = {pc_plus4D[31:28], instrD[25:0], 2'b00};
    //ALU output and ALU or pc + 8 multiplexer output
    wire [31:0] alu_outE, alu_outM;
    wire [31:0] rd_dmW;
    wire [31:0] wd_rfW;
    wire [31:0] wa_dmW;
    
    assign instr_to_cu = instrD;
    
    wire flushID;
    
    
    // --- PC Logic --- //
    //Three multiplexers for determining next pc value
            //IF
    mux2 #(32) pc_src_mux (
            .sel            (pc_srcD),
            .a              (pc_plus4F),
            .b              (btaD),
            .y              (pc_preF)
        );
    
           //IF
    mux2 #(32) pc_jmp_mux (
            .sel            (jumpD),
            .a              (pc_preF),
            .b              (jtaD),
            .y              (pc_jmpF)
        );
    
            //IF
    mux2 #(32) pc_jr_mux (
            .sel            (jr_selD),
            .a              (pc_jmpF),
            .b              (br_dA),
            .y              (pc_nextF)
    );
    
    // PC register
            //IF
    dreg_en pc_reg (
            .clk            (clk),
            .rst            (rst),
            .stallIF        (stallIF),
            .d              (pc_nextF),
            .q              (pc_currentF)    //Goes to imem
        );
            
    //PC plus 4
            //IF
    adder pc_plus_4 (
            .a              (pc_currentF),
            .b              (32'd4),
            .y              (pc_plus4F)
        );
        
// IF_ID PIPELINE REGISTER
    IF_ID IF_ID(
        .clk        (clk),
        .instrF     (instrF),
        .pc_plus4F  (pc_plus4F),
        .stallID    (stallID),
        .flushID    (flushID),
        .instrD     (instrD),
        .pc_plus4D  (pc_plus4D)
    );
    
   //Sign Extended Immediate Value
            //ID
    signext se (
            .a              (instrD[15:0]),
            .y              (sext_immD)
        );

    //Calculating branch target address for early branch determination
            //ID
    adder pc_plus_br (
            .a              (pc_plus4D),
            .b              (baD),
            .y              (btaD)
        );
       
       // --- RF Logic --- //
    //Register File
            //ID
    regfile rf (
            .clk            (clk),
            .we             (we_regW),
            .ra1            (instrD[25:21]),
            .ra2            (instrD[20:16]),
            .ra3            (ra3),              //Not used
            .wa             (rf_waW),
            .wd             (wd_rfW),
            .rd1            (rd1D),
            .rd2            (rd2D),
            .rd3            (rd3)               //Not used
        );
       
   //Forwarding multiplexers in the ID stage
        //Data forwarding from WB
            //ID 
    mux2 #(32) forward_AD_mux (
        .sel (forwardAD),
        .a (rd1D),
        .b (wd_rfW),
        .y (br_dA)
    );
    
            //ID
    mux2 #(32) forward_BD_mux (
        .sel (forwardBD),
        .a (rd2D),
        .b (wd_rfW),
        .y (br_dB)
    );
     
// ID_EXE PIPELINE REGISTER  
    ID_EXE ID_EXE (
        .clk        (clk),
        .csD        (in_csDE),
        .rd1D       (rd1D),
        .rd2D       (rd2D),
        .shamtD     (shamtD),
        .rsD        (rsD),
        .rtD        (rtD),
        .rdD        (rdD),
        .pc_plus4D  (pc_plus4D),
        .sext_immD  (sext_immD),
        .flushE     (flushE),
        .csE        (out_csDE),
        .rd1E       (rd1E),
        .rd2E       (rd2E),
        .shamtE     (shamtE),
        .rsE        (rsE),
        .rtE        (rtE),
        .rdE        (rdE),
        .pc_plus4E  (pc_plus4E),
        .sext_immE  (sext_immE)
    );
    
            //EXE
    mux2 #(5) rf_wa_mid_mux (
            .sel            (reg_dstE),
            .a              (rtE),
            .b              (rdE),
            .y              (rf_wa_midE)
        );
        
            //EXE
    mux2 #(5) rf_wa_mux (
            .sel            (linkE),
            .a              (rf_wa_midE), 
            .b              (5'b1),
            .y              (rf_waE)
        );
    
    //Forwarding to EXE
            //EXE
    mux4 #(32) forward_AE_mux (
        .sel    (forwardAE),
        .a      (rd1E),
        .b      (wd_rfW),
        .c      (wa_dmM),
        .d      (0),
        .y      (alu_paE)
    );
            
            //EXE
    mux4 #(32) forward_BE_mux (
        .sel    (forwardBE),
        .a      (rd2E),
        .b      (wd_rfW),
        .c      (wa_dmM),
        .d      (0),
        .y      (wd_dmE)
    );

    // --- ALU Logic --- //
            //EXE
    mux2 #(32) alu_pb_mux (
            .sel            (alu_srcE),
            .a              (wd_dmE),
            .b              (sext_immE),
            .y              (alu_pbE)
        );

            //EXE
    alu alu (
            .clk            (clk),
            .op             (alu_ctrlE),
            .a              (alu_paE),
            .b              (alu_pbE),
            .c              (shamtE),
            .zero           (zero),
            .y              (alu_outE)
        );
        
//EXE_MEM PIPELINE REGISTER
    EXE_MEM EXE_MEM (
        .clk (clk),
        .csE (in_csEM),
        .alu_outE (alu_outE),
        .wd_dmE (wd_dmE),
        .rf_waE (rf_waE),
        .pc_plus4E (pc_plus4E),
        .csM (out_csEM),
        .alu_outM (alu_outM),
        .wd_dmM (wd_dmM),
        .rf_waM (rf_waM),
        .pc_plus4M (pc_plus4M)
    );

    // --- MEM Logic --- //
            //MEM
    adder pc_plus_8 (
            .a              (pc_plus4M),
            .b              (32'd4),
            .y              (pc_plus8M)
    );
    
            //MEM
    mux2 #(32) wa_dm_src_mux (
        .sel (linkM),
        .a (alu_outM),
        .b (pc_plus8M),
        .y (wa_dmM)
    );
    
//MEM_WB PIPELINE REGISTER
    MEM_WB MEM_WB (
        .clk (clk),
        .csM (in_csMW),
        .wa_dmM (wa_dmM),
        .rd_dmM (rd_dmM),
        .rf_waM (rf_waM),
        .csW (out_csMW),
        .wa_dmW (wa_dmW),
        .rd_dmW (rd_dmW),
        .rf_waW (rf_waW)
    );
    
            //WB
    mux2 #(32) rf_wd_mux (
            .sel            (dm2regW),
            .a              (wa_dmW),
            .b              (rd_dmW),
            .y              (wd_rfW)
        );
        
    // --- Hazard Unit Logic --- //
    HazardUnit HazardUnit (
        .rsD (rsD),
        .rtD (rtD),
        .pc_srcD (pc_srcD),
        .jumpD (jumpD),
        .jr_selD (jr_selD),
        .branchD (branchD),
        .rsE (rsE),
        .rtE (rtE),
        .we_regE (we_regE),
        .rf_waE (rf_waE),
        .dm2regE (dm2regE),
        .dm2regM (dm2regM),
        .we_regM (we_regM),
        .rf_waM (rf_waM),
        .rf_waW (rf_waW),
        .we_regW (we_regW),
        .stallIF (stallIF),
        .stallID (stallID),
        .flushE (flushE),
        .flushID (flushID),
        .forwardAD (forwardAD),
        .forwardBD (forwardBD),
        .forwardAE (forwardAE),
        .forwardBE (forwardBE)
    );
    
endmodule