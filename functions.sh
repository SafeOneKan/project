#!/bin/bash

Change_Perm() {
    local files=( "$@" )
    for file in $files; do
        chmod o-xw "$file" && chmod g-xw "$file"
        echo "$file"
    done
    echo "done"
}

Encrypt() {
    local files=( "$@" )
    echo $files
    local password="${!#}"
    for file in $files; do
        echo $file
        if [ -f "$file" ]; then
            openssl enc -aes-256-cbc -salt -pbkdf2 -in "$file" -out "$file.enc" -k "$password"
            rm "$file"
        fi
    done
}

Decrypt(){
    local files=( "$@" )
    local password="${!#}"
    for file in $files; do
        if [ -f "$file" ]; then
            if openssl enc -d -aes-256-cbc -pbkdf2 -in "$file" -out "${file%.enc}" -k "$password"; then
                echo "Decryption successful: $file"
                rm "$file"
            else
                echo "Decryption failed or incorrect password: $file"
                rm "${file%.enc}"
            fi
        fi
    done
}




weaken(){
    dirs=$(find "$1" -type f)
    for file in $dirs;do
    chmod o+xw $file
    done
    echo "weaken done"
}




