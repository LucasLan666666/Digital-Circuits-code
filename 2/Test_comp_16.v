module Test_comp_16();
    // ports you get
    reg   [15:0] A;
    reg   [15:0] B;
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

    TEMPLATE_COMP_16 inst_comp_16_0 (
        .A              (               A),
        .B              (               B),
        .A_G_B          (   out_A_G_B_TMP),
        .A_E_B          (   out_A_E_B_TMP),
        .A_L_B          (   out_A_L_B_TMP)
    );

    // instantiate your module
    /****************************** WRITE YOUR CODE HERE ********************************/
    comparator_16 instance_comparator_16 (
        .A              (               A),
        .B              (               B),
        .out_A_G_B      (  USER_A_G_B_TMP),
        .out_A_E_B      (  USER_A_E_B_TMP),
        .out_A_L_B      (  USER_A_L_B_TMP)
    );
    /****************************** WRITE YOUR CODE HERE ********************************/

    initial
    begin
        A = 16'd1;
        B = 16'd0;
    end

    always
    begin
        #2;
        A = $random() % 16;
        B = $random() % 16;
    end
endmodule