//kdb+ Dots and Boxes
//q dab.q [Grid size]
//Grid size defaults to 3 if none given

p:{	1"Player ",string[x+1],": ";
  	i:@[map value@;;{x}]read0 0;

	  $[(-7=type i)or(7=type i)and 2<count i;
      		[-1"Please enter two digits.";:x];
    	  7<>type i;
      		[-1"Numeric entries only please.";:x];
    	  not all i<N;
      		[-1"Please enter indices inside the grid.";:x];
    	  not null G . i;
      		[-1"Square occupied. Please choose an empty square.";:x];
	  	  [c:2 sum/G=first string x+1;
		     $[i[0]mod 2;
			      fill[x;((0 2;1;-1 1);(0 -2;1 -1;-1));i];
			      fill[x;((2 0;1;1 -1);(-2 0;-1 1;-1));i]
           ]
	  	   ]
	    ];
	
	-1 .Q.s[G]except"\"";

	$[c<2 sum/G=first string x+1;
		$[2 any/null G;
			x;
			[-1"Game over !!";
		 	 -1"Player 1 has ",string[p1:2 sum/"1"=G]," square(s).";
		 	 -1"Player 2 has ",string[p2:2 sum/"2"=G]," square(s).";
		 	 -1"Player ",string[1+p1<p2]," wins... Congrats !!"]
		  ];
	  	not x
	  ]
 }

//Map func from input to grid indices and fill func to check and populate
map:{$[x[0]mod 2;-1+1 2*;1 2*-1+]x};
fill:{./[`G;;:;("-|"z[0]mod 2),(2#string 1+x)w]enlist[z],7h$((z+;z-)@\:0.5*2 first/y)w:where not any each null G ./:/:z+/:/:y};

G:7#/:7#("+ ";" ");
-1"Welcome to kdb+ Dots and Boxes !!";
-1"Please enter numbers in the form 1 1.";
-1"The first number indicates row position and the second indicates gap position eg:";

-1"1 1 entered:";
G:.[G;map 1 1;:;"-"];
-1 .Q.s[G]except "\"";

-1"2 3 entered:";
G:.[G;map 2 3;:;"|"];
-1 .Q.s[G]except "\"";

-1"6 2 entered:";
G:.[G;map 6 2;:;"|"];
-1 .Q.s[G]except "\"";

//Reset grid
N:1+2*(3;"J"$first .z.x)count .z.x;
G:N#/:N#("+ ";" ");

-1"Your grid:";
-1 .Q.s[G]except "\"";

//Play
(-7<>type@)p/0b;

\\
