// kdb+ wordle solver

// when prompted, enter guessed word, followed by score
// grey is 0, gold is 1, green is 2 e.g:
// input guess: anise
// input score: 0 0 2 0 2

lw:{
	w:lower @[read0;`:/usr/share/dict/words;{-1"Error loading words: ",x;exit 1}];
	w:w where all each w in .Q.a;
	w:distinct w where 5=count each w;
	freq:key asc count each group raze w;
	w idesc(sum each freq?w)*(count distinct@)each w
	}

f:{x where all((f0;f1;f2)distinct z).\:(x;y;)z:@[z;where(z=0)&y in y where z>0;1+]}

f0:{not any each x in y where not z}
f1:{all(all each(y where z=1)in/:x;not any each(=/:/)(y;x@\:)@\:where z=1)}
f2:{x like @[y;where not z=2;:;"?"]}

play:{
	-1"";-1"top 5 (or less) suggestions are:";show 5 sublist x;-1"";
	1"input guess: ";g:@[lower;;{x}]read0 0;
	1"input score: ";s:@[value;;{x}]read0 0;
	f[x;g;s]
	}

words:lw[]
"today's answer is: ",first(1<count@)play/words
exit 0
