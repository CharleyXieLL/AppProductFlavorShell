#!/usr/bin/env bash
appProductType=$1

#资源签名三方参数设置文件路径
appBuildFilePath=$(pwd)/app/build.gradle
#writeOffCode
writeOffCodeFilePath=$(pwd)/shell/writeOffCode.sh

SHELL_APP_RES_1_START="SHELL_APP_RES_1_START"
SHELL_APP_RES_1_END="SHELL_APP_RES_1_END"

SHELL_APP_RES_2_START="SHELL_APP_RES_2_START"
SHELL_APP_RES_2_END="SHELL_APP_RES_2_END"

SHELL_APP_RES_3_START="SHELL_APP_RES_3_START"
SHELL_APP_RES_3_END="SHELL_APP_RES_3_END"

SHELL_APP_RES_4_START="SHELL_APP_RES_4_START"
SHELL_APP_RES_4_END="SHELL_APP_RES_4_END"

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

SHELL_APP_RES_1_START_LINE=$(getLine $SHELL_APP_RES_1_START $appBuildFilePath)
SHELL_APP_RES_1_END_LINE=$(getLine $SHELL_APP_RES_1_END $appBuildFilePath)

SHELL_APP_RES_2_START_LINE=$(getLine $SHELL_APP_RES_2_START $appBuildFilePath)
SHELL_APP_RES_2_END_LINE=$(getLine $SHELL_APP_RES_2_END $appBuildFilePath)

SHELL_APP_RES_3_START_LINE=$(getLine $SHELL_APP_RES_3_START $appBuildFilePath)
SHELL_APP_RES_3_END_LINE=$(getLine $SHELL_APP_RES_3_END $appBuildFilePath)

SHELL_APP_RES_4_START_LINE=$(getLine $SHELL_APP_RES_4_START $appBuildFilePath)
SHELL_APP_RES_4_END_LINE=$(getLine $SHELL_APP_RES_4_END $appBuildFilePath)

APP_RES_START_LINE_1=$(($SHELL_APP_RES_1_START_LINE+$APP_CONFIG_NUMBER))
APP_RES_END_LINE_1=$(($SHELL_APP_RES_1_END_LINE-$APP_CONFIG_NUMBER))

APP_RES_START_LINE_2=$(($SHELL_APP_RES_2_START_LINE+$APP_CONFIG_NUMBER))
APP_RES_END_LINE_2=$(($SHELL_APP_RES_2_END_LINE-$APP_CONFIG_NUMBER))

APP_RES_START_LINE_3=$(($SHELL_APP_RES_3_START_LINE+$APP_CONFIG_NUMBER))
APP_RES_END_LINE_3=$(($SHELL_APP_RES_3_END_LINE-$APP_CONFIG_NUMBER))

APP_RES_START_LINE_4=$(($SHELL_APP_RES_4_START_LINE+$APP_CONFIG_NUMBER))
APP_RES_END_LINE_4=$(($SHELL_APP_RES_4_END_LINE-$APP_CONFIG_NUMBER))

appRESStatusStart1=$(judgeStringInFile $SHELL_APP_RES_1_START $appBuildFilePath)
appRESStatusEnd1=$(judgeStringInFile $SHELL_APP_RES_1_END $appBuildFilePath)

appRESStatusStart2=$(judgeStringInFile $SHELL_APP_RES_2_START $appBuildFilePath)
appRESStatusEnd2=$(judgeStringInFile $SHELL_APP_RES_2_END $appBuildFilePath)

appRESStatusStart3=$(judgeStringInFile $SHELL_APP_RES_3_START $appBuildFilePath)
appRESStatusEnd3=$(judgeStringInFile $SHELL_APP_RES_3_END $appBuildFilePath)

appRESStatusStart4=$(judgeStringInFile $SHELL_APP_RES_4_START $appBuildFilePath)
appRESStatusEnd4=$(judgeStringInFile $SHELL_APP_RES_4_END $appBuildFilePath)

function writeOffCodeRES(){
if [ $2 -ne 1 -a $3  -ne 1 ];then
    sh $writeOffCodeFilePath $4 $5 $1 $appBuildFilePath
    else
    echo "<<"$appBuildFilePath"中缺少驱动脚本字符串<<"$6">>和<<"$7
    fi
}

