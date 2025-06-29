// kdb+ wordle solver

// when prompted, enter guessed word, followed by score
// grey is 0, gold is 1, green is 2 e.g:
// input guess: cares
// input score: 0 0 2 0 2

lw:{
	w:lower @[read0;`:/usr/share/dict/words;{-1"Error loading words: ",x;exit 1}];
	w:w where all each w in .Q.a;
	w:distinct w where 5=count each w;
	lf:key desc count each group raze w;
	pf:key each desc each count each'group each flip w;
	w iasc prd(sum each 1+pf?'/:w;sum each 1+lf?w;exp 5-(count distinct@)each w)
	}

f:{x where all((f0;f1;f2)distinct z).\:(x;y;z)}

f0:{not any each x in y where not z}
f1:{all(all each(y[i]#/:count each'group each x)>=\:count each group y i;not any each(=/:/)(y;x@\:)@\:i:where z=1)}
f2:{x like @[y;where not z=2;:;"?"]}

play:{
	-1"";-1"suggestions are:";
	-1 .Q.s(1+til c)!flip`best`repeating`random!c#/:(x;x where 5>(count distinct@)each x;(neg c:5&count x)?x);
	1"input guess: ";g:@[lower trim@;;{x}]read0 0;
	1"input score: ";s:@[value;;{x}]read0 0;
	f[x;g;s]
	}

words:lw[]
system"S ",string 6h$.z.t
"today's answer is: ",first(1<count@)play/words
exit 0
