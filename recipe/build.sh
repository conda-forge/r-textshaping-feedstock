#!/bin/bash

# inject known flags
# see https://github.com/cran/textshaping/blob/d5d6ab428f5c9a8662ae2fb9964b5dec259616b5/configure#L15
sed -i "/^PKG_CFLAGS=/s|/usr/include|${PREFIX}/include|g" configure

export DISABLE_AUTOBREW=1

# shellcheck disable=SC2086
${R} CMD INSTALL --build --configure-vars="INCLUDE_DIR=${PREFIX}/include LIB_DIR=${PREFIX}/lib" . ${R_ARGS}
