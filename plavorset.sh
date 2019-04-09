#!/usr/bin/env bash

#1代表需要将第一部分代码打开 其余部分关闭 以此类推
appProductType=$1

CURRENT_SHELL_PATH=$(pwd)

#脚本路径
writeOffProductFlavorFilePath=$CURRENT_SHELL_PATH/shell/writeOffProductFlavor.sh
writeOffBuildTypeDemonFilePath=$CURRENT_SHELL_PATH/shell/writeOffBuildTypeDemon.sh
writeOffBuildTypeReleaseFilePath=$CURRENT_SHELL_PATH/shell/writeOffBuildTypeRelease.sh
writeOffResourceFilePath=$CURRENT_SHELL_PATH/shell/writeOffResource.sh

#资源签名三方参数设置文件路径
appBuildFilePath=$CURRENT_SHELL_PATH/app/build.gradle
baseLibraryBuildFilePath=$CURRENT_SHELL_PATH/baselibrary/build.gradle
loanBuildFilePath=$CURRENT_SHELL_PATH/loan/build.gradle

changeStringIndexTipAppPF="[app][build.gradle][productFlavors]"
changeStringIndexTipBaseLibraryPF="[baseLibrary][build.gradle][productFlavors]"
changeStringIndexTipLoanPF="[loan][build.gradle][buildType][productFlavors]"

sh $writeOffProductFlavorFilePath $appProductType $appBuildFilePath "$changeStringIndexTipAppPF"

sh $writeOffBuildTypeReleaseFilePath $appProductType
sh $writeOffBuildTypeDemonFilePath $appProductType
sh $writeOffResourceFilePath $appProductType

sh $writeOffProductFlavorFilePath $appProductType $baseLibraryBuildFilePath "$changeStringIndexTipBaseLibraryPF"
sh $writeOffProductFlavorFilePath $appProductType $loanBuildFilePath "$changeStringIndexTipLoanPF"

echo "第"$appProductType"部分全部代码放开完毕"


