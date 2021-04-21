
ZLIB_VERSION=1.2.11
PREFIX=`pwd`

DIRECTORY="zlib-${ZLIB_VERSION}"

if [ ! -d "$DIRECTORY" ]; then
  echo "Download source code"
  wget https://zlib.net/zlib-${ZLIB_VERSION}.tar.gz
  tar xf zlib-${ZLIB_VERSION}.tar.gz
fi

mkdir lib
mkdir include
cd zlib-${ZLIB_VERSION}

echo "Configure"
CHOST=wasix wasix-configure ./configure
wasix-make make -j

cp libz.a ${PREFIX}/lib
cp zlib.h zconf.h ${PREFIX}/include
cp minigzip.wasm ${PREFIX}
cp minigzip64.wasm ${PREFIX}

echo "Done"
