## main
```
sudo su
read -t 1

cd /root
read -t 1

```

## CentOS 7
```shell
cd /root/
curl -O "https://raw.githubusercontent.com/vladimirmashkov/linux_forwarding/dev/centos7/vladimir_key.pub"
mkdir -p -m 0777 /root/centos/7
cd /root/centos/7
curl -O "https://raw.githubusercontent.com/vladimirmashkov/linux_forwarding/dev/centos7/centos/7/prepare.sh"
chmod 0777 prepare.sh
./prepare.sh
read -t 1

```
