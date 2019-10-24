#!/usr/bin/env bash


QT_PATH=./qt-everywhere-opensource-src-4.8.7

# tar *.tar.gz
if [ ! -d $QT_PATH ]
then
	tar -vxzf ../qt-everywhere-opensource-src-4.8.7.tar.gz
fi

# copy 
cp -f ./io.pri $QT_PATH/src/corelib/io

# copy
cp -rf ./arm-hisiv300-linux-g++ $QT_PATH/mkspecs/qws
cp -rf ./arm-hisiv500-linux-g++ $QT_PATH/mkspecs/qws

