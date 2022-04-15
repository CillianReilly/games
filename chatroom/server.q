\p 5050

client:([handle:`int$()];name:())
reg:{`client upsert(.z.w;x);}
pub:{
	name:client[.z.w;`name];
	neg[key[client][`handle]except .z.w]@\:(`upd;": "sv(name;x));
	}

.z.pc:{delete from`client where handle in x;}
