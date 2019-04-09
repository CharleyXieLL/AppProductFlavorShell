#!/usr/bin/env bash

startLine=$1
endLine=$2
isOpen=$3
filePath=$4

CODE_OPEN=1

DELETE_STRING="\/\/"

if [ $isOpen -eq $CODE_OPEN ];then
    for((i=$startLine;i<=$endLine;i++))do
        lineContent=`sed -n ${i}p $filePath`
        if [[ "$lineContent" =~ "/" ]];then
        sed -i '' $i's/'"$DELETE_STRING"'//g' $filePath
        fi
    done
else
    for((i=$startLine;i<=$endLine;i++))do
        lineContent=`sed -n ${i}p $filePath`
        if [[ ! "$lineContent" =~ "//" ]];then
        sed -i '' $i'i\
        //' $filePath
        fi
    done
fi





