# Linux-Firewall

Block all internet traffic except for programs that are members of group internet-for-all

Useful info:

iptables is a command-line firewall utility that uses policy chains to allow or block traffic. When a connection tries to establish itself on your system, iptables looks for a rule in its list to match it to. If it doesn't find one, it resorts to the default action.

When using REJECT rules an ICMP packet is sent indicating the port is unavailable. The difference is that the REJECT target sends a reject response to the source, while the DROP target sends nothing. This can be useful e.g. for the ident service. If you use REJECT then the clients doesn't need to wait for timeout.