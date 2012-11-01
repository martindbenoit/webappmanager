# @@@LICENSE
#
#      Copyright (c) 2010-2012 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# LICENSE@@@

TEMPLATE = app

CONFIG += qt

TARGET_TYPE = 

ENV_BUILD_TYPE = $$(BUILD_TYPE)
!isEmpty(ENV_BUILD_TYPE) {
	CONFIG -= release debug
	CONFIG += $$ENV_BUILD_TYPE
}

# Prevent conflict with usage of "signal" in other libraries
CONFIG += no_keywords

CONFIG += link_pkgconfig
PKGCONFIG = glib-2.0 gthread-2.0

QT = core gui declarative webkit network

VPATH = \
		./Src \
		./Src/base \
		./Src/base/application \
		./Src/base/hosts \
		./Src/base/visual \
		./Src/base/gesture \
		./Src/base/windowdata \
		./Src/base/settings \
		./Src/core \
		./Src/js \
		./Src/sound \
                ./Src/webbase \
		./Src/lunaui \
        ./Src/lunaui/cards \
        ./Src/lunaui/notifications \
        ./Src/lunaui/emergency \
        ./Src/lunaui/lockscreen \
        ./Src/lunaui/dock \
		./Src/minimalui \
		./Src/remote \
		./Src/lunaui/status-bar \
        ./Src/ime \
        ./Src/nyx

####### LAUNCHER ADDITIONS ########
VPATH += ./Src/lunaui/launcher
VPATH += ./Src/lunaui/launcher/gfx
VPATH += ./Src/lunaui/launcher/gfx/debug
VPATH += ./Src/lunaui/launcher/gfx/pixmapobject
VPATH += ./Src/lunaui/launcher/gfx/effects
VPATH += ./Src/lunaui/launcher/gfx/processors
VPATH += ./Src/lunaui/launcher/physics
VPATH += ./Src/lunaui/launcher/physics/motion
VPATH += ./Src/lunaui/launcher/elements
VPATH += ./Src/lunaui/launcher/elements/page
VPATH += ./Src/lunaui/launcher/elements/page/icon_layouts
VPATH += ./Src/lunaui/launcher/elements/bars
VPATH += ./Src/lunaui/launcher/elements/icons
VPATH += ./Src/lunaui/launcher/elements/util
VPATH += ./Src/lunaui/launcher/elements/static
VPATH += ./Src/lunaui/launcher/elements/buttons
VPATH += ./Src/lunaui/launcher/systeminterface
VPATH += ./Src/lunaui/launcher/systeminterface/util
VPATH += ./Src/lunaui/launcher/util
VPATH += ./Src/lunaui/launcher/test

####### LAUNCHER ADDITIONS ########

INCLUDEPATH = $$VPATH

DEFINES += QT_WEBOS

# For shipping version of the code, as opposed to a development build. Set this to 1 late in the process...
DEFINES += SHIPPING_VERSION=0

# Uncomment to compile in trace statements in the code for debugging
# DEFINES += ENABLE_TRACING

# DEFINES += HAVE_CALLGRIND=1

# This allows the use of the % for faster QString concatentation
# See the QString documentation for more information
# DEFINES += QT_USE_FAST_CONCATENATION

# Uncomment this for all QString concatenations using +
# to go through the faster % instead.  Not sure what impact
# this has performance wise or behaviour wise.
# See the QString documentation for more information
# DEFINES += QT_USE_FAST_OPERATOR_PLUS

