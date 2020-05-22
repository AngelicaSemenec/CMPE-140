module mips_fpga (
        input  wire       clk,
        input  wire       rst,
        input  wire       button,
        input  wire [4:0] switches,
        output wire [3:0] LEDSEL,
        output wire [7:0] LEDOUT,
        output wire       dispSe,
        output wire       factErr
    );

    wire  [15:0] reg_hex;
    wire        clk_sec;
    wire        clk_5KHz;
    wire        clk_pb;

    wire [7:0]  digit0;
    wire [7:0]  digit1;
    wire [7:0]  digit2;
    wire [7:0]  digit3;

    wire [31:0] gpI1;
    wire [31:0] gpI2;
    wire [31:0] gpO1;
    wire [31:0] gpO2;
    
    assign gpI1 = {27'b0, switches};
    assign gpI2 = gpO1;
    assign dispSe = switches[4];
    assign factErr = gpO1[0];

    clk_gen clk_gen (
            .clk100MHz          (clk),
            .rst                (rst),
            .clk_4sec           (clk_sec),
            .clk_5KHz           (clk_5KHz)
        );

    button_debouncer bd (
            .clk                (clk_5KHz),
            .button             (button),
            .debounced_button   (clk_pb)
        );
       
        

//Switches [3:0] used for n
//Switch [4] for display select
    mips_top mips_top (
            .clk                (clk_pb),
            .rst                (rst),
            .gpI1               (gpI1),
            .gpI2               (gpI2),
            .gpO1               (gpO1),
            .gpO2               (gpO2)
        );
        
   mux2 #(32) gpO_mux (
            .sel                (dispSe),
            .a                  (gpO2[15:0]),
            .b                  (gpO2[31:16]),
            .y                  (reg_hex)
   );


    hex_to_7seg hex3 (
            .HEX                (reg_hex[15:12]),
            .s                  (digit3)
        );

    hex_to_7seg hex2 (
            .HEX                (reg_hex[11:8]),
            .s                  (digit2)
        );

    hex_to_7seg hex1 (
            .HEX                (reg_hex[7:4]),
            .s                  (digit1)
        );

    hex_to_7seg hex0 (
            .HEX                (reg_hex[3:0]),
            .s                  (digit0)
        );

    led_mux led_mux (
            .clk                (clk_5KHz),
            .rst                (rst),
            .LED3               (digit3),
            .LED2               (digit2),
            .LED1               (digit1),
            .LED0               (digit0),
            .LEDSEL             (LEDSEL),
            .LEDOUT             (LEDOUT)
        );

endmodule
