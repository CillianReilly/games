\p 5050

client:([handle:`int$()];name:())
gcn:{client[x;`name]}

reg:{`client upsert(.z.w;x);pub gcn[.z.w]," has joined the chat";}
pub:{neg[key[client][`handle]except .z.w]@\:(`upd;x);}

.z.pc:{n:gcn x;delete from`client where handle in x;pub n," has left the chat";}
