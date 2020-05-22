module mips_top (
        input  wire        clk,
        input  wire        rst,
        input  wire [4:0]  ra3,
        input  wire [31:0] gpI1,
        input  wire [31:0] gpI2,
        output wire        we_dec,
        output wire [31:0] pc_current,
        output wire [31:0] instr,
        output wire [31:0] wa_dm,
        output wire [31:0] wd_dm,
        output wire [31:0] rd_dm,
        output wire [31:0] rd3,
        output wire [31:0] gpO1,
        output wire [31:0] gpO2
    );

    wire [31:0] DONT_USE;
    
    wire we_mem, we_gpio, we_fact;
    wire [1:0] RdSel;
    wire [31:0] factData, gpioData, memData;
    wire [31:0] rd_dmM;
    assign rd_dm = rd_dmM;

    mips mips (
            .clk            (clk),
            .rst            (rst),
            .ra3            (ra3),
            .instr          (instr),
            .rd_dm          (rd_dmM),
            .we_dm          (we_dec),
            .pc_current     (pc_current),
            .wa_dm          (wa_dm),
            .wd_dm         (wd_dm),
            .rd3            (rd3)
        );

    imem imem (
            .a              (pc_current[7:2]),
            .y              (instr)
        );
        
    system_ad system_ad (
            .WE             (we_dec),
            .A              (wa_dm[31:4]),
            .WE2            (we_gpio),
            .WE1            (we_fact),
            .WEM            (we_mem),
            .RdSel          (RdSel)
    );

    dmem dmem (
            .clk            (clk),
            .we             (we_mem),
            .a              (wa_dm[7:2]),
            .d              (wd_dm),
            .q              (memData)
        );
        
    fact_top fact_top (
            .clk            (clk),
            .rst            (rst),
            .A              (wa_dm[3:2]),
            .WE             (we_fact),
            .WD             (wd_dm),
            .RD             (factData)
    );
    
    gpio_top gpio_top (
            .clk            (clk),
            .A              (wa_dm[3:2]),
            .gpI1           (gpI1),
            .gpI2           (gpI2),
            .WE             (we_gpio),
            .WD             (wd_dm),
            .RD             (gpioData),
            .gpO1           (gpO1),
            .gpO2           (gpO2)
    );
    
    mux4 #(32) system_mux (
            .sel            (RdSel),
            .a              (memData),
            .b              (memData),
            .c              (factData),
            .d              (gpioData),
            .y              (rd_dmM)
    );

endmodule