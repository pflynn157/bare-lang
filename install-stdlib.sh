#!/bin/bash

LIB_INSTALL=/usr/local/lib/barelang
INCLUDE_INSTALL=/usr/local/include/barelang

if [[ ! -d $LIB_INSTALL ]] ; then
    sudo mkdir -p $LIB_INSTALL
fi

if [[ ! -d $INCLUDE_INSTALL ]] ; then
    sudo mkdir -p $INCLUDE_INSTALL
fi

as lib/x64_start.asm -o build/bl_start.o

sudo cp build/bl_start.o $LIB_INSTALL
sudo cp build/lib/libbarelang.a /usr/lib

sudo cp -r lib/include/* $INCLUDE_INSTALL

sudo ldconfig

echo "Done"

