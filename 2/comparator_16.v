module comparator_16 (
    input  [15: 0] A,
    input  [15: 0] B,
    output         out_A_G_B,
    output         out_A_E_B,
    output         out_A_L_B
);

    wire   [ 2: 0] w0;
    wire   [ 2: 0] w1;
    wire   [ 2: 0] w2;
    wire   [ 2: 0] w3;

    assign w0 = 3'b010;

    comparator_4 m1(A[ 3: 0], B[ 3: 0], w0[0], w0[1], w0[2], w1[0]    , w1[1]    , w1[2]    );
    comparator_4 m2(A[ 7: 4], B[ 7: 4], w1[0], w1[1], w1[2], w2[0]    , w2[1]    , w2[2]    );
    comparator_4 m3(A[11: 8], B[11: 8], w2[0], w2[1], w2[2], w3[0]    , w3[1]    , w3[2]    );
    comparator_4 m4(A[15:12], B[15:12], w3[0], w3[1], w3[2], out_A_G_B, out_A_E_B, out_A_L_B);
endmodule

module comparator_4 (
    input  [ 3: 0] A,
    input  [ 3: 0] B,
    input          in_A_G_B,
    input          in_A_E_B,
    input          in_A_L_B,
    output         out_A_G_B,
    output         out_A_E_B,
    output         out_A_L_B
);

    assign out_A_G_B = (  A[3] && ~B[3])
                    || (( A[3] ==  B[3]) && ( A[2] && ~B[2]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] && ~B[1]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] ==  B[1]) && ( A[0] && ~B[0]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] ==  B[1]) && ( A[0] ==  B[0]) && in_A_G_B); 
    assign out_A_L_B = ( ~A[3] &&  B[3])
                    || (( A[3] ==  B[3]) && (~A[2] &&  B[2]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && (~A[1] &&  B[1]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] ==  B[1]) && (~A[0] &&  B[0]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] ==  B[1]) && ( A[0] ==  B[0]) && in_A_L_B); 
    assign out_A_E_B = (  A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] ==  B[1]) && ( A[0] ==  B[0]) && in_A_E_B;
endmodule