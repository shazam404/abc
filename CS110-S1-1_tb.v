//Akshat Bharara
//231CS110
//S1-1

module expression_tb;
    reg A, B;
    wire o1_and, o1_or, o1_nand, o1_nor, o1_not, o1_xor, o1_xnor, o2_not;
    wire g1_and, g1_or, g1_nand, g1_nor, g1_not, g1_xor, g1_xnor;

    expression uut(
        .A(A),
        .B(B),
        .o1_and(o1_and), // represents the and gate (A & B)
        .o1_or(o1_or), // represents the or gate (A | B)
        .o1_nand(o1_nand), // represents the nand gate ~(A & B)
        .o1_nor(o1_nor), // represents the nor gate ~(A | B)
        .o1_not(o1_not), // represents the not gate for A -> ~A
        .o1_xor(o1_xor), // represents the xor gate (A ^ B)
        .o1_xnor(o1_xnor), // represents the xnor gate ~(A ^ B)
        .o2_not(o2_not), // represents the not gate for B -> ~B
        .g1_and(g1_and), // represents the and gate (A & B)
        .g1_or(g1_or), // represents the or gate (A | B)
        .g1_nand(g1_nand), // represents the nand gate ~(A & B)
        .g1_nor(g1_nor), // represents the nor gate ~(A | B)
        .g1_not(g1_not), // represents the not gate for A -> ~A
        .g1_xor(g1_xor), // represents the xor gate (A ^ B)
        .g1_xnor(g1_xnor) // represents the xnor gate ~(A ^ B)
    );

    initial begin
        // Displaying the gtkwave of the given data
        $dumpfile("CS110-S1-1.vcd");
        $dumpvars(0, expression_tb);
        $display(" ");
        // displaying the data flow model
        $display("The truth tables of the various gates using dataflow model are: ");
        $display("-------------------------------------------------------------------------");
        $display("| Time | A  | B  | A&B | A|B | ~(A&B) | ~(A|B) | A^B | ~(A^B) | ~A | ~B |");
        $display("-------------------------------------------------------------------------");
        $monitor("| %4d | %2b | %2b | %2b  | %2b  |   %2b   |   %2b   | %2b  |   %2b   | %2b | %2b |", $time, A, B, o1_and, o1_or, o1_nand, o1_nor, o1_xor, o1_xnor, o1_not, o2_not);
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        $display("-------------------------------------------------------------------------");
        $display(" ");

        // displaying the gate level model
        $display("The truth tables of the various gates using gate level model are: ");
        $display("-------------------------------------------------------------------------");
        $display("| Time | A  | B  | A&B | A|B | ~(A&B) | ~(A|B) | A^B | ~(A^B) | ~A | ~B |");
        $display("-------------------------------------------------------------------------");
        $monitor("| %4d | %2b | %2b | %2b  | %2b  |   %2b   |   %2b   | %2b  |   %2b   | %2b | %2b |", $time, A, B, g1_and, g1_or, g1_nand, g1_nor, g1_xor, g1_xnor, g1_not, o2_not);
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        $display("-------------------------------------------------------------------------");
    end
endmodule
