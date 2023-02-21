# gwmp-mux

GWMP is a **G**ate**W**ay **M**essaging **P**rotocol used by LoRa packet
forwarders to typically talk to a LoRaWAN Network Server (LNS).

On the ThingsIX Network, the GWMP can be used to send packets to the ThingsIX [forwarder](https://github.com/ThingsIXFoundation/packet-handling). 

On the Helium's Network, the GWMP is used to send packets to a Helium [gateway
rs](https://github.com/helium/gateway-rs).

This program, gwmp-mux, allows for a single packet forwarder connection to
be multiplexed out to one or more potential hosts. As such, a single gateway
can connect to multiple LNSs. For example the above gateway-rs and forwarder 
can be used on the same gateway.
