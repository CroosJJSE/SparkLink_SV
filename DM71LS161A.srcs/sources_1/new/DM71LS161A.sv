module DM71LS161A (
    input logic Clear, Clock, Load, En_P, En_T,
    input logic [3:0] D_in,
    output logic Cout,
    output logic [3:0] D_out
);

    logic [3:0] count = 0;
    
    always_ff @(posedge Clock) begin
        if (!Clear) begin
            count <= 4'b0000;
        end
        else if (!Load) begin
            count <= D_in;  
        end
        else if (En_P & En_T) begin
            if (count == 4'b1111) begin
                count <= 4'b0000;
                Cout <= 1'b1;
            end
            else begin
                count <= count + 1'b1;
                Cout <= 1'b0;
            end
        end
    end
    
    assign D_out = count;

endmodule
