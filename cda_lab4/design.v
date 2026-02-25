module full_adder_opt(a, b, cin, sum, cout);
  input  a, b, cin;
  output sum, cout;

  wire x;      // x = a xor b
  wire n1, n2; // NAND intermediates for cout

  // SUM: 2 XOR gates
  xor (x,   a,   b);
  xor (sum, x,   cin);

  // COUT: 3 NAND gates -> cout = ab + cin*(a xor b)
  nand(n1, a, b);     // n1 = ~(a&b)
  nand(n2, cin, x);   // n2 = ~(cin&x)
  nand(cout, n1, n2); // cout = ~(n1 & n2) = ab + cin*x
endmodule

