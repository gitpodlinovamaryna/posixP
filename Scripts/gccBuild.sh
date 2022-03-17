#!/usr/bin/env bash

GCC_BUILD_DIRECTORY="gcc-build"
mkdir $GCC_BUILD_DIRECTORY
cd $GCC_BUILD_DIRECTORY
../gcc-3.3.1/configure --prefix=/tools --with-local-prefix=/tools \ --disable-nls --enable-shared --enable-languages=c
make BOOT_LDFLAGS="-static" bootstrap
make install
ln -sf gcc /tools/bin/cc