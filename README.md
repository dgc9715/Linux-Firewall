# Linux-Firewall


When using REJECT rules an ICMP packet is sent indicating the port is unavailable. The difference is that the REJECT target sends a reject response to the source, while the DROP target sends nothing. This can be useful e.g. for the ident service. If you use REJECT then the clients doesn't need to wait for timeout.