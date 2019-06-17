#! /bin/bash
export LANG=fr_FR.UTF-8
kill -SIGWINCH `echo $$` # pty seems initialized before the web page knows its size (https://www.linusakesson.net/programming/tty/)

bash << 'EOF'
clear

echo -n "Configuration de l'exercice... "
for pos in `seq 1 100` ; do
#  echo "expr substr '\\|/-' $pos 1"
  p=`expr $pos % 4 + 1`
  c=`expr substr '\\|/-' $p 1`
  printf " [$c]  "
  sleep 0.75s
  printf "\b\b\b\b\b\b"
  if [ -e /tmp/.katacoda-finished ] ; then
    rm -f /tmp/.katacoda-finished # So that waiting the next exercise works
    break
  fi
done
printf "    \b\b\b\b"
echo "fini."
echo "Votre environnement est prêt."
echo

hash -r
EOF

