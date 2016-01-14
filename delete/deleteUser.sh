#!/bin/bash
ls -al /
echo 'Deleting user ' $user
sudo userdel -r $user
# if [ ! -z "$1" ]; then
#     printf ",g/^#$user ALL=(ALL) NOPASSWD:ALL$/d\nw\nq\n" | ed $1
# else
#     export EDITOR=$0
#     visudo
# fi
exit
