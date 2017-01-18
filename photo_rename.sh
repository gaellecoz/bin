#!/bin/bash

EXPECTED_ARGS=1
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: `basename $0` {name}"
  exit $E_BADARGS
fi

NAME=$1

# Rename everything lower case
# rename 's/JPG/jpgjpg/' *
# rename 's/jpgjpg/jpg/' *
# rename 's/NEF/nefnef/' *
# rename 's/nefnef/nef/' *
# rename 's/AVI/aviavi/' *
# rename 's/aviavi/avi/' *
# rename 's/MP4/mp4mp4/' *
# rename 's/mp4mp4/mp4/' *
# rename 's/MOV/movmov/' *
# rename 's/movmov/mov/' *
# rename 's/THM/thmthm/' *
# rename 's/thmthm/thm/' *
rename 'y/A-Z/a-z/' *

# Reaname the photos and rotate them if necessary
#jhead -autorot -n%Y-%m-%d_%H-%M-%S *.jpg *.JPG
jhead -autorot *.jpg *.jpeg
jhead -norot *.jpg *.jpeg
#exiv2 mv -F -r %Y-%m-%d_%H-%M-%S  *.jpg
#exiv2 mv -F -r %Y-%m-%d_%H-%M-%S  *.thm
#exiv2 mv -F -r %Y-%m-%d_%H-%M-%S  *.nef
exiftool -overwrite_original_in_place -d %Y-%m-%d_%H-%M-%S%%-c.%%e "-filename<CreateDate" *


rename 's/([0-9]{2}-[0-9]{2})\./$1_00./' *

# Rename file numbering from jhead
#rename 's/([0-9]{2}-[0-9]{2})a\./$1_01./' *
#rename 's/([0-9]{2}-[0-9]{2})b\./$1_02./' *
#rename 's/([0-9]{2}-[0-9]{2})c\./$1_03./' *
#rename 's/([0-9]{2}-[0-9]{2})d\./$1_04./' *
#rename 's/([0-9]{2}-[0-9]{2})e\./$1_05./' *
#rename 's/([0-9]{2}-[0-9]{2})f\./$1_06./' *
#rename 's/([0-9]{2}-[0-9]{2})g\./$1_07./' *
#rename 's/([0-9]{2}-[0-9]{2})h\./$1_08./' *
#rename 's/([0-9]{2}-[0-9]{2})i\./$1_09./' *

# Rename file numbering from exiv2
#rename 's/([0-9]{2}-[0-9]{2})_1\./$1_01./' *
#rename 's/([0-9]{2}-[0-9]{2})_2\./$1_02./' *
#rename 's/([0-9]{2}-[0-9]{2})_3\./$1_03./' *
#rename 's/([0-9]{2}-[0-9]{2})_4\./$1_04./' *
#rename 's/([0-9]{2}-[0-9]{2})_5\./$1_05./' *
#rename 's/([0-9]{2}-[0-9]{2})_6\./$1_06./' *
#rename 's/([0-9]{2}-[0-9]{2})_7\./$1_07./' *
#rename 's/([0-9]{2}-[0-9]{2})_8\./$1_08./' *
#rename 's/([0-9]{2}-[0-9]{2})_9\./$1_09./' *

# Rename file numbering from exiftool
rename 's/([0-9]{2}-[0-9]{2})-1\./$1_01./' *
rename 's/([0-9]{2}-[0-9]{2})-2\./$1_02./' *
rename 's/([0-9]{2}-[0-9]{2})-3\./$1_03./' *
rename 's/([0-9]{2}-[0-9]{2})-4\./$1_04./' *
rename 's/([0-9]{2}-[0-9]{2})-5\./$1_05./' *
rename 's/([0-9]{2}-[0-9]{2})-6\./$1_06./' *
rename 's/([0-9]{2}-[0-9]{2})-7\./$1_07./' *
rename 's/([0-9]{2}-[0-9]{2})-8\./$1_08./' *
rename 's/([0-9]{2}-[0-9]{2})-9\./$1_09./' *

# Rename with photographer's name
# rename 's/.nef/_gael.nef/' *.nef; rename 's/.jpg/_gael.jpg/' *.jpg; rename 's/.mp4/_gael.mp4/' *.mp4;
for fullfile in *; do
	filename=$(basename "$fullfile")
	extension="${filename##*.}"
	filename="${filename%.*}"

	NEW=$filename"_"${NAME}"."$extension
	mv "${fullfile}" "${NEW}"
done

exit 0
