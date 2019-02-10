//kdb+ Nim
//q nim.q [Pile size]
//Pile size defaults to 12 if none given

p:{	$[c:count[x]mod 4;
		[1"Computer is thinking.";system sleep;1".";system sleep;-1".";
		 -1"Computer takes ",string[c]," stone(s)";
		 x:c _x
		 ];
		[1"Player: ";i:@[value;;{x}]read0 0;
		 $[7<>abs type i;
			-1"Please enter a number";
		   7=type i;
			-1"Please enter a single number";
  	  	   not(0<i)&i<4;
			-1"Allowed entries are 1, 2 or 3";
			x:i _x
		   ]
		 ]
	  ];
	-1 x;x
  }

sleep:$["w"=first string .z.o;"timeout 1";"sleep 1"];
P:(value[.z.x 0],count[.z.x]_enlist 12)#"o";

-1"Welcome to kdb+ Nim !! Rules:";
-1"1) Whoever takes the last stone from the pile wins";
-1"2) You may only take 1, 2 or 3 stones from the pile";
-1"Can you beat the computer ??";
-1"\nPile: ",P;

//Play
(count)p/P;

1"Game over... Computer wins !!";
\\
