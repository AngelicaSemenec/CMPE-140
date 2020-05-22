`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2019 01:47:21 PM
// Design Name: 
// Module Name: tb_address_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_address_decoder;

reg tb_we_dec;
reg [27:0] tb_A;
wire tb_we_gpio;
wire tb_we_fact;
wire tb_we_dm;
wire [1:0] tb_RdSel;

system_ad system_ad (
            .WE             (tb_we_dec),
            .A              (tb_A),
            .WE2            (tb_we_gpio),
            .WE1            (tb_we_fact),
            .WEM            (tb_we_dm),
            .RdSel          (tb_RdSel)
    );


initial begin
    tb_we_dec = 1;
    #100;
    tb_A = 28'hx;
    #100;
    tb_A = 28'h80;
    #100;
    tb_A = 28'h90;
    #100;
end


endmodule
