#!/usr/bin/env bash

# path
QT_PREFIX=/qt_lib
echo "-prefix=$QT_PREFIX"

# config
source ./qt_config.sh
echo $CFG_ARM_STATIC_MIN

# 
sh ./build_env.sh

# 
cd ./qt-everywhere-opensource-src-4.8.7

# 
./configure \
-prefix $QT_PREFIX \
-platform linux-g++ -xplatform qws/arm-hisiv300-linux-g++ \
$CFG_ARM_STATIC_MIN
