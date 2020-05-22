module HazardUnit(
    input wire [4:0] rsD,
    input wire [4:0] rtD,
    input wire pc_srcD,
    input wire jumpD,
    input wire jr_selD,
    input wire branchD,
    input wire [4:0] rsE,
    input wire [4:0] rtE,
    input wire we_regE,
    input wire [4:0] rf_waE,
    input wire dm2regE,
    input wire dm2regM,
    input wire we_regM,
    input wire [4:0] rf_waM,
    input wire [4:0] rf_waW,
    input wire we_regW,
    output reg stallIF,
    output reg stallID,
    output reg flushID,
    output reg flushE,
    output reg forwardAD,
    output reg forwardBD,
    output reg [1:0] forwardAE,
    output reg [1:0] forwardBE
    );
    
    reg lwstall;
    reg branchstall;
    reg jumpstall;
    reg stall;
    //reg branch_taken;
    
    initial begin
        lwstall = 0;
        branchstall = 0;
        jumpstall = 0;
        stall = 0;
    end
    
    always @ (*) begin
        // forwardAE and forwardBE
        if (we_regW & (rsE != 0) & (rf_waW == rsE))
            forwardAE = 2'b01;
        else if (we_regM & (rsE != 0) & (rf_waM == rsE))
            forwardAE = 2'b10;
        else forwardAE = 2'b00;
        
        if (we_regW & (rtE != 0) & (rf_waW == rtE))
            forwardBE = 2'b01;
        else if (we_regM & (rtE != 0) & (rf_waM == rtE))
            forwardBE = 2'b10;
        else forwardBE = 2'b00;
        
        //forwardAD and forwardBD   
        forwardAD = (branchD) & we_regM & (rsD != 0) & (rf_waM == rsD);
        forwardBD = (branchD) & we_regM & (rtD != 0) & (rf_waM == rtD);
        
        //lwstall
        lwstall = ((rsD == rtE) | (rtD == rtE)) & dm2regE;
        
        //branchstall
        branchstall = (branchD & we_regE & ((rf_waE == rsD) | (rf_waE == rtD)))
	    | (branchD & dm2regM & ((rf_waM == rsD) | (rf_waM == rtD)));
	    
        
        //jumpstall
        jumpstall = jumpD | jr_selD;
        
        //stall logic
        stall = lwstall | branchstall;
        stallIF = stall;
        stallID = stall;
        flushE = stall;
        
        //If branch taken and no hazard stalling, flush ID stage
        flushID = (((pc_srcD == 1) & branchD) | jumpD) & (stall == 0); 
        
    end
      
endmodule