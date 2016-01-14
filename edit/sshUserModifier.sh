#!/bin/bash
echo "Specify your ssh username:"
read SSH_ADMIN
echo "Specify the location of your private key to connect to the remote instances"
read SSH_KEY
echo "Specify the old password"
read old_pwd
echo "Specify the new password"
read new_pwd

old_pwd_64=`echo -n ''$old_pwd'' | base64`
new_pwd_64=`echo -n ''$new_pwd'' | base64`

while read machine
do
  echo $machine 'editing user -> ' $user
  ssh -tt -i $SSH_KEY $SSH_ADMIN@$machine user=$SSH_ADMIN old_pwd_64=$old_pwd_64 new_pwd_64=$new_pwd_64 'bash -s' < editUser.sh
done < machines.txt
