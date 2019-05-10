set -x

TRIGGER_FILE="package com.hackathon.buckapp; import androidx.databinding.BindingBuildInfo; @BindingBuildInfo public class DataBindingInfo {}"

BASE='build-databinding'

RES_OUTPUT=$BASE/resOutput
SRC_OUTPUT_ZIP=$BASE/srcOutput.zip
CLASS_INFO_OUTPUT_ZIP=$BASE/class-info.zip
LAYOUT_INFO_OUTPUT_ZIP=$BASE/layout-info.zip

rm -rf $BASE

rm -rf aarOutDir

mkdir $BASE
mkdir $RES_OUTPUT

mkdir aarOutDir  # used by buck processor

PACKAGE='com.hackathon.buckapp'

java -jar /Users/carlo/Projects/aosp/tools/data-binding/exec/build/intermediates/fullJar/android-data-binding-fat.jar \
PROCESS \
-package $PACKAGE \
-resInput /Users/carlo/Projects/BuckApp/app/src/main/res \
-resOutput $RES_OUTPUT \
-layoutInfoOutput $BASE \
-zipLayoutInfo true \
-useAndroidX true


java -jar /Users/carlo/Projects/aosp/tools/data-binding/exec/build/intermediates/fullJar/android-data-binding-fat.jar \
GEN_BASE_CLASSES \
-classInfoOut $CLASS_INFO_OUTPUT_ZIP \
-layoutInfoFiles $LAYOUT_INFO_OUTPUT_ZIP \
-package $PACKAGE \
-sourceOut $SRC_OUTPUT_ZIP \
-useAndroidX true \
-zipSourceOutput true

BUILD_OUTPUT='app/data-binding-output'

rm -rf $BUILD_OUTPUT

mkdir $BUILD_OUTPUT

cp -r $RES_OUTPUT $BUILD_OUTPUT
unzip $SRC_OUTPUT_ZIP -d $BUILD_OUTPUT/srcOutput
unzip $CLASS_INFO_OUTPUT_ZIP -d $BUILD_OUTPUT/classInfo
unzip $LAYOUT_INFO_OUTPUT_ZIP -d $BUILD_OUTPUT/layoutInfo

echo $TRIGGER_FILE > $BUILD_OUTPUT/srcOutput/com/hackathon/buckapp/DataBindingInfo.java
