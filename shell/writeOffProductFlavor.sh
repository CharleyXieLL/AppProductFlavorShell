#!/usr/bin/env bash

appProductType=$1

#资源签名三方参数设置文件路径
appBuildFilePath=$2

changeStringIndexTip=$3

#writeOffCode
writeOffCodeFilePath=$(pwd)/shell/writeOffCode.sh

CODE_OPEN=1
CODE_CLOSE=2

SHELL_APP_PF_1_START="SHELL_APP_PF_1_START"
SHELL_APP_PF_1_END="SHELL_APP_PF_1_END"

SHELL_APP_PF_2_START="SHELL_APP_PF_2_START"
SHELL_APP_PF_2_END="SHELL_APP_PF_2_END"

SHELL_APP_PF_3_START="SHELL_APP_PF_3_START"
SHELL_APP_PF_3_END="SHELL_APP_PF_3_END"

SHELL_APP_PF_4_START="SHELL_APP_PF_4_START"
SHELL_APP_PF_4_END="SHELL_APP_PF_4_END"


APP_CONFIG_NUMBER=1

#目标字符串所在行数
function getLine(){
    sed -n -e '/'$1'/=' $2
}

#判断某文件中是否包含某字符串,如果没有则退出当前脚本命令
function judgeStringInFile() {
    grep -q $1 $2
    if [ ! $? -eq 0 ];then
        echo 1
        else
        echo 0
    fi
}

SHELL_APP_PF_1_START_LINE=$(getLine $SHELL_APP_PF_1_START $appBuildFilePath)
SHELL_APP_PF_1_END_LINE=$(getLine $SHELL_APP_PF_1_END $appBuildFilePath)

SHELL_APP_PF_2_START_LINE=$(getLine $SHELL_APP_PF_2_START $appBuildFilePath)
SHELL_APP_PF_2_END_LINE=$(getLine $SHELL_APP_PF_2_END $appBuildFilePath)

SHELL_APP_PF_3_START_LINE=$(getLine $SHELL_APP_PF_3_START $appBuildFilePath)
SHELL_APP_PF_3_END_LINE=$(getLine $SHELL_APP_PF_3_END $appBuildFilePath)

SHELL_APP_PF_4_START_LINE=$(getLine $SHELL_APP_PF_4_START $appBuildFilePath)
SHELL_APP_PF_4_END_LINE=$(getLine $SHELL_APP_PF_4_END $appBuildFilePath)

APP_PF_START_LINE_1=$(($SHELL_APP_PF_1_START_LINE+$APP_CONFIG_NUMBER))
APP_PF_END_LINE_1=$(($SHELL_APP_PF_1_END_LINE-$APP_CONFIG_NUMBER))

APP_PF_START_LINE_2=$(($SHELL_APP_PF_2_START_LINE+$APP_CONFIG_NUMBER))
APP_PF_END_LINE_2=$(($SHELL_APP_PF_2_END_LINE-$APP_CONFIG_NUMBER))

APP_PF_START_LINE_3=$(($SHELL_APP_PF_3_START_LINE+$APP_CONFIG_NUMBER))
APP_PF_END_LINE_3=$(($SHELL_APP_PF_3_END_LINE-$APP_CONFIG_NUMBER))

APP_PF_START_LINE_4=$(($SHELL_APP_PF_4_START_LINE+$APP_CONFIG_NUMBER))
APP_PF_END_LINE_4=$(($SHELL_APP_PF_4_END_LINE-$APP_CONFIG_NUMBER))

appPFStatusStart1=$(judgeStringInFile $SHELL_APP_PF_1_START $appBuildFilePath)
appPFStatusStart2=$(judgeStringInFile $SHELL_APP_PF_2_START $appBuildFilePath)
appPFStatusStart3=$(judgeStringInFile $SHELL_APP_PF_3_START $appBuildFilePath)
appPFStatusStart4=$(judgeStringInFile $SHELL_APP_PF_4_START $appBuildFilePath)

appPFStatusEnd1=$(judgeStringInFile $SHELL_APP_PF_1_END $appBuildFilePath)
appPFStatusEnd2=$(judgeStringInFile $SHELL_APP_PF_2_END $appBuildFilePath)
appPFStatusEnd3=$(judgeStringInFile $SHELL_APP_PF_3_END $appBuildFilePath)
appPFStatusEnd4=$(judgeStringInFile $SHELL_APP_PF_4_END $appBuildFilePath)

