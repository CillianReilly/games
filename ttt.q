//kdb+ Tic Tac Toe
//q ttt.q [Grid size]
//Grid size defaults to 3 if none given

p:{
  1"Player ",string[x+1],": ";
  i:@[2*value@;;{x}]read0 0;

  $[(-7=type i)or(7=type i)and 2<count i;
      [-1"Please enter two digits.";:x];
    7<>type i;
      [-1"Numeric entries only please.";:x];
    not all i in S;
      [-1"Please enter indices inside the grid.";:x];
    not null g . i;
      [-1"Square occupied. Please choose an empty square.";:x];
      .[`g;i;:;t:"xo"x]
    ];
		
  -1 .Q.s[g]except"\"";

  $[any all each t=g ./:/:(S,'/:(S;reverse S)),(first[i],'S;S,'last i);
      1"Congrats Player ",string[x+1]," !!";
    not 2 any/null g[S;S];
      1"Draw match";
    not x
    ]
 };

N:(3;"J"$first .z.x)count .z.x;
S:2*til N;
g:n#/:(n:-1+2*N)#(" |";"---");

-1"Welcome to kdb+ Tic Tac Toe !!";
-1"Please enter numbers in the form 0 0. Indices are shown below:";
-1(.Q.s(" ",s),'enlist[s:" "sv string til N],g)except"\"";

(-7<>type@) p/0b;

\\
