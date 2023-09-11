class randGen;
    rand bit reset, clock_en;
    //constraint C_reset {reset dist{1:=1,  1:=0};}
   
    constraint C_clock_en { clock_en dist{1:=1, 0:=1};}
    function new();
        
    endfunction //new()
endclass //randGen

module CD4017_tb  ();
    `timescale 1ns/1ps;
    logic clk,reset,clock_en,carry_out;
    logic [9:0] outputs;
    CD4017 dut (.*);
    assign clk=1;
    randGen R_bit= new();
    initial begin
        forever begin
            #5 clk = ~clk;
        end
        end
    initial begin
        #30;
        repeat(20) begin
            @(posedge clk)  begin
                #2;
                reset=0;
                clock_en=R_bit.clock_en;
                R_bit.randomize();
            end
        end
         $finish();
    end
   
endmodule