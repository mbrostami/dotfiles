#!/bin/bash

function usage {
    cat <<EOF
Usage:
  $0 [command]
Available commands:

  start                     Initial setup
EOF
    exit 1
}

function start {
    mkdir -m 755 -p ~/.workenv/
    cp Mac/aliases ~/.workenv/
    sed -i '' 's#. ~/.workenv/.*##g' ~/.zshrc
    echo ". ~/.workenv/aliases" >> ~/.zshrc
}

case $1 in
    "start")
       start
    ;;
   *)
        if [ $# -eq 1 ]
        then
            $0 | grep $1
        else
            usage
        fi
   ;;
esac

