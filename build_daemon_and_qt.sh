cd $COINFOLDER

LIBSH=$EWBPATHMSYS$LIB
MINDIR=$EWBPATHMSYSmingw32

BOOST_ROOT="$LIBSH/$BOOST"
export BOOST_ROOT

# WINDRES="$MINDIR/bin/windres.exe"
# export WINDRES

# BOOST_INCLUDE="$BOOST_ROOT/boost"
# export BOOST_INCLUDE

# BOOST_LIBDIR="$MINGW64PATH/stage/lib"
# export BOOST_LIBDIR

# BOOST_LIB_PATH="$LIBSH/stage/lib"
# export BOOST_LIB_PATH

# BOOST_INCLUDE_PATH="$LIBSH/boost"
# export BOOST_INCLUDE_PATH

#BOOST_LIB_SUFFIX="$BOOSTSUFFIX"
#export BOOST_LIB_SUFFIX

echo Building daemon and qt...
./autogen.sh
if [ ${?} -ne 0 ]; then echo "daemon autogen failed."; read -n 1 -s; exit 1;fi

CPPFLAGS="-I$LIBSH/$OPENSSL/include \
-I$LIBSH/$BERKELEYDB/build_unix \
-I$LIBSH/protobuf-$PROTOBUF/src \
-I$LIBSH/$MINIUPNPC \
-I$LIBSH/$LIBPNG \
-I$LIBSH/libevent-$LIBEVENT-stable/include \
-I$LIBSH/$BOOST \
$ADDITIONALCCFLAGS"
export CPPFLAGS

# -I$LIBSH \
# -I$MINDIR/bin \

LDFLAGS="-L$LIBSH/$OPENSSL \
-L$LIBSH/$BERKELEYDB/build_unix \
-L$LIBSH/$MINIUPNPC/miniupnpc \
-L$LIBSH/$LIBPNG/.libs \
-L$LIBSH/protobuf-$PROTOBUF/src/.libs \
-L$LIBSH/libevent-$LIBEVENT-stable/.libs \
-L$LIBSH/$BOOST/stage/lib"
export LDFLAGS

CXXFLAGS="--param ggc-min-expand=$MIN_EXPAND --param ggc-min-heapsize=$HEAP_SIZE"
export CXXFLAGS

./configure \
--disable-upnp-default \
--disable-tests \
--with-qt-incdir=$QTPATHMSYS/include \
--with-qt-libdir=$QTPATHMSYS/lib \
--with-qt-plugindir=$QTPATHMSYS/plugins \
--with-qt-bindir=$QTPATHMSYS/bin \
--with-protoc-bindir=$LIBSH/protobuf-$PROTOBUF/src \
--with-gui=qt5 \
--with-boost=$LIBSH/$BOOST \
--with-boost-libdir=$LIBSH/$BOOST/stage/lib
# --with-miniupnpc=no
# --disable-hardening
# --enable-debug

if [ ${?} -ne 0 ]; then echo "client configure failed."; read -n 1 -s; exit 1;fi
#make
 mingw32-make -d -j 1
 if [ ${?} -ne 0 ]; then echo "client make failed."; read -n 1 -s; exit 1;fi

 strip ./src/*.exe
 strip ./src/qt/*.exe
