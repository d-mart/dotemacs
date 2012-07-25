#!/bin/bash

## Make links in home folder for .emacs and .emacs.d/
## Note: a one level deep backup will be created. Previous
##       backup will be overwritten

SRC_DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
TARGET_DIR="$HOME"

# Pull in any git submodules 
pushd $SRC_DIR > /dev/null
git submodule init
git submodule update
popd

# works if ~/.emacs is a file or simlink to a file.
[ -f "$TARGET_DIR/.emacs" ] && mv "$TARGET_DIR/.emacs" "$TARGET_DIR/.emacs.bak"
ln -s "$SRC_DIR/.emacs" "$TARGET_DIR/.emacs"

# works if .emacs.d is dir or simlink to dir
[ -d "$TARGET_DIR/.emacs.d" ] && mv "$TARGET_DIR/.emacs.d" "$TARGET_DIR/.emacs.d.bak"
ln -s "$SRC_DIR/.emacs.d" "$TARGET_DIR/.emacs.d"

