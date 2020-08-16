#! /bin/bash
source ./help.sh
source ./update.sh
source ./select.sh
cd `dirname $0`

ide_lang_list=("python" "typescript")

if [ "$1" = "run" ]; then
clear
    ide_lang=`echo ${ide_lang_list[@]} | my_select`
    if [ "$ide_lang" = "" ]; then
        echo "IDE is not selected"
    else
        docker run --rm -it -v $HOME/workspace/${ide_lang}:/root/workspace --workdir=/root/workspace upnt/${ide_lang}-ide
    fi

elif [ "$1" = "update" ]; then
clear
    echo ${ide_lang_list[@]} | my_update

elif [ "$1" = "help" ]; then
    my_help

else
    echo "\"$1\" is not a command"
    my_help
fi

