#! /bin/bash
my_select(){
    arr=`echo $(cat -) | ../sentaku/bin/sentaku`
    echo ${arr}
}
