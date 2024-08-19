//Akshat Bharara
//231CS110
//S1-1

module expression(
    input A, B,
    output o1_and, o1_or, o1_nand, o1_nor, o1_not, o1_xor, o1_xnor,o2_not,
    output g1_and, g1_or, g1_nand, g1_nor, g1_not, g1_xor, g1_xnor
);

    // dataflow model
    assign o1_and = (A & B);
    assign o1_nand = ~(A & B);
    assign o1_or = (A | B);
    assign o1_nor = ~(A | B);
    assign o1_xor = (A ^ B);
    assign o1_xnor = ~(A ^ B);
    assign o1_not = ~(A);
    assign o2_not = ~(B); 

    // gate level model
    and(g1_and, A, B);
    nand(g1_nand, A, B);
    or(g1_or, A, B);
    nor(g1_nor, A, B);
    xor(g1_xor, A, B);
    xnor(g1_xnor, A, B);
    not(g1_not, A);

endmodule
