#!/bin/bash -e

REPOS=( 
~/files/sql 
/Applications/MAMP/htdocs/plugs
~/files/scripts
~/files/bash_profile
)

MOVE="Moving to next REPO... \n" 

tput setaf 2;echo "What ya wanna do? You can say push, pull, commit, ftp push, or status"; tput sgr0

read -r input

if [ "$input" =  "commit" ]
then
    tput setaf 2;echo "Do you want a unique commit message? [y/n]";tput sgr0
    read -r ans
    if [ "$ans" = "y" ]
    then 
        for i in "${REPOS[@]}"
        do
            cd "$i"
            tput setaf 6;pwd;tput sgr0 
            git add . -A
            read -r -p "Commit description: " desc  
            git commit -m "$desc"
            tput setaf 2;echo  "$MOVE";tput sgr0 
            sleep 1
        done 
    else 
        for i in "${REPOS[@]}"
        do
            cd "$i"
            tput setaf 6;pwd;tput sgr0 
            git add . -A
            git commit -m "autocommit backup point"
            tput setaf 2;echo  "$MOVE";tput sgr0 
            sleep 1
        done
    fi 
elif [ "$input" = "push" ] || [ "$input" = "pull" ] || [ "$input" = "ftp push" ] || [ "$input" = "status" ]
    then
        for i in "${REPOS[@]}"
do
    cd "$i"
    tput setaf 6;pwd;tput sgr0 
    git "$input" 
    tput setaf 2;echo  "$MOVE";tput sgr0 
    sleep 1
    done 
else tput setaf 1;echo "You have zero friends";tput sgr0 
fi
