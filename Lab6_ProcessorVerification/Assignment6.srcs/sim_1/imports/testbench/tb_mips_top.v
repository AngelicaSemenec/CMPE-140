module tb_mips_top;

    reg         clk;
    reg         rst;
    wire        we_dm;
    wire [31:0] pc_current;
    wire [31:0] instr;
    wire [31:0] alu_out;
    wire [31:0] wd_dm;
    wire [31:0] rd_dm;
    wire [31:0] DONT_USE;
    
    mips_top DUT (
            .clk            (clk),
            .rst            (rst),
            .we_dm          (we_dm),
            .ra3            (5'h0),
            .pc_current     (pc_current),
            .instr          (instr),
            .alu_out        (alu_out),
            .wd_dm          (wd_dm),
            .rd_dm          (rd_dm),
            .rd3            (DONT_USE)
        );
    
    task tick; 
    begin 
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
    endtask

    task reset;
    begin 
        rst = 1'b0; #5;
        rst = 1'b1; #5;
        rst = 1'b0;
    end
    endtask
    
    integer cycles = 0;
    integer n = -1;
    
    initial begin
        reset;
        while(pc_current != 32'h6C) begin
            if (pc_current == 32'h0C) begin 
                $display("%i: %i", n, cycles);
                n = n + 1;
                cycles = 0;
            end
            tick;
            cycles = cycles + 1;
        end
        $display("%i: %i", n, cycles);
        $finish;
    end

endmodule