function writeOffCodePF(){
if [ $2 -ne 1 -a $3  -ne 1 ]
then
    sh $writeOffCodeFilePath $4 $5 $1 $appBuildFilePath
else
    echo "<<"$appBuildFilePath"中缺少驱动脚本字符串<<"$6">>和<<"$7
fi
}


if [ $appProductType -eq 1 ];then

    productTipStart="开始对"$changeStringIndexTip"第一部分代码进行放开操作"

    echo $productTipStart
    echo "正在处理..."


    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodePF $CODE_OPEN $appPFStatusStart1 $appPFStatusEnd1 $APP_PF_START_LINE_1 $APP_PF_END_LINE_1 $SHELL_APP_PF_1_START $SHELL_APP_PF_1_END)
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart2 $appPFStatusEnd2 $APP_PF_START_LINE_2 $APP_PF_END_LINE_2 $SHELL_APP_PF_2_START $SHELL_APP_PF_2_END)
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart3 $appPFStatusEnd3 $APP_PF_START_LINE_3 $APP_PF_END_LINE_3 $SHELL_APP_PF_3_START $SHELL_APP_PF_3_END)
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart4 $appPFStatusEnd4 $APP_PF_START_LINE_4 $APP_PF_END_LINE_4 $SHELL_APP_PF_4_START $SHELL_APP_PF_4_END)

fi

if [ $appProductType -eq 2 ];then

    productTipStart="开始对"$changeStringIndexTip"第二部分代码进行放开操作"

    echo $productTipStart
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart1 $appPFStatusEnd1 $APP_PF_START_LINE_1 $APP_PF_END_LINE_1 $SHELL_APP_PF_1_START $SHELL_APP_PF_1_END)
    $(writeOffCodePF $CODE_OPEN $appPFStatusStart2 $appPFStatusEnd2 $APP_PF_START_LINE_2 $APP_PF_END_LINE_2 $SHELL_APP_PF_2_START $SHELL_APP_PF_2_END)
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart3 $appPFStatusEnd3 $APP_PF_START_LINE_3 $APP_PF_END_LINE_3 $SHELL_APP_PF_3_START $SHELL_APP_PF_3_END)
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart4 $appPFStatusEnd4 $APP_PF_START_LINE_4 $APP_PF_END_LINE_4 $SHELL_APP_PF_4_START $SHELL_APP_PF_4_END)

fi


if [ $appProductType -eq 3 ];then

    productTipStart="开始对"$changeStringIndexTip"第三部分代码进行放开操作"

    echo $productTipStart
    echo "正在处理..."


    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart1 $appPFStatusEnd1 $APP_PF_START_LINE_1 $APP_PF_END_LINE_1 $SHELL_APP_PF_1_START $SHELL_APP_PF_1_END)
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart2 $appPFStatusEnd2 $APP_PF_START_LINE_2 $APP_PF_END_LINE_2 $SHELL_APP_PF_2_START $SHELL_APP_PF_2_END)
    $(writeOffCodePF $CODE_OPEN $appPFStatusStart3 $appPFStatusEnd3 $APP_PF_START_LINE_3 $APP_PF_END_LINE_3 $SHELL_APP_PF_3_START $SHELL_APP_PF_3_END)
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart4 $appPFStatusEnd4 $APP_PF_START_LINE_4 $APP_PF_END_LINE_4 $SHELL_APP_PF_4_START $SHELL_APP_PF_4_END)

fi


if [ $appProductType -eq 4 ];then

    productTipStart="开始对"$changeStringIndexTip"第四部分代码进行放开操作"

    echo $productTipStart
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart1 $appPFStatusEnd1 $APP_PF_START_LINE_1 $APP_PF_END_LINE_1 $SHELL_APP_PF_1_START $SHELL_APP_PF_1_END)
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart2 $appPFStatusEnd2 $APP_PF_START_LINE_2 $APP_PF_END_LINE_2 $SHELL_APP_PF_2_START $SHELL_APP_PF_2_END)
    $(writeOffCodePF $CODE_CLOSE $appPFStatusStart3 $appPFStatusEnd3 $APP_PF_START_LINE_3 $APP_PF_END_LINE_3 $SHELL_APP_PF_3_START $SHELL_APP_PF_3_END)
    $(writeOffCodePF $CODE_OPEN $appPFStatusStart4 $appPFStatusEnd4 $APP_PF_START_LINE_4 $APP_PF_END_LINE_4 $SHELL_APP_PF_4_START $SHELL_APP_PF_4_END)

fi