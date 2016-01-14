#!/bin/bash
. ../appl.properties

while read machine
do
  while read userline
  do
      userline=($userline)
      user=${userline[0]}
      password=${userline[1]}
      pub='./pub_keys/'${userline[2]}
      isSudo=${userline[3]}
      echo $machine 'configuring user -> ' $user ' with password ' $password ' and public key ' $pub
      pubk=`base64 $pub`
      ssh -tt -i $SSH_KEY $SSH_ADMIN@$machine user=$user password=$password pubk=$pubk isSudo=$isSudo 'bash -s' < createUser.sh
  done < users.txt
done < machines.txt
