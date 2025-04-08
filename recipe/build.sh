#!/bin/bash

# remove PKG_CFLAGS override
sed -i '/^PKG_CFLAGS="-I\/usr/d' configure

export DISABLE_AUTOBREW=1

# shellcheck disable=SC2086
${R} CMD INSTALL --build --configure-vars="INCLUDE_DIR=${PREFIX}/include LIB_DIR=${PREFIX}/lib" . ${R_ARGS}
