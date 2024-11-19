#/bin/sh

yes y | ssh-keygen -t rsa -N "" -f /home/myadmin/.ssh/node01 > /dev/null

eval "$(ssh-agent -s)"

ssh-add /home/myadmin/.ssh/node01

apt install sshpass

for ip in "172.20.1.13"; do sshpass -p Admin@123456 ssh-copy-id  -oStrictHostKeyChecking=no "myadmin@172.20.1.10" > /dev/null; done

scp myadmin@172.20.1.10:/home/myadmin/token.sh /home/myadmin/

sh /home/myadmin/token.sh