\p 5050

client:([handle:`int$()];name:())
reg:{`client upsert(.z.w;x);}
pub:{neg[key[client][`handle]except .z.w]@\:(`upd;": "sv(client[.z.w;`name];x))}

.z.pc:{delete from`client where handle in x;}
