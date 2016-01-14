#!/bin/bash
ls -al /
echo 'Creating user ' $user
encryptedPassword=`echo $password | openssl passwd -1 -stdin`
echo $encryptedPassword
sudo adduser $user -p $encryptedPassword
sudo -u $user mkdir /home/$user/.ssh
sudo -u $user chmod 777 /home/$user/.ssh
sudo bash -c "echo $pubk | base64 --decode > /home/$user/.ssh/authorized_keys"
sudo chown $user:$user /home/$user/.ssh
sudo chmod 700 /home/$user/.ssh
sudo chown $user:$user /home/$user/.ssh/authorized_keys
sudo chmod 600 /home/$user/.ssh/authorized_keys
if [ "$isSudo" = "sudo" ]
  then
    permissions='ALL=(ALL:ALL) NOPASSWD:ALL'
    visudoString='echo "'$user' '$permissions'" | (EDITOR="tee -a" visudo)'
    sudo bash -c ''"$visudoString"''
fi
exit
