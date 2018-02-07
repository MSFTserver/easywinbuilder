echo Building daemon and qt...
echo $COINFOLDER



cd $COINFOLDER/src/leveldb
TARGET_OS=NATIVE_WINDOWS make libleveldb.a libmemenv.a
if [ ${?} -ne 0 ]; then echo "leveldb failed."; read -n 1 -s; exit 1;fi


cd $EWBPATH

cp exp_buzzcoin.pro $COINFOLDER/buzzcoin.pro
cp exp_makefile.mingw $COINFOLDER/src/makefile.mingw

cd $COINFOLDER/src

make -f makefile.mingw
if [ ${?} -ne 0 ]; then echo "coind failed."; read -n 1 -s; exit 1;fi


cd $EWBPATH
cd $COINFOLDER
export PATH=$PATH:$QTPATH

qmake "USE_IPV6=1" "USE_ASM=1" buzzcoin.pro
if [ ${?} -ne 0 ]; then echo "qmake wallet failed."; read -n 1 -s; exit 1;fi

mingw32-make -f Makefile.Release
if [ ${?} -ne 0 ]; then echo "qt wallet failed."; read -n 1 -s; exit 1;fi

strip ./src/*.exe
strip ./release/*.exe
