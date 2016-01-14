#!/bin/bash
. ../appl.properties

while read machine
do
  while read userline
  do
      userline=($userline)
      user=${userline[0]}
      echo $machine 'deleting user -> ' $user
      ssh -tt -i $SSH_KEY $SSH_ADMIN@$machine user=$user 'bash -s' < deleteUser.sh
  done < users.txt
done < machines.txt
