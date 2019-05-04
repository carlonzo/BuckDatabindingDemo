set -x

rm -rf build-databinding

mkdir build-databinding
mkdir build-databinding/layoutinfo
mkdir build-databinding/resOutput


LAYOUT_INFO_OUTPUT='/Users/carlo/Projects/BuckApp/build-databinding/layoutinfo'
PACKAGE='com.hackathon.buckapp'


java -jar /Users/carlo/Projects/aosp/tools/data-binding/exec/build/intermediates/fullJar/android-data-binding-fat.jar \
PROCESS \
-package $PACKAGE \
-resInput /Users/carlo/Projects/BuckApp/app/src/main/res \
-resOutput /Users/carlo/Projects/BuckApp/build-databinding/resOutput \
-layoutInfoOutput $LAYOUT_INFO_OUTPUT \
-zipLayoutInfo true \
-useAndroidX true


java -jar /Users/carlo/Projects/aosp/tools/data-binding/exec/build/intermediates/fullJar/android-data-binding-fat.jar \
GEN_BASE_CLASSES \
-classInfoOut /Users/carlo/Projects/BuckApp/build-databinding/class-info-out \
-layoutInfoFiles $LAYOUT_INFO_OUTPUT/layout-info.zip \
-package $PACKAGE \
-sourceOut /Users/carlo/Projects/BuckApp/build-databinding/sourceOut.zip \
-useAndroidX true \
-zipSourceOutput true