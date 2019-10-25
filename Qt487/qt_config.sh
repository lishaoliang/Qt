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
-little-endian \
-no-armfpa \
-depths 16,32 "


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
-little-endian \
-no-armfpa \
-depths 16,32 "


# static min
export CFG_ARM_STATIC_MIN="\
-opensource -confirm-license \
-release -static \
-embedded arm \
-fast -qt-freetype -qt-libjpeg \
-no-largefile \
-no-exceptions \
-no-accessibility \
-no-stl \
-no-qt3support \
-no-xmlpatterns \
-no-multimedia \
-no-audio-backend \
-no-phonon \
-no-phonon-backend \
-no-webkit \
-no-javascript-jit \
-no-script \
-no-scripttools \
-no-declarative \
-no-declarative-debug \
-no-gif \
-no-libpng \
-no-libtiff \
-no-libmng \
-no-openssl \
-nomake tools \
-nomake examples \
-nomake demos \
-nomake docs \
-nomake translations \
-no-nis \
-no-cups \
-no-iconv \
-no-pch \
-no-dbus \
-no-gtkstyle \
-no-nas-sound \
-no-opengl \
-no-openvg \
-no-sm \
-no-xshape \
-no-xvideo \
-no-xsync \
-no-xinerama \
-no-xcursor \
-no-xfixes \
-no-sql-driver \
-no-xrandr \
-no-xrender \
-no-mitshm \
-no-fontconfig \
-no-xinput \
-no-xkb \
-no-glib \
-no-qvfb \
-no-mmx -no-3dnow -no-sse -no-sse2 -no-sse3 -no-ssse3 -no-sse4.1 -no-sse4.2 -no-avx -no-neon \
-little-endian \
-no-armfpa \
-depths 16,32 "

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

