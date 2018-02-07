echo Building daemon and qt...
echo $COINFOLDER



cd $COINFOLDER/src/leveldb
TARGET_OS=NATIVE_WINDOWS make libleveldb.a libmemenv.a
if [ ${?} -ne 0 ]; then echo "leveldb failed."; read -n 1 -s; exit 1;fi




cp exp_buzzcoin.pro $COINFOLDER/buzzcoin.pro
cp exp_makefile.mingw $COINFOLDER/src/makefile.mingw



if [ ${?} -ne 0 ]; then echo "client configure failed."; read -n 1 -s; exit 1;fi

#make
mingw32-make
if [ ${?} -ne 0 ]; then echo "client make failed."; read -n 1 -s; exit 1;fi

strip ./src/*.exe
strip ./src/qt/*.exe
