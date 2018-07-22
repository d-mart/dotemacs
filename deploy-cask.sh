#!/bin/bash

set -e

# Source dir is the dir where this script lives
SRC_DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

# Target Dir defaults to ~.  It might be changed by options
TARGET_DIR="$HOME"
CASK_INSTALL_DIR="${HOME}/.cask"
CASK_BIN="${CASK_INSTALL_DIR}/bin/cask"

# TODO maybe parameterize this
EMACS_SETTINGS_DIR="${HOME}/.emacs.d"
CASK_STORAGE_DIR="${EMACS_SETTINGS_DIR}/.cask"

#
# clean existing cask files
#
test -d "$CASK_STORAGE_DIR" && rm -rf "$CASK_STORAGE_DIR"

#
# update or clone cask
#
if [ -d "$CASK_INSTALL_DIR" ]; then
  (cd "$CASK_INSTALL_DIR";
   git pull)
else
  git clone https://github.com/cask/cask "$CASK_INSTALL_DIR"
fi

#
# install deps for cask itself
#
(cd "$CASK_INSTALL_DIR";
 "$CASK_BIN")

#
# install pacakges for use in emacs
#
(cd "$EMACS_SETTINGS_DIR";
"${CASK_BIN}")

echo Done.
