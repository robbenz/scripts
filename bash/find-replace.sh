#!/usr/bin/env bash

# this only works with WORDS ONLY

read -r -p "Search For: " FIND 
read -r -p "Replace With: " REPLACE 
read -r -p "Full Path To File: " FILE 

sed -i -e "s/$FIND/$REPLACE/g" "$FILE" 
