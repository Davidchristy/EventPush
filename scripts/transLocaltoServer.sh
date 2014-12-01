#!/bin/bash
:'
This is a simple script to take the format used by tomcat on eclipse
and translates it to the format used tomcat on a server.
There is no debugging and no error checking, edit at your own risk.

There is two inputs the first being the folder that holds the files,
the second being the folder you want the files
'

indir=$1
outdir=$2

cp -fr $1/WebContent/* $outdir
cp -fr $1/build/classes/* $outdir/WEB-INF/classes/

