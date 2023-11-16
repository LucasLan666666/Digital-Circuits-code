module Test_comp_4();
    // ports you get
    reg  [ 3: 0] A;
    reg  [ 3: 0] B;
    reg          in_A_G_B;
    reg          in_A_E_B;
    reg          in_A_L_B;
    wire         USER_A_G_B_TMP;
    wire         USER_A_E_B_TMP;
    wire         USER_A_L_B_TMP;

    // ports you needn't care at writing
    wire         out_A_G_B_TMP;
    wire         out_A_E_B_TMP;
    wire         out_A_L_B_TMP;
    wire         check = (USER_A_G_B_TMP === out_A_G_B_TMP) 
                      && (USER_A_E_B_TMP === out_A_E_B_TMP) 
                      && (USER_A_L_B_TMP === out_A_L_B_TMP);

    TEMPLATE_COMP_4 inst_comp_4_0 (
        .A          (             A),
        .B          (             B),
        .in_A_G_B   (      in_A_G_B),
        .in_A_E_B   (      in_A_E_B),
        .in_A_L_B   (      in_A_L_B),
        .out_A_G_B  ( out_A_G_B_TMP),
        .out_A_E_B  ( out_A_E_B_TMP),
        .out_A_L_B  ( out_A_L_B_TMP)
    );

    // instantiate your module
    /****************************** WRITE YOUR CODE HERE ********************************/
    comparator_4 instance_comparator_4 (
        .A          (             A),
        .B          (             B),
        .in_A_G_B   (      in_A_G_B),
        .in_A_E_B   (      in_A_E_B),
        .in_A_L_B   (      in_A_L_B),
        .out_A_G_B  (USER_A_G_B_TMP),
        .out_A_E_B  (USER_A_E_B_TMP),
        .out_A_L_B  (USER_A_L_B_TMP)
    );
    /****************************** WRITE YOUR CODE HERE ********************************/

    initial
    begin
               A = 4'd1;
               B = 4'd0;
        in_A_G_B = 1'b0;
        in_A_E_B = 1'b1;
        in_A_L_B = 1'b0;
    end

    always
    begin
        #2;
        A = $random() % 16;
        B = $random() % 16;
    end
endmodule