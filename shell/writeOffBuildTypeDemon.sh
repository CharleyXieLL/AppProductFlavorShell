#!/usr/bin/env bash

appProductType=$1

#资源签名三方参数设置文件路径
appBuildFilePath=$(pwd)/app/build.gradle
#writeOffCode
writeOffCodeFilePath=$(pwd)/shell/writeOffCode.sh

SHELL_APP_BD_1_START="SHELL_APP_BD_1_START"
SHELL_APP_BD_1_END="SHELL_APP_BD_1_END"

SHELL_APP_BD_2_START="SHELL_APP_BD_2_START"
SHELL_APP_BD_2_END="SHELL_APP_BD_2_END"

SHELL_APP_BD_3_START="SHELL_APP_BD_3_START"
SHELL_APP_BD_3_END="SHELL_APP_BD_3_END"

SHELL_APP_BD_4_START="SHELL_APP_BD_4_START"
SHELL_APP_BD_4_END="SHELL_APP_BD_4_END"

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

SHELL_APP_BD_1_START_LINE=$(getLine $SHELL_APP_BD_1_START $appBuildFilePath)
SHELL_APP_BD_1_END_LINE=$(getLine $SHELL_APP_BD_1_END $appBuildFilePath)

SHELL_APP_BD_2_START_LINE=$(getLine $SHELL_APP_BD_2_START $appBuildFilePath)
SHELL_APP_BD_2_END_LINE=$(getLine $SHELL_APP_BD_2_END $appBuildFilePath)

SHELL_APP_BD_3_START_LINE=$(getLine $SHELL_APP_BD_3_START $appBuildFilePath)
SHELL_APP_BD_3_END_LINE=$(getLine $SHELL_APP_BD_3_END $appBuildFilePath)

SHELL_APP_BD_4_START_LINE=$(getLine $SHELL_APP_BD_4_START $appBuildFilePath)
SHELL_APP_BD_4_END_LINE=$(getLine $SHELL_APP_BD_4_END $appBuildFilePath)

APP_BD_START_LINE_1=$(($SHELL_APP_BD_1_START_LINE+$APP_CONFIG_NUMBER))
APP_BD_END_LINE_1=$(($SHELL_APP_BD_1_END_LINE-$APP_CONFIG_NUMBER))

APP_BD_START_LINE_2=$(($SHELL_APP_BD_2_START_LINE+$APP_CONFIG_NUMBER))
APP_BD_END_LINE_2=$(($SHELL_APP_BD_2_END_LINE-$APP_CONFIG_NUMBER))

APP_BD_START_LINE_3=$(($SHELL_APP_BD_3_START_LINE+$APP_CONFIG_NUMBER))
APP_BD_END_LINE_3=$(($SHELL_APP_BD_3_END_LINE-$APP_CONFIG_NUMBER))

APP_BD_START_LINE_4=$(($SHELL_APP_BD_4_START_LINE+$APP_CONFIG_NUMBER))
APP_BD_END_LINE_4=$(($SHELL_APP_BD_4_END_LINE-$APP_CONFIG_NUMBER))

appBDStatusStart1=$(judgeStringInFile $SHELL_APP_BD_1_START $appBuildFilePath)
appBDStatusEnd1=$(judgeStringInFile $SHELL_APP_BD_1_END $appBuildFilePath)

appBDStatusStart2=$(judgeStringInFile $SHELL_APP_BD_2_START $appBuildFilePath)
appBDStatusEnd2=$(judgeStringInFile $SHELL_APP_BD_2_END $appBuildFilePath)

appBDStatusStart3=$(judgeStringInFile $SHELL_APP_BD_3_START $appBuildFilePath)
appBDStatusEnd3=$(judgeStringInFile $SHELL_APP_BD_3_END $appBuildFilePath)

appBDStatusStart4=$(judgeStringInFile $SHELL_APP_BD_4_START $appBuildFilePath)
appBDStatusEnd4=$(judgeStringInFile $SHELL_APP_BD_4_END $appBuildFilePath)

