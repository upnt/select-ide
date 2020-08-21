#! /bin/bash
cd `dirname $0`
source ./help.sh
source ./update.sh
source ./select.sh

ide_lang_list=("python" "typescript")

if [ "$1" = "run" ]; then
    ide_lang=`echo ${ide_lang_list[@]} | my_select`
    workdir="/root/workspace"
    mntdir="$HOME/workspace"
    if [ "$ide_lang" = "" ]; then
        echo "IDE was not selected"
    else
        docker run -it \
            -v ${mntdir}/${ide_lang}:${workdir} \
            --workdir=${workdir} \
            --name ${ide_lang}-ide \
            upnt/${ide_lang}-ide
    fi

elif [ "$1" = "start" ]; then
    ide_lang=`echo ${ide_lang_list[@]} | my_select`
    workdir="/root/workspace"
    mntdir="$HOME/workspace"
    if [ "$ide_lang" = "" ]; then
        echo "IDE was not selected"
    else
        docker start -i ${ide_lang}-ide
    fi

elif [ "$1" = "images" ]; then
    docker images | grep -E ide

elif [ "$1" = "ps" ]; then
    docker ps -a | grep ide

elif [ "$1" = "rm" ]; then
    ide_lang=`echo ${ide_lang_list[@]} | my_select`
    workdir="/root/workspace"
    mntdir="$HOME/workspace"
    if [ "$ide_lang" = "" ]; then
        echo "IDE was not selected"
    else
        docker rm ${ide_lang}-ide
    fi

elif [ "$1" = "update" ]; then
    echo ${ide_lang_list[@]} | my_update

elif [ "$1" = "help" ]; then
    my_help

else
    echo "\"$1\" is not a command"
    my_help
fi

