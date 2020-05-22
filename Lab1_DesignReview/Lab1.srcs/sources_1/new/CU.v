
module CU(
input GO, GT1, GT12, clk, rst,
output reg en, load_cnt, load_reg, sel0, sel1, done, error
);

reg [1:0] state, next_state;

initial begin
    next_state = 0;
end

always @(state, GO, GT1, GT12) begin
case(state)
    0: begin
        if (GO == 1) begin
            done = 0;
            error = 0;
            next_state = 1;
        end
        else next_state = 0;
        if (GT12 == 1) begin
            error = 1;
            done = 1;
            next_state = 0;
        end
    end
    1: begin
            next_state = 2;
    end
    2: begin
        if (GT1 == 0) begin
            next_state = 3;
        end
        else if (GT1 == 1) begin
            next_state = 2;
        end
    end
    3: begin
       next_state = 0; 
       done = 1;
    end
endcase
end

always @(posedge clk, posedge rst) begin
    if (rst == 1) begin
        state <= 0;
    end
    else begin
        state <= next_state;
    end
end

always @(state) begin

case(state)
    0: begin
       en = 0;
       load_cnt = 0;
       load_reg = 0;
       sel0 = 0;
       sel1 = 1;
    end
    1: begin
        en = 1;
        load_cnt = 1;
        load_reg = 1;
        sel0 = 0;
        sel1 = 1;
    end
    2: begin
        en = 1;
        load_cnt = 0;
        load_reg = 1;
        sel0 = 1;
        sel1 = 1;
    end
    3: begin
        en = 0;
        load_cnt = 0;
        load_reg = 0;
        sel0 = 1;
        sel1 = 1;
    end
endcase
end

endmodule
