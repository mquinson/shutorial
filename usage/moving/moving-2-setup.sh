#! /bin/bash

cd
rm -rf *
for suffix in html pdf png ; do
  for name in `seq 1 30` ; do
    touch file-`printf "%02d" $name`.$suffix
  done
done
mkdir web

if tree > /dev/null ; then
  echo "tree already installed as asset"
else
  rm /usr/local/bin/tree
  apt-get update
  apt-get install -y tree
fi

touch /tmp/.kc_started