SOURCES = \
        AlertWebApp.cpp \
        ApplicationDescription.cpp \
        AsyncCaller.cpp \
        BackupManager.cpp \
        BannerMessageEventFactory.cpp \
        CardWebApp.cpp \
        CmdResourceHandlers.cpp \
        DashboardWebApp.cpp \
        DockWebApp.cpp \
        EventReporter.cpp \
        HostBase.cpp \
        JSONUtils.cpp \
        KeyboardMapping.cpp \
        KeywordMap.cpp \
        LaunchPoint.cpp \
        Localization.cpp \
        Logging.cpp \
        Main.cpp \
        MemoryWatcher.cpp \
        MimeSystem.cpp \
        Mutex.cpp \
        PalmSystem.cpp \
        Preferences.cpp \
        ProcessManager.cpp \
        RemoteWindowData.cpp \
        Settings.cpp \
        SingletonTimer.cpp \
        SyncTask.cpp \
        SysMgrWebBridge.cpp \
        TaskBase.cpp \
        Timer.cpp \
        Utils.cpp \
        VirtualKeyboardPreferences.cpp \
        WebAppBase.cpp \
        WebAppCache.cpp \
        WebAppDeferredUpdateHandler.cpp \
        WebAppFactory.cpp \
        WebAppFactoryMinimal.cpp \
        WebAppFactoryLuna.cpp \
        WebAppManager.cpp \
        WebKitEventListener.cpp \
        Window.cpp \
        WindowedWebApp.cpp

HEADERS = \
        AlertWebApp.h \
        ApplicationDescription.h \
        AsyncCaller.h \
        BackupManager.h \
        BannerMessageEventFactory.h \
        CardWebApp.h \
        CmdResourceHandlers.h \
        DashboardWebApp.h \
        DocWebApp.h \
        EventReporter.h \
        HostBase.h \
        JSONUtils.h \
        KeyboardMapping.h \
        KeywordMap.h \
        LaunchPoint.h \
        Localization.h \
        Logging.h \
        MemoryWatcher.h \
        MimeSystem.h \
        Mutex.h \
        PalmSystem.h \
        Preferences.h \
        ProcessManager.h \
        RemoteWindowData.h \
        Settings.h \
        SingletonTimer.h \
        SyncTask.h \
        SysMgrWebBridge.h \
        SystemUiController.h \
        TaskBase.h \
        Timer.h \
        Utils.h \
        VirtualKeyboardPreferences.h \
        WebAppBase.h \
        WebAppCache.h \
        WebAppDeferredUpdateHandler.h \
        WebAppFactory.h \
        WebAppFactoryMinimal.h \
        WebAppFactoryLuna.h \
        WebAppManager.h \
        WebKitEventListener.h \
        Window.h \
        WindowedWebApp.h



QMAKE_CXXFLAGS += -fno-rtti -fno-exceptions -fvisibility=hidden -fvisibility-inlines-hidden -Wall -fpermissive
QMAKE_CXXFLAGS += -DFIX_FOR_QT  # -fprofile-arcs -ftest-coverage
# QMAKE_LDFLAGS += -fprofile-arcs
#-DNO_WEBKIT_INIT

# Override the default (-Wall -W) from g++.conf mkspec (see linux-g++.conf)
QMAKE_CXXFLAGS_WARN_ON += -Wno-unused-parameter -Wno-unused-variable -Wno-reorder -Wno-missing-field-initializers -Wno-extra

LIBS += -lcjson -lLunaSysMgrIpc -llunaservice -lpbnjson_cpp -lssl -lsqlite3 -lssl -lcrypto -lnyx # -lgcov

linux-g++ {
    include(desktop.pri)
} else:linux-g++-64 {
    include(desktop.pri)
} else:linux-qemux86-g++ {
	include(emulator.pri)
	QMAKE_CXXFLAGS += -fno-strict-aliasing
} else {
    ## First, check to see if this in an emulator build
    include(emulator.pri)
    contains (CONFIG_BUILD, webosemulator) {
        QMAKE_CXXFLAGS += -fno-strict-aliasing
    } else {
        ## Neither a desktop nor an emulator build, so must be a device
        include(device.pri)
    }
}


