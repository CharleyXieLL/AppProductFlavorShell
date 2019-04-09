#!/usr/bin/env bash

appProductType=$1

#资源签名三方参数设置文件路径
appBuildFilePath=$(pwd)/app/build.gradle
#writeOffCode
writeOffCodeFilePath=$(pwd)/shell/writeOffCode.sh

SHELL_APP_BR_1_START="SHELL_APP_BR_1_START"
SHELL_APP_BR_1_END="SHELL_APP_BR_1_END"

SHELL_APP_BR_2_START="SHELL_APP_BR_2_START"
SHELL_APP_BR_2_END="SHELL_APP_BR_2_END"

SHELL_APP_BR_3_START="SHELL_APP_BR_3_START"
SHELL_APP_BR_3_END="SHELL_APP_BR_3_END"

SHELL_APP_BR_4_START="SHELL_APP_BR_4_START"
SHELL_APP_BR_4_END="SHELL_APP_BR_4_END"

CODE_OPEN=1
CODE_CLOSE=2

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

SHELL_APP_BR_1_START_LINE=$(getLine $SHELL_APP_BR_1_START $appBuildFilePath)
SHELL_APP_BR_1_END_LINE=$(getLine $SHELL_APP_BR_1_END $appBuildFilePath)

SHELL_APP_BR_2_START_LINE=$(getLine $SHELL_APP_BR_2_START $appBuildFilePath)
SHELL_APP_BR_2_END_LINE=$(getLine $SHELL_APP_BR_2_END $appBuildFilePath)

SHELL_APP_BR_3_START_LINE=$(getLine $SHELL_APP_BR_3_START $appBuildFilePath)
SHELL_APP_BR_3_END_LINE=$(getLine $SHELL_APP_BR_3_END $appBuildFilePath)

SHELL_APP_BR_4_START_LINE=$(getLine $SHELL_APP_BR_4_START $appBuildFilePath)
SHELL_APP_BR_4_END_LINE=$(getLine $SHELL_APP_BR_4_END $appBuildFilePath)

APP_BR_START_LINE_1=$(($SHELL_APP_BR_1_START_LINE+$APP_CONFIG_NUMBER))
APP_BR_END_LINE_1=$(($SHELL_APP_BR_1_END_LINE-$APP_CONFIG_NUMBER))

APP_BR_START_LINE_2=$(($SHELL_APP_BR_2_START_LINE+$APP_CONFIG_NUMBER))
APP_BR_END_LINE_2=$(($SHELL_APP_BR_2_END_LINE-$APP_CONFIG_NUMBER))

APP_BR_START_LINE_3=$(($SHELL_APP_BR_3_START_LINE+$APP_CONFIG_NUMBER))
APP_BR_END_LINE_3=$(($SHELL_APP_BR_3_END_LINE-$APP_CONFIG_NUMBER))

APP_BR_START_LINE_4=$(($SHELL_APP_BR_4_START_LINE+$APP_CONFIG_NUMBER))
APP_BR_END_LINE_4=$(($SHELL_APP_BR_4_END_LINE-$APP_CONFIG_NUMBER))

appBRStatusStart1=$(judgeStringInFile $SHELL_APP_BR_1_START $appBuildFilePath)
appBRStatusEnd1=$(judgeStringInFile $SHELL_APP_BR_1_END $appBuildFilePath)

appBRStatusStart2=$(judgeStringInFile $SHELL_APP_BR_2_START $appBuildFilePath)
appBRStatusEnd2=$(judgeStringInFile $SHELL_APP_BR_2_END $appBuildFilePath)

appBRStatusStart3=$(judgeStringInFile $SHELL_APP_BR_3_START $appBuildFilePath)
appBRStatusEnd3=$(judgeStringInFile $SHELL_APP_BR_3_END $appBuildFilePath)

appBRStatusStart4=$(judgeStringInFile $SHELL_APP_BR_4_START $appBuildFilePath)
appBRStatusEnd4=$(judgeStringInFile $SHELL_APP_BR_4_END $appBuildFilePath)

