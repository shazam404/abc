//Akshat Bharara
//231CS110
//S2-2

module expression2(
    input x, y, z, w,
    output reg b1_unsimplified, // unsimplified boolean expression -> behavioral modelling
    output reg b2_simplified,   // simplified boolean expression -> behavioral modelling
    output g1_unsimplified,     // unsimplified boolean expression -> structural modelling
    output g2_simplified,       // simplified boolean expression -> structural modelling
    output d1_unsimplified,     // unsimplified boolean expression -> dataflow modelling
    output d2_simplified        // simplified boolean expression -> dataflow modelling
);

    // Unsimplified boolean expression

    // Structural modelling
    wire x_not, y_not, w_not;
    wire term1, term2, term3, term4, term5, term6;

    not (x_not, x);    // x' = x_not
    not (y_not, y);    // y' = y_not
    not (w_not, w);    // w' = w_not

    and (term1, x_not, z);                     // x'z
    and (term2, w_not, x, y_not);              // w'x y'
    and (term3, x_not, y);                     // x'y
    and (term4, x, y_not);                     // xy'
    or  (term5, term3, term4);                 // x'y + xy'
    and (term6, w, term5);                     // w(x'y + xy')
    
    or  (term7, term1, term2);                 // x'z + w'x y'
    or  (g1_unsimplified, term7, term6);       // x'z + w'x y' + w(x'y + xy')

    // Dataflow modelling
    assign d1_unsimplified = ((~x) & z) | ((~w) & x & (~y)) | (w & (((~x) & y) | (x & (~y))));

    // Behavioral modelling for unsimplified version
    always @(*) begin
        if (x_not & z) begin
            b1_unsimplified = 1;
        end
        else if (w_not & x & y_not) begin
            b1_unsimplified = 1;
        end
        else if (w & (x_not & y | x & y_not)) begin
            b1_unsimplified = 1;
        end
        else begin
            b1_unsimplified = 0;
        end
    end

    // Simplified boolean expression
    /*
    F = x'z + w'x y' + w (x'y + xy')
    = x'z + w'x y' + w x'y + w xy'
    = x'z + xy'(w' + w) + w x'y
    = x'z + xy' + w x'y
    */

    // Structural modelling for simplified version
    // x'z + xy' + w x'y
    wire w1, w2, w3;
    and (w1, x_not, z);  // x'z
    and (w2, x, y_not);  // xy'
    and (w3, w, x_not, y);   // w x'y
    or  (g2_simplified, w1, w2, w3);  // x'z + xy' + w x'y

    // Dataflow modelling for simplified version
    assign d2_simplified = ((~x) & z) | (x & (~y)) | (w & (~x) & y);  // x'z + xy' + w x'y

    // Behavioral modelling for simplified version
    // x'z + xy' + w x'y
    always @(*) begin
        if ((~x & z) | (x & ~y) | (w & ~x & y)) begin
            b2_simplified = 1;
        end
        else begin
            b2_simplified = 0;
        end
    end

endmodule