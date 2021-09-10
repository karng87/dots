# tcp
    Tranmission control protocol
    source port
    destination port
    ...
    TCP flags
    ...
# three way handshake
    the client request to server
        | Ethenet | IPv4 | TCP ||
            no payload
            flags = SYN 
            S=100 (random) 
            A=0 (random)

    the sever accepts the request of client
        | Ethenet | IPv4 | TCP || 
            no payload
            flags = SYNC, ACK, 
            S=2000 (random) 
            A=101 ( received S + payload length=1 )

    the client sign Ok to server
        | Ethenet | IPv4 | TCP | 
            no payload
            flags = ACK 
            S=101 (recieved ACK num) 
            A=2001 (received S + 1)
# after 3way handshake
    
    the client request with payload to server
        | Ethenet | IPv4 | TCP | Payload(150 byte) |
            flags = PUSH | ACK
            S=101 (last S value)
            A=2001 (last A value)
    the sever accepts the request of client
        | Ethenet | IPv4 | TCP | Payload (500 byte) |
            flags = PUSH | ACK
            S=2001 (recieved ACK num)
            A=101 + 150 byte  (received S + received payload length)

    the sever accepts the request of client
        | Ethenet | IPv4 | TCP | Payload(2300) |
            flags = PUSH | ACK
            S = 101+ 150(recieved ACK num)
            A = 2001 + 500 (received S + receied payload length)
