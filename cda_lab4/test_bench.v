module full_adder_tb();
    reg  a, b, cin;
    wire sum, cout;

    full_adder U0(a, b, cin, sum, cout);

    initial begin
        $dumpfile("test.vcd");
        $dumpvars;

        $display("Starting simulation...\n");
        $display("Time\ta\tb\tcin\tsum\tcout");
        $monitor("%2d\t%d\t%d\t%d\t%d\t%d",
                 $time, a, b, cin, sum, cout);

        a = 0; b = 0; cin = 0;      //  t=0:  0+0+0 = sum=0, cout=0
        #10 cin = 1;                 // t=10:  0+0+1 = sum=1, cout=0
        #10 cin = 0; b = 1;         // t=20:  0+1+0 = sum=1, cout=0
        #10 cin = 1;                 // t=30:  0+1+1 = sum=0, cout=1
        #10 cin = 0; b = 0; a = 1;  // t=40:  1+0+0 = sum=1, cout=0
        #10 cin = 1;                 // t=50:  1+0+1 = sum=0, cout=1
        #10 cin = 0; b = 1;         // t=60:  1+1+0 = sum=0, cout=1
        #10 cin = 1;                 // t=70:  1+1+1 = sum=1, cout=1
        #10 $finish;                 // End simulation at t=80
    end
endmodule
