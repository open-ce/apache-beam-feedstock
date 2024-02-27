#!/usr/bin/env bash

ARCH=`uname -p`
if [[ "${ARCH}" == 'ppc64le' ]]; then
    # remove -fno-plt as it causes failure with numpy installation
    # https://github.com/numpy/numpy/issues/25436
    export CXXFLAGS="$(echo ${CXXFLAGS} | sed -e 's/ -fno-plt//')"
    export CFLAGS="$(echo ${CFLAGS} | sed -e 's/ -fno-plt//')"
fi

$PYTHON -m pip install --no-deps --ignore-installed . --verbose
