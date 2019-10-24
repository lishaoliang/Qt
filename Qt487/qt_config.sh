#!/usr/bin/env bash


# shared
export CFG_ARM_SHARED="\
-opensource -confirm-license \
-release -shared \
-embedded arm \
-fast -qt-freetype -qt-libjpeg \
-nomake demos -nomake examples -nomake docs \
-no-pch -no-avx -no-openssl -no-cups -no-dbus -no-opengl -no-glib \
-no-nis -no-cups \
-no-largefile -no-qt3support -no-qvfb \
-no-multimedia -no-audio-backend -no-phonon -no-phonon-backend \
-no-webkit -no-javascript-jit -no-script -no-scripttools -no-declarative \
-little-endian "


# static
export CFG_ARM_STATIC="\
-opensource -confirm-license \
-release -static \
-embedded arm \
-fast -qt-freetype -qt-libjpeg \
-nomake demos -nomake examples -nomake docs \
-no-pch -no-avx -no-openssl -no-cups -no-dbus -no-opengl -no-glib \
-no-nis -no-cups \
-no-largefile -no-qt3support -no-qvfb \
-no-multimedia -no-audio-backend -no-phonon -no-phonon-backend \
-no-webkit -no-javascript-jit -no-script -no-scripttools -no-declarative \
-little-endian "


#-prefix /home/lsl/share/work/qt-everywhere-opensource-src-4.8.7/qt_lib \
#-platform linux-g++ -xplatform qws/arm-hisiv300-linux-g++ \


#./configure -embedded arm
#-little-endian
#-host-little-endian
#-xplatform qws/linux-arm-g++ 
#-prefix /usr/local/toolchain/hisiv300/Hi3521a/qt-4.8.7/shared 
#-release -shared 
#-opensource -confirm-license 
#-no-multimedia 
#-no-audio-backend -no-webkit -nomake examples -nomake demos -nomake docs 
#-nomake tools -no-qt3support -no-javascript-jit 
#-no-script -no-scripttools -no-declarative -qt-zlib -qt-libtiff 
#-qt-libpng -qt-libmng -qt-libjpeg -no-openssl -no-nis 
#-no-cups -no-dbus -qt-freetype -no-opengl 
#-depths 16,24,32 
#-qt-gfx-linuxfb 
#-qt-mouse-linuxinput

