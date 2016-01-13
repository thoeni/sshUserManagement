#!/bin/bash
ls -al /
echo 'Creating user ' $user
encryptedPassowrd=`echo $password | openssl passwd -1 -stdin`
echo $encryptedPassowrd
sudo adduser $user -p $encryptedPassowrd
sudo -u $user mkdir /home/$user/.ssh
sudo -u $user chmod 777 /home/$user/.ssh
sudo bash -c "echo $pubk | base64 --decode > /home/$user/.ssh/authorized_keys"
sudo chown $user:$user /home/$user/.ssh
sudo chmod 700 /home/$user/.ssh
sudo chown $user:$user /home/$user/.ssh/authorized_keys
sudo chmod 600 /home/$user/.ssh/authorized_keys
exit
