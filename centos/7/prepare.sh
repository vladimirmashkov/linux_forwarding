###!/bin/bash
echo "nameserver 8.8.8.8" >  /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf


yum update -y && yum upgrade -y
yum install -y epel-release && \
timedatectl set-timezone Europe/Moscow
yum install -y --enablerepo=epel ntp ntpdate wget mc whois net-tools traceroute mtr sed tree
yum -y install --enablerepo=epel iptables iptables-save iptables-services wget perl unzip net-tools perl-libwww-perl perl-LWP-Protocol-https perl-GDGraph
ntpdate -s time.nist.gov


mkdir -p -m 0644 /root/.ssh/
chmod 700 /root/.ssh/
touch /root/.ssh/authorized_keys
cat /root/vladimir_key.pub > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
systemctl restart sshd
yum update -y && yum upgrade -y

curl -O "https://raw.githubusercontent.com/vladimirmashkov/linux_forwarding/dev/centos7/centos/7/prerouting.sh"
cat rc.local > /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local
chmod +x prerouting.ssh
sh prerouting.ssh
