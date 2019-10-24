#!/usr/bin/env bash


source ./qt_config.sh
echo $CFG_ARM_SHARED

# 
sh ./build_env.sh

# 
cd ./qt-everywhere-opensource-src-4.8.7

# 
./configure \
-prefix /qt_lib_hisiv300 \
-platform linux-g++ -xplatform qws/arm-hisiv300-linux-g++ \
$CFG_ARM_SHARED