contains(CONFIG_BUILD, opengl) {
	QT += opengl
	DEFINES += HAVE_OPENGL
	DEFINES += P_BACKEND=P_BACKEND_SOFT

	contains(CONFIG_BUILD, texturesharing) {
		DEFINES += HAVE_TEXTURESHARING OPENGLCOMPOSITED
		SOURCES += HostWindowDataOpenGLTextureShared.cpp 
					RemoteWindowDataSoftwareTextureShared.cpp \
					RemoteWindowDataSoftwareQt.cpp \
					RemoteWindowDataSoftwareOpenGLComposited.cpp 
		HEADERS += HostWindowDataOpenGLTextureShared.h 
					RemoteWindowDataSoftwareTextureShared.h \
					RemoteWindowDataSoftwareQt.h \
					RemoteWindowDataSoftwareOpenGLComposited.h \
					NAppWindow.h
                #LIBS += -lnapp -lnrwindow
	} else {
		contains(CONFIG_BUILD, openglcomposited) {
			DEFINES += OPENGLCOMPOSITED
			SOURCES += RemoteWindowDataSoftwareOpenGLComposited.cpp
			HEADERS += RemoteWindowDataSoftwareOpenGLComposited.h \
						NAppWindow.h
		}
	
                SOURCES += \
                                # HostWindowDataOpenGL.cpp \
	    			RemoteWindowDataSoftwareQt.cpp \
                                RemoteWindowDataOpenGLQt.cpp

                HEADERS += \
                                # HostWindowDataOpenGL.h \
	    			RemoteWindowDataSoftwareQt.h \
                                RemoteWindowDataOpenGLQt.h

#    				RemoteWindowDataOpenGL.h \
#    				RemoteWindowDataOpenGL.cpp \
	}
}
else {
	DEFINES += P_BACKEND=P_BACKEND_SOFT
	SOURCES += RemoteWindowDataSoftwareQt.cpp
	HEADERS += RemoteWindowDataSoftwareQt.h
}

contains(CONFIG_BUILD, fb1poweroptimization) {
	DEFINES += FB1_POWER_OPTIMIZATION=1
}

contains(CONFIG_BUILD, directrendering) {
	DEFINES += DIRECT_RENDERING=1
}

contains(CONFIG_BUILD, haptics) {
	DEFINES += HAPTICS=1
}

contains(CONFIG_BUILD, mediaapi) {
    SOURCES += SoundPlayer.cpp
    HEADERS += SoundPlayer.h
    LIBS += -lmedia-api
    DEFINES += HAS_MEDIA_API
} else {
    SOURCES += SoundPlayerDummy.cpp
    HEADERS += SoundPlayerDummy.h
}

contains(CONFIG_BUILD, nyx) {
    HEADERS +=  NyxInputControl.h \
                NyxLedControl.h \

    VPATH += Src/input

    SOURCES += NyxInputControl.cpp \
           NyxLedControl.cpp \

    DEFINES += HAS_NYX
}

contains(CONFIG_BUILD, memchute) {
    LIBS += -lmemchute
    DEFINES += HAS_MEMCHUTE
}

contains(CONFIG_BUILD, hidlib) {
    INCLUDEPATH += $$(STAGING_INCDIR)/hid/IncsPublic
    LIBS += -lhid
    DEFINES += HAS_HIDLIB
}

contains(CONFIG_BUILD, affinity) {
    LIBS += -laffinity
    DEFINES += HAS_AFFINITY
}

contains(CONFIG_BUILD, napp) {
    INCLUDEPATH += $$(STAGING_INCDIR)/napp
    DEFINES += HAS_NAPP
}

DESTDIR = ./$${BUILD_TYPE}-$${MACHINE_NAME}

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc

TARGET = WebAppMgr

# Comment these out to get verbose output
#QMAKE_CXX = @echo Compiling $(@)...; $$QMAKE_CXX
#QMAKE_LINK = @echo Linking $(@)...; $$QMAKE_LINK
#QMAKE_MOC = @echo Mocing $(@)...; $$QMAKE_MOC
