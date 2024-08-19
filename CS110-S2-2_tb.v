//Akshat Bharara
//231CS110
//S2-2

module expression2_tb;
    reg x, y, z, w;
    wire b1_unsimplified, b2_simplified;
    wire g1_unsimplified, g2_simplified;
    wire d1_unsimplified, d2_simplified;

    expression2 uut(
        .x(x),
        .y(y),
        .z(z),
        .w(w),
        .b1_unsimplified(b1_unsimplified),
        .g1_unsimplified(g1_unsimplified),
        .d1_unsimplified(d1_unsimplified),
        .b2_simplified(b2_simplified),
        .g2_simplified(g2_simplified),
        .d2_simplified(d2_simplified)
    );

    initial begin
        // Displaying the gtkwave of the given data
        $dumpfile("CS110-S2-2.vcd");
        $dumpvars(0, expression2_tb);
        $display(" ");
        $display("d1 b1 g1 represent the value of the unsimplified boolean expression :");
        $display("d2 b2 g2 represent the value of the simplified boolean expression :");
        $display(" ");
        $display("----------------------------------------------------------");
        $display("| Time | x  | y  | z  | w  | d1 | b1 | g1 | d2 | b2 | g2 |");
        $display("----------------------------------------------------------");
        $monitor("| %4d | %2b | %2b | %2b | %2b | %2b | %2b | %2b | %2b | %2b | %2b |", $time, x, y, z, w, d1_unsimplified, b1_unsimplified, g1_unsimplified, d2_simplified, b2_simplified, g2_simplified);
        x = 0; y = 0; z = 0; w = 0; #10;
        x = 0; y = 0; z = 0; w = 1; #10;
        x = 0; y = 0; z = 1; w = 0; #10;
        x = 0; y = 0; z = 1; w = 1; #10;
        x = 0; y = 1; z = 0; w = 0; #10;
        x = 0; y = 1; z = 0; w = 1; #10;
        x = 0; y = 1; z = 1; w = 0; #10;
        x = 0; y = 1; z = 1; w = 1; #10;
        x = 1; y = 0; z = 0; w = 0; #10;
        x = 1; y = 0; z = 0; w = 1; #10;
        x = 1; y = 0; z = 1; w = 0; #10;
        x = 1; y = 0; z = 1; w = 1; #10;
        x = 1; y = 1; z = 0; w = 0; #10;
        x = 1; y = 1; z = 0; w = 1; #10;
        x = 1; y = 1; z = 1; w = 0; #10;
        x = 1; y = 1; z = 1; w = 1; #10;
        $display("----------------------------------------------------------");
        $finish;
    end
endmodule
