module CD4017 (
    input logic  clk,reset,clock_en,
    output logic carry_out,
    output logic [9:0] outputs

);
assign outputs= 10'b0;
//Reset is a synchronus active low input.
always_ff @( posedge clk  ) begin : counter
    if (reset) begin
        outputs= 10'b0;
    
    end
    else if (!clock_en) begin
        unique case (outputs)
            10'b0  : outputs= 10'b1;
            10'b1  : outputs= 10'b10;
            10'b10 : outputs= 10'b100;
            10'b100: outputs= 10'b1000;
            10'b1000: outputs= 10'b10000;
            10'b10000: outputs= 10'b100000;
            10'b100000: outputs= 10'b1000000;
            10'b1000000: outputs= 10'b10000000;
            10'b10000000: outputs= 10'b100000000;
            10'b100000000: outputs= 10'b1000000000;
            10'b1000000000: outputs= 10'b0;
            default: outputs= 10'bx;
        endcase
    end
end
always_ff @( posedge clk ) begin : carry_outBlock   
unique case (outputs)
            10'b0  : carry_out= 1;
            10'b1  : carry_out= 1;
            10'b10 : carry_out= 1;
            10'b100: carry_out= 1;
            10'b1000: carry_out= 1;
            10'b10000: carry_out= 1;
            10'b100000: carry_out= 0;
            10'b1000000: carry_out=0;
            10'b10000000: carry_out= 0;
            10'b100000000: carry_out= 0;
            10'b1000000000: carry_out= 0;
        endcase

end

    
endmodule