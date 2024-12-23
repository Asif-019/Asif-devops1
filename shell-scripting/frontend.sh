dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y

systemctl enable nginx
systemctl start nginx
rm -rf /usr/share/nginx/html/*
rm -rf /tmp/frontend.zip
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
cp nginx.conf /etc/nginx/nginx.conf


cd /usr/share/nginx/html
unzip /tmp/frontend.zip

systemctl restart nginx