yum install -y bind bind-utils

mkdir -p /etc/named/zones
cp named.conf /etc/named.conf
cp named.conf.local /etc/named/named.conf.local
cp db.172.30.1 /etc/named/zones/db.172.30.1
cp db.sno.local /etc/named/zones/db.sno.local

firewall-cmd --permanent --add-port=53/udp
firewall-cmd --reload

systemctl enable named
systemctl start named
systemctl status named