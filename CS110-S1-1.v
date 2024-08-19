//Akshat Bharara
//231CS110
//S1-1

module expression(
    input A, B,
    output d1_and, d1_or, d1_nand, d1_nor, d1_not, d1_xor, d1_xnor,d2_not,
    output g1_and, g1_or, g1_nand, g1_nor, g1_not, g1_xor, g1_xnor
);

    // dataflow model
    assign d1_and = (A & B);
    assign d1_nand = ~(A & B);
    assign d1_or = (A | B);
    assign d1_nor = ~(A | B);
    assign d1_xor = (A ^ B);
    assign d1_xnor = ~(A ^ B);
    assign d1_not = ~(A);
    assign d2_not = ~(B); 

    // gate level model
    and(g1_and, A, B);
    nand(g1_nand, A, B);
    or(g1_or, A, B);
    nor(g1_nor, A, B);
    xor(g1_xor, A, B);
    xnor(g1_xnor, A, B);
    not(g1_not, A);

endmodule
