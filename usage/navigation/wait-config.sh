#! /bin/bash
bash << 'EOF'
clear

echo -n "Configuring exercise... "
for pos in `seq 1 100` ; do
#  echo "expr substr '\\|/-' $pos 1"
  p=`expr $pos % 4 + 1`
  c=`expr substr '\\|/-' $p 1`
  printf " [$c]  "
  sleep 0.75s
  printf "\b\b\b\b\b\b"
  if [ -e /tmp/.katacoda-finished ] ; then
    break
  fi
done
printf "    \b\b\b\b"
echo "done."

hash -r
EOF

