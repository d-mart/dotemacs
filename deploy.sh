#!/bin/bash

## Make links in home folder for .emacs and .emacs.d/
## A target directory may be specified, but defaults to ~
## Note: a one level deep backup will be created. Previous
##       backup will be overwritten
##

# Source dir is the dir where this script lives
SRC_DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

# Target Dir defaults to ~.  It might be changed by options
TARGET_DIR="$HOME"

print_usage() {
cat <<EOF
Deploy configuration to home folder via symlink, or optionally
hard copy to a specified directory (to experiment with plugins etc).

-t <dir>    change target directory (default: ~)
-c          copy .emacs and .emacs.d
-l          symlink .emacs and .emacs.d
-g <SHA>    specify a SHA or git ref to use
-x          launch emacs using new location of .emacs when finished

# To make a backup of ~/.emacs and ~/.emacs.d and symlink this 
# repo copy there
$ ./deploy.sh -s

# To copy the repo tree to another dir, making it if necessary
$ ./deploy.sh -c -t /tmp/emacs_test 

# To copy or symlink a specific SHA:
$ ./deploy.sh -g 983abc3f -c /tmp/old_config

EOF
}

# there must be at least one option to the script.
if [[ $# < 1 ]]
then
    print_usage
    exit 255
fi

OPTARG=""
LAUNCH="no"
# Process arguments
while getopts "hslct:g:" opt
do
    case $opt in
	l|s)
	    echo "Symlink"
	    MODE="symlink"
	    ;;
	c)
	    echo "Copy to $OPTARG"
	    MODE="copy"
	    ;;
	t)
	    TARGET_DIR="$OPTARG"
	    echo "Using $TARGET_DIR as destination"
	    mkdir -p $TARGET_DIR || exit $?
	    ;;
	g)
	    echo "Use SHA: $OPTARG"
	    SHA=$OPTARG
	    ;;
	x)
	    LAUNCH="yes"
	    ;;
	\?)
	    print_usage
	    exit 255
	    ;;
    esac
done


# Checkout SHA if specified.  Not a lot of error checking here
# If running on a dirty repo dir this could bonk.
if [ ! -z $SHA ] 
then
    pushd $SRC_DIR > /dev/null
    git checkout $SHA || exit $?

    # Pull in any git submodules 
    git submodule init
    git submodule update
    popd > /dev/null
fi

## Make backups and link new links or copies
# works if ~/.emacs is a file or simlink to a file.
[ -f "$TARGET_DIR/.emacs" ] && mv "$TARGET_DIR/.emacs" "$TARGET_DIR/.emacs.bak"

# works if .emacs.d is dir or simlink to dir
[ -d "$TARGET_DIR/.emacs.d" ] && mv "$TARGET_DIR/.emacs.d" "$TARGET_DIR/.emacs.d.bak"

case $MODE in
    copy)
	#cp -R "$SRC_DIR" "$TARGET_DIR"
	pushd $SRC_DIR >/dev/null
	tar cf - . | (cd $TARGET_DIR; tar xfp -)
	popd >/dev/null
	;;

    symlink)
	ln -s "$SRC_DIR/.emacs" "$TARGET_DIR/.emacs"
	ln -s "$SRC_DIR/.emacs.d" "$TARGET_DIR/.emacs.d"
	;;

    *)
	print_usage
	echo "You must specify at least -s or -c"
	;;
esac

# Create run string using new .emacs. 
# Then either display or run
EMACS=`command -v emacs`
if [ ! -z "$EMACS" ]
then
    EMACS_LAUNCH="$EMACS -l $TARGET_DIR/.emacs &"
    if [ "$LAUNCH" == "yes" ]
    then
	$EMACS_LAUNCH
    else
	echo "You can start emacs with the new config file like this"
	echo "\$ $EMACS_LAUNCH"
    fi
fi
