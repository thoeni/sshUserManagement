#!/bin/bash
echo 'Editing user ' $user
old_pwd=`echo $old_pwd_64 | base64 --decode`
new_pwd=`echo $new_pwd_64 | base64 --decode`
echo $old_pwd
echo $new_pwd
echo -e "$old_pwd\n$new_pwd\n$new_pwd" | passwd
exit
