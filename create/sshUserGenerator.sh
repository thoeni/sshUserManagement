#!/bin/bash
SSH_ADMIN=ec2-user
SSH_KEY=~/.ssh/toolstation.pem

while read machine
do
  while read userline
  do
      userline=($userline)
      user=${userline[0]}
      password=${userline[1]}
      pub=${userline[2]}
      echo $machine 'configuring user -> ' $user ' with password ' $password ' and public key ' $pub
      pubk=`base64 $pub`
      # ssh -tt -i $SSH_KEY $SSH_ADMIN@$machine user=$user password=$password 'bash -s' < createUser.sh
      ssh -tt -i $SSH_KEY $SSH_ADMIN@$machine user=$user password=$password pubk=$pubk 'bash -s' < createUser.sh
  done < users.txt
done < machines.txt
