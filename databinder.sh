#!/usr/bin/env bash
set -x

TRIGGER_FILE="package com.hackathon.buckapp; import androidx.databinding.BindingBuildInfo; @BindingBuildInfo public class DataBindingInfo {}"

HOME_PROJECT=$(pwd)
BASE='build-databinding'
RES_OUTPUT=$BASE/resOutput
SRC_OUTPUT_ZIP=$BASE/srcOutput.zip
CLASS_INFO_OUTPUT_ZIP=$BASE/class-info.zip
LAYOUT_INFO_OUTPUT_ZIP=$BASE/layout-info.zip

process_module () {
    local MODULE_PATH=${HOME_PROJECT}/"$1"
    local PACKAGE="$2"
    local PACKAGE_SPLIT="$3"
    cd $MODULE_PATH

    rm -rf $BASE

    mkdir $BASE
    mkdir $RES_OUTPUT
    mkdir $BASE/aarOutDir  # used by buck processor

    java -jar /Users/carlo/Projects/BuckApp/bins/android-data-binding-exec-3.4.0.jar \
    PROCESS \
    -package ${PACKAGE} \
    -resInput ${MODULE_PATH}/src/main/res \
    -resOutput ${MODULE_PATH}/${RES_OUTPUT} \
    -layoutInfoOutput ${MODULE_PATH}/${BASE} \
    -zipLayoutInfo true \
    -useAndroidX true


    java -jar /Users/carlo/Projects/BuckApp/bins/android-data-binding-exec-3.4.0.jar \
    GEN_BASE_CLASSES \
    -classInfoOut ${MODULE_PATH}/${CLASS_INFO_OUTPUT_ZIP} \
    -layoutInfoFiles ${MODULE_PATH}/${LAYOUT_INFO_OUTPUT_ZIP} \
    -package ${PACKAGE} \
    -sourceOut ${MODULE_PATH}/${SRC_OUTPUT_ZIP} \
    -useAndroidX true \
    -zipSourceOutput true

    mkdir $BASE/artifacts

    cp -r $RES_OUTPUT $BASE
    unzip $SRC_OUTPUT_ZIP -d $BASE/srcOutput
    unzip $CLASS_INFO_OUTPUT_ZIP -d $BASE/classInfo
    unzip $LAYOUT_INFO_OUTPUT_ZIP -d $BASE/layoutInfo

    echo $TRIGGER_FILE > $BASE/srcOutput/${PACKAGE_SPLIT}/DataBindingInfo.java

    rm $SRC_OUTPUT_ZIP
    rm $CLASS_INFO_OUTPUT_ZIP
    rm $LAYOUT_INFO_OUTPUT_ZIP
}

process_module "app" "com.hackathon.buckapp" "com/hackathon/buckapp"
process_module "module-a" "com.hackathon.module_a" "com/hackathon/module_a"