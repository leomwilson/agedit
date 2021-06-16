#!/bin/sh

FNAME="/tmp/$(openssl rand -hex 32)"
test -f $FNAME && exit 1
touch $FNAME
chmod 600 $FNAME
test -f $1 && age --decrypt -i ~/.config/agedit/identity.txt $1 > $FNAME
$EDITOR $FNAME
age --encrypt -R ~/.config/agedit/recipients.txt $FNAME > $1
rm $FNAME
