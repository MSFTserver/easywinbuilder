set -o errexit

echo Creating $DOWNLOAD directory...
if [ ! -d "$DOWNLOAD" ]; then
    mkdir "$DOWNLOAD"
fi

cd "$DOWNLOAD/"

echo Downloading 7zip [unfortunately necessary for compiler extraction]...
wget -N --no-check-certificate "https://www.7-zip.org/a/$SEVENZIP.zip"
echo Downloading dependencies...
wget -N --no-check-certificate "https://www.python.org/ftp/python/$PYTHON/python-$PYTHON.exe"
wget --no-check-certificate "https://github.com/libevent/libevent/releases/download/release-$LIBEVENT-stable/libevent-$LIBEVENT-stable.tar.gz" -O "libevent-$LIBEVENT-stable.tar.gz"
wget --no-check-certificate "https://codeload.github.com/google/googletest/zip/$GTEST" -O "$GTEST.zip"
wget -N --no-check-certificate "http://download.qt.io/archive/qt/$QTVERSIONMAJOR/$QTVERSION/submodules/qtbase-opensource-src-$QTVERSION.zip"
wget -N --no-check-certificate "http://download.qt.io/archive/qt/$QTVERSIONMAJOR/$QTVERSION/submodules/qttools-opensource-src-$QTVERSION.zip"
wget -N --no-check-certificate "https://ftp.openssl.org/source/old/1.0.1/$OPENSSL.tar.gz"
wget -N --no-check-certificate "http://download.oracle.com/berkeley-db/$BERKELEYDB.tar.gz"
wget -N --no-check-certificate "http://downloads.sourceforge.net/project/boost/boost/$BOOSTVERSION/$BOOST.7z"
wget --no-check-certificate "http://miniupnp.tuxfamily.org/files/download.php?file=$MINIUPNPC.tar.gz" -O "$MINIUPNPC.tar.gz"
wget -N --no-check-certificate "http://download.sourceforge.net/libpng/$LIBPNG.tar.gz"
wget --no-check-certificate "https://github.com/google/protobuf/archive/v$PROTOBUF.tar.gz" -O "protobuf-$PROTOBUF.tar.gz"
wget -N --no-check-certificate "http://downloads.sourceforge.net/project/pkgconfiglite/$PKGCONFIGVERSION/$PKGCONFIGFILE"
wget -N --no-check-certificate "https://sourceforge.net/projects/scons/files/scons/$SCONSVERSION/scons-$SCONSVERSION.tar.gz"
wget -N --no-check-certificate "https://sourceforge.net/projects/nsis/files/NSIS $NSISVERSION/$NSISVERSION.$NSISSUBVERSION/nsis-$NSISVERSION.$NSISSUBVERSION.zip"
echo

echo Downloading coin source...
wget --no-check-certificate "$COINDOWNLOADPATH" -O "$COINARCHIVE"
echo

echo Downloading compiler...
wget -N --no-check-certificate "http://sourceforge.net/projects/mingw-w64/files/Toolchains targetting Win32/Personal Builds/mingw-builds/$MINGW64VERSION/threads-posix/dwarf/$MINGW64FILE"
echo                            

cd ..
"./downloadhashes_verify.sh"
