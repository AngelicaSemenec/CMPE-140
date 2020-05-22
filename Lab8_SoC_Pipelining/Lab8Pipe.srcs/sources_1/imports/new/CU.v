module CU(
input GO, GT1, GT12, clk, rst,
output reg en, load_cnt, load_reg, sel0, sel1, done, error
);

reg [1:0] state, next_state;

initial begin
    next_state = 0;
    done = 0;
    error = 0;
end

always @(posedge clk, posedge rst) begin
    if (rst == 1) begin
        state <= 0;
    end
    else begin
        state <= next_state;
    end
end

always @(state, GT1, GT12, GO) begin
case(state)
    0: begin
        done = 0;
        error = 0;
        if (GO == 1) begin
            next_state = 1;
            //error = 0;
        end
    end
    1: begin
        next_state = 2;
    end
    2: begin
        if (GT12 == 1) begin
            done = 1;
            error = 1;
            next_state = 0;
        end
        else if (GT1 == 1) begin
            done = 0;
            next_state = 2;
        end
        else begin
            done = 1;
            next_state = 0;
        end

    end
endcase
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
        sel1 = 0;
    end
    2: begin
        load_cnt = 0;
        en = 1;
        load_reg = 1;
        sel0 = 1;
        sel1 = 1;
    end
endcase
end

endmodule