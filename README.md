# Qt
Qt build/run for hi35xx chip.
Qt 在海思hi35xx平台下的编译与运行

## 下载Qt

* 下载地址: http://download.qt.io/archive/qt/
* 版本4.8.7: https://mirrors.tuna.tsinghua.edu.cn/qt/archive/qt/4.8/4.8.7/qt-everywhere-opensource-src-4.8.7.tar.gz

* 如果需要编译, 不要使用*.zip包, 否则会出现编译错误

* github无法上传超过100m文件,将源码包切割

```
split -b 32m -d qt-everywhere-opensource-src-4.8.7.tar.gz qt478_part_ --verbose
```

* 还原文件

```
cat qt478_part_* > qt-everywhere-opensource-src-4.8.7.tar.gz
```

## hi35xx编译准备

* 按海思文档安装海思编译器, arm-hisiv*-linux- 系列


## 版本4.8.7

### 1. 解压源码

```
cd ./Qt487
tar -vxzf ../qt-everywhere-opensource-src-4.8.7.tar.gz
```

### 2. 添加自定义的编译器环境

* 以 arm-hisiv300-linux- 为例
* 拷贝目录: "./mkspecs/qws/arm-none-linux-gnueabi-g++/"
* 重新命名为: "./mkspecs/qws/arm-hisiv300-linux-g++/"

* 修改文件: "./mkspecs/qws/arm-hisiv300-linux-g++/qmake.conf" 为

```
#
# qmake configuration for building with arm-none-linux-gnueabi-g++
#

include(../../common/linux.conf)
include(../../common/gcc-base-unix.conf)
include(../../common/g++-unix.conf)
include(../../common/qws.conf)

# modifications to g++.conf
QMAKE_CC                = arm-hisiv300-linux-gcc
QMAKE_CXX               = arm-hisiv300-linux-g++
QMAKE_LINK              = arm-hisiv300-linux-g++
QMAKE_LINK_SHLIB        = arm-hisiv300-linux-g++

# modifications to linux.conf
QMAKE_AR                = arm-hisiv300-linux-ar cqs
QMAKE_OBJCOPY           = arm-hisiv300-linux-objcopy
QMAKE_STRIP             = arm-hisiv300-linux-strip

# modifications to gcc-base.conf
QMAKE_CFLAGS_RELEASE += -march=armv7-a -mcpu=cortex-a7 -mfloat-abi=softfp -mfpu=vfpv3-d16
QMAKE_CXXFLAGS_RELEASE += -march=armv7-a -mcpu=cortex-a7 -mfloat-abi=softfp -mfpu=vfpv3-d16

load(qt_config)
```

* a. 修改编译器
* b. 添加编译宏QMAKE_CFLAGS_RELEASE/QMAKE_CXXFLAGS_RELEASE, 软浮点运算

### 3. 修正Arm下部分未编译的文件

* 修改文件: "./src/corelib/io/io.pri"

```
解决链接应用程序错误: "libQtCore.so: undefined reference to QInotifyFileSystemWatcherEngine::create()"

修改 line.99 : 为 "linux-*|arm-linux-*|arm-hisiv*: {"

以下为修改后的局部

qnx:contains(QT_CONFIG, inotify) {
    SOURCES += io/qfilesystemwatcher_inotify.cpp
    HEADERS += io/qfilesystemwatcher_inotify_p.h
}

linux-*|arm-linux-*|arm-hisiv*: {
    SOURCES += \
            io/qfilesystemwatcher_inotify.cpp \
            io/qfilesystemwatcher_dnotify.cpp

    HEADERS += \
            io/qfilesystemwatcher_inotify_p.h \
            io/qfilesystemwatcher_dnotify_p.h
}

!nacl {
    freebsd-*|macx-*|darwin-*|openbsd-*:{
        SOURCES += io/qfilesystemwatcher_kqueue.cpp
        HEADERS += io/qfilesystemwatcher_kqueue_p.h
    }
}
```

### 4. 生成Makefile文件

* 使用 ./configure *** 生成
* 可以查看写好的脚本

```
1. https://github.com/lishaoliang/Qt/blob/master/Qt487/build_env.sh
解压qt4.8.7包
将修改好的 io.pri 文件拷贝到对应目录
将修改好的 arm-hisiv300-linux-g++ 目录拷贝到对应目录

2. https://github.com/lishaoliang/Qt/blob/master/Qt487/qt_config.sh
qt的常用配置选项

3. https://github.com/lishaoliang/Qt/blob/master/Qt487/build.sh
./configure *** 生成Makefile文件

```

* 注意安装目录"-prefix /qt_lib_hisiv300"; 在运行程序时, QT会从"/qt_lib_hisiv300/lib/fonts"目录加载字库
* 如果是动态库还需设置QT的动态库目录

### 5. 编译/安装

```
cd ./Qt487/qt-everywhere-opensource-src-4.8.7
make
make install
```

### 6. arm环境配置

* 将安装目录按原目录格式拷贝到对应的开发板目录中

```
仅需 /xxx/lib/*.so, /xxx/lib/fonts/ 这些文件

export LD_LIBRARY_PATH='/usr/local/lib:/usr/lib:/qt_xxx'
```

### 7. arm-hisiv300-linux-g++编译
* 编译错误 "undefined reference to vtable for xxxx"

```
添加编译宏: -DQT_DEPRECATED_WARNINGS

使用QT编译的moc工具,将头文件的宏"Q_OBJECT"自动化实现c++对应函数,并加入编译

例如:
/qt_lib_hisiv300/bin/moc ./testwindows.h > testwindows.moc

将 testwindows.moc 文件加入编译
```

### 8. 将测试程序拷贝到板上

```
./test_qt -qws -fn DejaVuSans

-qws : 解决无服务器运行
-fn DejaVuSans : 解决无字库问题

```

* 好吧, 至此还是无法看到界面...
* 还需要初始化海思vo部分,以及对hifb进行初始化

### 9. 海思vo/hifb初始化

* vo部分参考海思文档: <<HiMPP xxx 媒体处理软件开发参考.pdf>>
* hifb部分参考: <<HiFB 开发指南.pdf>> <<HiFB API参考.pdf>>
* 海思示例代码: xxx/sample/hifb/sample_hifb.c
* 将hifb配置为ARGB格式
* 再尝试运行

### 10. 懒人编译配置脚本

```
cd ./Qt487
./build.sh
cd ./qt-everywhere-opensource-src-4.8.7
make
make install

```
