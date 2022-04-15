//Implement a hald adder using only nand gates

DUP:2#enlist::
NAND:{not x and y}
NOT:{NAND[x;x]}
AND:{(NAND). dup NAND[x;y]}
OR:{NAND[NAND[x;x];]NAND[y;y]}
NOR:{(NAND). dup OR[x;y]}
XOR:{NAND[NAND[x;n];]NAND[y;]n:NAND[x;y]}
XNOR:{NAND[NAND[x;y];]NAND[NAND[x;x];]NAND[y;y]}