function writeOffCodeBR(){
if [ $2 -ne 1 -a $3  -ne 1 ];then
        sh $writeOffCodeFilePath $4 $5 $1 $appBuildFilePath
    else
        echo "<<"$appBuildFilePath"中缺少驱动脚本字符串<<"$6">>和<<"$7
    fi
}

if [ $appProductType -eq 1 ];then

    echo "开始对 app build.gradle buildType release 第一部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeBR $CODE_OPEN $appBRStatusStart1 $appBRStatusEnd1 $APP_BR_START_LINE_1 $APP_BR_END_LINE_1 $SHELL_APP_BR_1_START $SHELL_APP_BR_1_END)
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart2 $appBRStatusEnd2 $APP_BR_START_LINE_2 $APP_BR_END_LINE_2 $SHELL_APP_BR_2_START $SHELL_APP_BR_2_END)
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart3 $appBRStatusEnd3 $APP_BR_START_LINE_3 $APP_BR_END_LINE_3 $SHELL_APP_BR_3_START $SHELL_APP_BR_3_END)
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart4 $appBRStatusEnd4 $APP_BR_START_LINE_4 $APP_BR_END_LINE_4 $SHELL_APP_BR_4_START $SHELL_APP_BR_4_END)

fi

if [ $appProductType -eq 2 ];then

    echo "开始对 app build.gradle buildType release 第二部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart1 $appBRStatusEnd1 $APP_BR_START_LINE_1 $APP_BR_END_LINE_1 $SHELL_APP_BR_1_START $SHELL_APP_BR_1_END)
    $(writeOffCodeBR $CODE_OPEN $appBRStatusStart2 $appBRStatusEnd2 $APP_BR_START_LINE_2 $APP_BR_END_LINE_2 $SHELL_APP_BR_2_START $SHELL_APP_BR_2_END)
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart3 $appBRStatusEnd3 $APP_BR_START_LINE_3 $APP_BR_END_LINE_3 $SHELL_APP_BR_3_START $SHELL_APP_BR_3_END)
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart4 $appBRStatusEnd4 $APP_BR_START_LINE_4 $APP_BR_END_LINE_4 $SHELL_APP_BR_4_START $SHELL_APP_BR_4_END)

fi

if [ $appProductType -eq 3 ];then

    echo "开始对 app build.gradle buildType release 第三部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart1 $appBRStatusEnd1 $APP_BR_START_LINE_1 $APP_BR_END_LINE_1 $SHELL_APP_BR_1_START $SHELL_APP_BR_1_END)
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart2 $appBRStatusEnd2 $APP_BR_START_LINE_2 $APP_BR_END_LINE_2 $SHELL_APP_BR_2_START $SHELL_APP_BR_2_END)
    $(writeOffCodeBR $CODE_OPEN $appBRStatusStart3 $appBRStatusEnd3 $APP_BR_START_LINE_3 $APP_BR_END_LINE_3 $SHELL_APP_BR_3_START $SHELL_APP_BR_3_END)
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart4 $appBRStatusEnd4 $APP_BR_START_LINE_4 $APP_BR_END_LINE_4 $SHELL_APP_BR_4_START $SHELL_APP_BR_4_END)

fi

if [ $appProductType -eq 4 ];then

    echo "开始对 app build.gradle buildType release 第四部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart1 $appBRStatusEnd1 $APP_BR_START_LINE_1 $APP_BR_END_LINE_1 $SHELL_APP_BR_1_START $SHELL_APP_BR_1_END)
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart2 $appBRStatusEnd2 $APP_BR_START_LINE_2 $APP_BR_END_LINE_2 $SHELL_APP_BR_2_START $SHELL_APP_BR_2_END)
    $(writeOffCodeBR $CODE_CLOSE $appBRStatusStart3 $appBRStatusEnd3 $APP_BR_START_LINE_3 $APP_BR_END_LINE_3 $SHELL_APP_BR_3_START $SHELL_APP_BR_3_END)
    $(writeOffCodeBR $CODE_OPEN $appBRStatusStart4 $appBRStatusEnd4 $APP_BR_START_LINE_4 $APP_BR_END_LINE_4 $SHELL_APP_BR_4_START $SHELL_APP_BR_4_END)

fi
