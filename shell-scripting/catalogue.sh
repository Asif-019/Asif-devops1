dnf module disable nodejs -y
dnf module enacle nodejs:20 -y

dnf install nodejs -y

useradd roboshop
mk dir /app


curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cp catalogue.service /etc/systemd/system/catalogue.service
cd /app
unzip /tmp/catalogue.zip

npm install


systemctl daemon-reload

systemctl enable catalogue
systemctl start catalogue

cp mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-mongosh -y

mongosh --host MONGODB-SERVER-IPADDRESS </app/db/master-data.js