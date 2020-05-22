module auxdec (
        input  wire [1:0] alu_op,
        input  wire [5:0] funct,
        output wire [3:0] alu_ctrl,
        output reg       jr_sel
    );

    reg [3:0] ctrl;

    assign {alu_ctrl} = ctrl;

    always @ (alu_op, funct) begin
        jr_sel = 0;
        case (alu_op)
            2'b00: ctrl = 4'b0010;          // ADD
            2'b01: ctrl = 4'b0110;          // SUB
            default: case (funct)
                6'b00_0000: ctrl = 4'b1001; // SLL
                6'b00_0010: ctrl = 4'b1010; // SRL
                6'b00_1000: begin
                                ctrl = 4'b1000; // JR
                                jr_sel = 1;
                            end
                6'b01_0000: ctrl = 4'b0100; // MFHI
                6'b01_0010: ctrl = 4'b0101; // MFLO
                6'b01_1001: ctrl = 4'b0011; // MULTU
                6'b10_0100: ctrl = 4'b0000; // AND
                6'b10_0101: ctrl = 4'b0001; // OR
                6'b10_0000: ctrl = 4'b0010; // ADD
                6'b10_0010: ctrl = 4'b0110; // SUB
                6'b10_1010: ctrl = 4'b0111; // SLT
                default:    ctrl = 4'b0000;
            endcase
        endcase
    end

endmodule