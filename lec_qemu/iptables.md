# packet
    came in on eth0..
    type of packet
        ICMP : Internet Control Message Protocol
            : IP protocol + result reporting
        TCP
        UDP
    destination of packet
        port

# Tables
    raw
    filter : default table
    nat
    mangle
    security

# Tables consist of Chains

    filter table(default table) contain three-built-in chains
        INPUT
        OUTPUT
        FORWARD

    nat table includes three-built-in chains
        OUTPUT
        PREROUTING
        POSTROUNTING

    create chain(New)
        iptable -N logdrop_chain

    Add the created chain to Target(LOG,DROP) by rules(-j)
        iptable -A logdrop_cahin -j LoG
        iptable -A logdrip_chain -j DROP

        -j target name
        -m match name ( per-match-options )
        -t table -N chain( per-target-options)
        -t talbe -X chain
        -t table -P chain target
        -t table -P INPUT DROP 
        -t table -P OUTPUT ACCEPT
        -t table -P FORWADD ACCEPT

        -t table -E old-chain-name new-chain-name

# Targets (Actions)
    ACCEPT
    DROP
    QUEUE
    RETURN
    REJECT
    LOG

# Rules
    Targets are specified using 
        -j --jump

# Editing Rules
    iptables -A
        : appending
    iptables -I
        : inserting
    iptables -R
        : replacing
    iptables -D
        : deleting
    iptables -F
        : flushs all chains
    iptables -X
        : deltes all empty non-default chains
---


                             XXXXXXXXXXXXXXXXXXXXX
                             XXX     Network   XXX
                             XXXXXXXXXXXXXXXXXXXXX
                                       +
                                       |
                                       v
 +-------------+              +------------------+
 |table: filter| <---+        | table: nat       |
 |chain: INPUT |     |        | chain: PREROUTING|
 +-----+-------+     |        +--------+---------+
       |             |                 |
       v             |                 v
 [local process]     |           ****************          +--------------+
       |             +---------+ Routing decision +------> |table: filter |
       v                         ****************          |chain: FORWARD|
****************                                           +------+-------+
Routing decision                                                  |
****************                                                  |
       |                                                          |
       v                        ****************                  |
+-------------+       +------>  Routing decision  <---------------+
|table: nat   |       |         ****************
|chain: OUTPUT|       |               +
+-----+-------+       |               |
      |               |               v
      v               |      +-------------------+
+--------------+      |      | table: nat        |
|table: filter | +----+      | chain: POSTROUTING|
|chain: OUTPUT |             +--------+----------+
+--------------+                      |
                                      v
                               XXXXXXXXXXXXXXXXXXXX
                               XXX    Network   XXX
                               XXXXXXXXXXXXXXXXXXXX

# Showing Current Rules
    iptables -nvL
# Saving Rules
    iptables-save -f /etc/iptables/iptables.rules



