module error_reg(
    input wire clk, rst, GoPulseCmb, Err,
    output reg ResErr
    );
    
    always @ (posedge clk, posedge rst) begin
        if (rst) ResErr <= 1'b0;
        else ResErr <= (~GoPulseCmb) & (Err | ResErr);
    end
    
endmodule
