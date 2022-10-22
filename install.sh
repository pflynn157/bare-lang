#!/bin/bash

if [ "$EUID" -ne 0 ] ; then
    echo "Error: Please run as root."
    exit 1
fi

echo "Installing..."

if [[ ! -f build/src/blc ]] ; then
    echo "Error: The compiler does not seem to be built."
    echo ""
    exit 1
fi

./install-stdlib.sh

install ./build/src/blc /usr/local/bin/blc

echo "Done"

exit 0