function writeOffCodeBD(){
if [ $2 -ne 1 -a $3  -ne 1 ];then
    sh $writeOffCodeFilePath $4 $5 $1 $appBuildFilePath
    else
        echo "<<"$appBuildFilePath"中缺少驱动脚本字符串<<"$6">>和<<"$7
    fi
}

if [ $appProductType -eq 1 ];then

    echo "开始对 app build.gradle buildType demon 第一部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeBD $CODE_OPEN $appBDStatusStart1 $appBDStatusEnd1 $APP_BD_START_LINE_1 $APP_BD_END_LINE_1 $SHELL_APP_BD_1_START $SHELL_APP_BD_1_END)
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart2 $appBDStatusEnd2 $APP_BD_START_LINE_2 $APP_BD_END_LINE_2 $SHELL_APP_BD_2_START $SHELL_APP_BD_2_END)
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart3 $appBDStatusEnd3 $APP_BD_START_LINE_3 $APP_BD_END_LINE_3 $SHELL_APP_BD_3_START $SHELL_APP_BD_3_END)
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart4 $appBDStatusEnd4 $APP_BD_START_LINE_4 $APP_BD_END_LINE_4 $SHELL_APP_BD_4_START $SHELL_APP_BD_4_END)

fi

if [ $appProductType -eq 2 ];then

    echo "开始对 app build.gradle buildType demon 第二部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart1 $appBDStatusEnd1 $APP_BD_START_LINE_1 $APP_BD_END_LINE_1 $SHELL_APP_BD_1_START $SHELL_APP_BD_1_END)
    $(writeOffCodeBD $CODE_OPEN $appBDStatusStart2 $appBDStatusEnd2 $APP_BD_START_LINE_2 $APP_BD_END_LINE_2 $SHELL_APP_BD_2_START $SHELL_APP_BD_2_END)
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart3 $appBDStatusEnd3 $APP_BD_START_LINE_3 $APP_BD_END_LINE_3 $SHELL_APP_BD_3_START $SHELL_APP_BD_3_END)
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart4 $appBDStatusEnd4 $APP_BD_START_LINE_4 $APP_BD_END_LINE_4 $SHELL_APP_BD_4_START $SHELL_APP_BD_4_END)

fi

if [ $appProductType -eq 3 ];then

    echo "开始对 app build.gradle buildType demon 第三部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart1 $appBDStatusEnd1 $APP_BD_START_LINE_1 $APP_BD_END_LINE_1 $SHELL_APP_BD_1_START $SHELL_APP_BD_1_END)
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart2 $appBDStatusEnd2 $APP_BD_START_LINE_2 $APP_BD_END_LINE_2 $SHELL_APP_BD_2_START $SHELL_APP_BD_2_END)
    $(writeOffCodeBD $CODE_OPEN $appBDStatusStart3 $appBDStatusEnd3 $APP_BD_START_LINE_3 $APP_BD_END_LINE_3 $SHELL_APP_BD_3_START $SHELL_APP_BD_3_END)
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart4 $appBDStatusEnd4 $APP_BD_START_LINE_4 $APP_BD_END_LINE_4 $SHELL_APP_BD_4_START $SHELL_APP_BD_4_END)

fi

if [ $appProductType -eq 4 ];then

    echo "开始对 app build.gradle buildType demon 第四部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart1 $appBDStatusEnd1 $APP_BD_START_LINE_1 $APP_BD_END_LINE_1 $SHELL_APP_BD_1_START $SHELL_APP_BD_1_END)
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart2 $appBDStatusEnd2 $APP_BD_START_LINE_2 $APP_BD_END_LINE_2 $SHELL_APP_BD_2_START $SHELL_APP_BD_2_END)
    $(writeOffCodeBD $CODE_CLOSE $appBDStatusStart3 $appBDStatusEnd3 $APP_BD_START_LINE_3 $APP_BD_END_LINE_3 $SHELL_APP_BD_3_START $SHELL_APP_BD_3_END)
    $(writeOffCodeBD $CODE_OPEN $appBDStatusStart4 $appBDStatusEnd4 $APP_BD_START_LINE_4 $APP_BD_END_LINE_4 $SHELL_APP_BD_4_START $SHELL_APP_BD_4_END)

fi
