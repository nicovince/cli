#!/bin/sed -f
s/#/=/g
s/^\(=*\)\(.*\)/\1\2 \1/
