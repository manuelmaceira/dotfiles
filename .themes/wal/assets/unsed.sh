#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#0d0f15/g' \
         -e 's/rgb(100%,100%,100%)/#b0bdcc/g' \
    -e 's/rgb(50%,0%,0%)/#0d0f15/g' \
     -e 's/rgb(0%,50%,0%)/#59585C/g' \
 -e 's/rgb(0%,50.196078%,0%)/#59585C/g' \
     -e 's/rgb(50%,0%,50%)/#0d0f15/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#0d0f15/g' \
     -e 's/rgb(0%,0%,50%)/#b0bdcc/g' \
	$@
