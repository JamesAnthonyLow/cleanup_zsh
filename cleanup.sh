#!/bin/zsh
yellow="\x1b[1;33m"
red="\x1b[1;31m"
green="\x1b[1;32m"
purple="\x1b[1;34m"
off="\x1b[0m"
for i in ./*; do
  echo "${yellow}delete $i? y/N${off}"
  read answer
  if [ "${answer:0:1}" '==' "y" ]
  then
    echo "${red}Deleting $i...${off}"
    yes | rm -r $i
  else
    echo "${yellow}What to do?:${off}"
    echo "1) ${purple}Nothing${off}"
    echo "2) ${purple}Move to existing folder...${off}"
    echo "3) ${purple}Move to new folder...${off}"
    read choice
    if [ "${choice:0:1}" '==' "2" ]
    then
      read folder
      mv $i ./$folder
    elif [ "${choice:0:1}" '==' "3" ]
    then
      read folder
      mkdir ./$folder
      mv $i ./$folder
    else
      echo "${green}done${off}"
    fi
  fi
done
