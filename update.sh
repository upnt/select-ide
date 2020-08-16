#! /bin/bash
my_update(){
    for ide_lang in $(cat -)
    do
        docker pull upnt/${ide_lang}-ide
    done
}

