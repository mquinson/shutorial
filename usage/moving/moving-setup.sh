#! /bin/bash

cd
mkdir -p dir1/dir2
printf "This is the content of doc1.\n">  dir1/dir2/doc1
mkdir dir3
printf "This is the content of doc2.\n">  dir3/doc2
mkdir truc
touch machin toto

if tree > /dev/null ; then
  echo "tree already installed as asset"
else
  rm /usr/local/bin/tree
  apt-get update
  apt-get install -y tree
fi

touch /tmp/.kc_started
