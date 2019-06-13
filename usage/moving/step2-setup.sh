#! /bin/sh

cd 
rm -rf *
for suffix in html pdf png ; do
  for name in `seq 1 30` ; do
    touch file-`printf "%02d" $name`.$suffix
  done
done
mkdir web
