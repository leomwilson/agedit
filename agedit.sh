#!/bin/sh

FNAME="/tmp/$(openssl rand -hex 32)"
# TODO: regenerate file name properly
test -f $FNAME && exit 1
touch $FNAME
chmod 600 $FNAME
age --decrypt -i ~/.config/agedit/identity.txt $1 > $FNAME
$EDITOR $FNAME
age --encrypt -R ~/.config/agedit/recipients.txt $FNAME > $1
rm $FNAME
