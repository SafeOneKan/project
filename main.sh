#!/bin/bash

source functions.sh

weaken $1

check_vul $1
vulnerable_files=$?


Change_Perm "${vulnerable_files[@]}"

#Encrypt "${vulnerable_files[@]}" "er"
Decrypt "${vulnerable_files[@]}" "er"

