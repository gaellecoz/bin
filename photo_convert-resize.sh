#!/bin/bash


# Check for proper number of command line args.

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: `basename $0` {size} {quality}"
  exit $E_BADARGS
fi

rm -rf thumbnails
mkdir thumbnails
for image in *.jpg; do
convert $image -interlace Plane -adaptive-resize $1x$1 -quality $2 ./thumbnails/thumb_$image
done


exit 0
