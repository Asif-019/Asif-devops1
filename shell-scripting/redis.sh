dnf install redis -y

sed -i -e 's/127.0.0.1/0.0.0.0/' -e '/protected-mode/ c /protected-mode no/' /etc/redis/redis.conf
systemctl enable redis -y
systemctl start redis -y