if [ $appProductType -eq 1 ];then

    echo "开始对 app build.gradle resource 第一部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeRES $CODE_OPEN $appRESStatusStart1 $appRESStatusEnd1 $APP_RES_START_LINE_1 $APP_RES_END_LINE_1 $SHELL_APP_RES_1_START $SHELL_APP_RES_1_END)
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart2 $appRESStatusEnd2 $APP_RES_START_LINE_2 $APP_RES_END_LINE_2 $SHELL_APP_RES_2_START $SHELL_APP_RES_2_END)
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart3 $appRESStatusEnd3 $APP_RES_START_LINE_3 $APP_RES_END_LINE_3 $SHELL_APP_RES_3_START $SHELL_APP_RES_3_END)
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart4 $appRESStatusEnd4 $APP_RES_START_LINE_4 $APP_RES_END_LINE_4 $SHELL_APP_RES_4_START $SHELL_APP_RES_4_END)

fi

if [ $appProductType -eq 2 ];then

    echo "开始对 app build.gradle resource 第二部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart1 $appRESStatusEnd1 $APP_RES_START_LINE_1 $APP_RES_END_LINE_1 $SHELL_APP_RES_1_START $SHELL_APP_RES_1_END)
    $(writeOffCodeRES $CODE_OPEN $appRESStatusStart2 $appRESStatusEnd2 $APP_RES_START_LINE_2 $APP_RES_END_LINE_2 $SHELL_APP_RES_2_START $SHELL_APP_RES_2_END)
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart3 $appRESStatusEnd3 $APP_RES_START_LINE_3 $APP_RES_END_LINE_3 $SHELL_APP_RES_3_START $SHELL_APP_RES_3_END)
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart4 $appRESStatusEnd4 $APP_RES_START_LINE_4 $APP_RES_END_LINE_4 $SHELL_APP_RES_4_START $SHELL_APP_RES_4_END)

fi

if [ $appProductType -eq 3 ];then

    echo "开始对 app build.gradle resource 第三部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart1 $appRESStatusEnd1 $APP_RES_START_LINE_1 $APP_RES_END_LINE_1 $SHELL_APP_RES_1_START $SHELL_APP_RES_1_END)
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart2 $appRESStatusEnd2 $APP_RES_START_LINE_2 $APP_RES_END_LINE_2 $SHELL_APP_RES_2_START $SHELL_APP_RES_2_END)
    $(writeOffCodeRES $CODE_OPEN $appRESStatusStart3 $appRESStatusEnd3 $APP_RES_START_LINE_3 $APP_RES_END_LINE_3 $SHELL_APP_RES_3_START $SHELL_APP_RES_3_END)
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart4 $appRESStatusEnd4 $APP_RES_START_LINE_4 $APP_RES_END_LINE_4 $SHELL_APP_RES_4_START $SHELL_APP_RES_4_END)

fi

if [ $appProductType -eq 4 ];then

    echo "开始对 app build.gradle resource 第四部分代码进行放开操作"
    echo "正在处理..."

    #开始进行 productFlavors 部分代码注释处理
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart1 $appRESStatusEnd1 $APP_RES_START_LINE_1 $APP_RES_END_LINE_1 $SHELL_APP_RES_1_START $SHELL_APP_RES_1_END)
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart2 $appRESStatusEnd2 $APP_RES_START_LINE_2 $APP_RES_END_LINE_2 $SHELL_APP_RES_2_START $SHELL_APP_RES_2_END)
    $(writeOffCodeRES $CODE_CLOSE $appRESStatusStart3 $appRESStatusEnd3 $APP_RES_START_LINE_3 $APP_RES_END_LINE_3 $SHELL_APP_RES_3_START $SHELL_APP_RES_3_END)
    $(writeOffCodeRES $CODE_OPEN $appRESStatusStart4 $appRESStatusEnd4 $APP_RES_START_LINE_4 $APP_RES_END_LINE_4 $SHELL_APP_RES_4_START $SHELL_APP_RES_4_END)

fi