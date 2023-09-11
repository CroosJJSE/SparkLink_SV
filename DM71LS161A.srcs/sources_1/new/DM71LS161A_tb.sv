class randGen;
    rand bit Clear, Load;
    rand bit [3:0] D_in;
    constraint c1 { Clear dist {1:=1, 1:=1, 0:=1}; }
    constraint c2 { Load dist {1:=1, 1:=1, 0:=1}; }
    constraint c5 { D_in inside {[1:15]}; }

    function new();
        
    endfunction //new()
endclass

module DM71LS161A_tb ();
    `timescale 1ns/1ps;
    //port declaration
    logic  Clear,Clock=1,Load,En_P=1,En_T=1,Cout=0;
    logic [3:0] D_in,D_out;


   randGen randGen1 = new();
   DM71LS161A dut(.*);
//assign  Clock=1;
   //clock generation
   initial forever begin
         #5;
          Clock=~Clock;
   end
    initial begin
        repeat(20) @(posedge Clock)  begin
            #2;
            Clear=1;
            Load=1;
            D_in=randGen1.D_in;
            $display("Clear=%b,Load=%b,D_in=%b",Clear,Load,D_in);
            randGen1.randomize();

        end
         $finish();
    end 
    
endmodule
