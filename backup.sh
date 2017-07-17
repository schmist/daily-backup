#!/bin/bash

# keeping last n backups
keep=3

# generate date and time as name
name="$(date '+%Y%m%d_%H%M').tar.gz"

# backup src folder to dst folder
src=$1
dst=$2

# archive copy and remove intermediate
tar cpzf /tmp/$name $src
cp /tmp/$name $dst
rm /tmp/$name

# list (sorted by last modification) files and delete excess copies 
ls -t1 $dst | tail -n +$((keep+1)) | xargs -ri rm $dst/{}
