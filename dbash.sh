#!/bin/bash

[ -z "$DBASH_DIR" ] && DBASH_DIR="~/.dbash"
source $DBASH_DIR/utils.sh
source $DBASH_DIR/cat.sh
source $DBASH_DIR/grep.sh
source $DBASH_DIR/head.sh
source $DBASH_DIR/wc.sh
source $DBASH_DIR/tail.sh

_is_64bit()
{
    echo ${BASH_VERSINFO[5]} | dgrep 'x86_64' > /dev/null
    return $?
}