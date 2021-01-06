#!/bin/bash

function usage {
    cat <<EOF
Usage:
  $0 [command]
Available commands:

  start                     Initial setup
  reload                    Reload
EOF
    exit 1
}

function start {
    brew install tig
    brew install diff-so-fancy
    #pip install --user tmuxp
    _gitconfig
    mkdir -m 755 -p ~/.workenv/
    cp source ~/.workenv/
    sed -i '' '/\/\.workenv\/source/d' ~/.zshrc
    echo ". ~/.workenv/source" >> ~/.zshrc
    reload
}

function reload {
    _gitconfig
    rm ~/.workenv/_*
    cp _* ~/.workenv/
}

function _gitconfig {
   git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
   git config --global color.ui true

   git config --global color.diff-highlight.oldNormal    "red bold"
   git config --global color.diff-highlight.oldHighlight "red bold 52"
   git config --global color.diff-highlight.newNormal    "green bold"
   git config --global color.diff-highlight.newHighlight "green bold 22"

   git config --global color.diff.meta       "11"
   git config --global color.diff.frag       "magenta bold"
   git config --global color.diff.commit     "yellow bold"
   git config --global color.diff.old        "red bold"
   git config --global color.diff.new        "green bold"
   git config --global color.diff.whitespace "red reverse"
}

case $1 in
    "start")
       start
    ;;
    "reload")
       reload
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

