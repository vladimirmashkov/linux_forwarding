## main
```
sudo su
read -t 1

cd /root
read -t 1

```

## CentOS 7
```shell
mkdir -p -m 0777 /root/centos/7
cd /root/centos/7
curl -O "https://raw.githubusercontent.com/vladimirmashkov/openconnect/dev/auto/etc/vladimir_key.pub"
curl -O "https://raw.githubusercontent.com/vladimirmashkov/openconnect/dev/auto/00.prepare_os_check_ssh.sh"
chmod 0777 00.prepare_os_check_ssh.sh
./00.prepare_os_check_ssh.sh

```
