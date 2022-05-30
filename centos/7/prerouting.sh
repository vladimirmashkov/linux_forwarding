#!/bin/sh

echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
echo "1" > /proc/sys/net/ipv4/ip_forward 
echo "net.ipv4.ip_forward = 1" > /etc/sysctl.conf 
echo "net.ipv4.icmp_echo_ignore_all = 1" >> /etc/sysctl.conf 

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination 207.180.242.111:42066 
iptables -t nat -A POSTROUTING -j MASQUERADE 
iptables-save