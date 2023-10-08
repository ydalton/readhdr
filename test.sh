#!/bin/sh
#
# Copyright (c) 2023 ydalton
#
# POSIX compliance test suite for readhdr

set -- bash dash

retval=0

for CHOSEN_SHELL in $@
do
	echo "Now testing $CHOSEN_SHELL..."
	echo "Testing whether invoking without arguments works..."
	$CHOSEN_SHELL ./readhdr > /dev/null
	echo "Testing whether the \"argument\" works..."
	$CHOSEN_SHELL ./readhdr --help > /dev/null
	echo "Testing whether reading a file works..."
	$CHOSEN_SHELL ./readhdr stdio.h > /dev/null
	echo "Testing whether reading and searching a file works..."
	$CHOSEN_SHELL ./readhdr stdio.h FILE > /dev/null
	echo "Testing whether an extra argument fails..."
	$CHOSEN_SHELL ./readhdr stdio.h FILE foo > /dev/null
	echo "Testing whether reading a directory fails..."
	$CHOSEN_SHELL ./readhdr sys > /dev/null
done

echo "All done!"
exit 0
