set -x

rm -rf build-databinding

LAYOUT_INFO_OUTPUT='build-databinding/layoutinfo'
RES_OUTPUT='build-databinding/resOutput'

mkdir build-databinding
mkdir $RES_OUTPUT
mkdir $LAYOUT_INFO_OUTPUT
mkdir aarOutDir  # used by buck processor

PACKAGE='com.hackathon.buckapp'


java -jar /Users/carlo/Projects/aosp/tools/data-binding/exec/build/intermediates/fullJar/android-data-binding-fat.jar \
PROCESS \
-package $PACKAGE \
-resInput /Users/carlo/Projects/BuckApp/app/src/main/res \
-resOutput $RES_OUTPUT \
-layoutInfoOutput $LAYOUT_INFO_OUTPUT \
-zipLayoutInfo true \
-useAndroidX true


java -jar /Users/carlo/Projects/aosp/tools/data-binding/exec/build/intermediates/fullJar/android-data-binding-fat.jar \
GEN_BASE_CLASSES \
-classInfoOut /Users/carlo/Projects/BuckApp/build-databinding/class-info-out.zip \
-layoutInfoFiles $LAYOUT_INFO_OUTPUT/layout-info.zip \
-package $PACKAGE \
-sourceOut /Users/carlo/Projects/BuckApp/build-databinding/sourceOut.zip \
-useAndroidX true \
-zipSourceOutput true