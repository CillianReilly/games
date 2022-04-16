# kdb+ chatroom

Very basic chatroom for clients to connect to, send and receive messages.  

Run the server:  
q server.q  

Connect as a client and message:  
q client.q clientName  
q)send"message"  

## Improvements  

* Use .z.pi to avoid calling send explicity  
* Parametrize server port
