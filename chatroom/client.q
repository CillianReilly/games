init:{
	h:@[hopen;5050;{0N!"Could not connect to server: ",x;exit 1}];
	neg[h](`reg;.z.x 0);
	:h
	}

serverHandle:init[]

send:{neg[x](`pub;y);}[serverHandle;]
upd:-1@
