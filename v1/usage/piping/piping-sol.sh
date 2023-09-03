#! /bin/sh

# Q1
sort -u animaux > animaux.ok

# Q2
head -n 33 animaux.ok |tail -n 1 > ligne33

# Q3 is quizz
if [ $(grep '[aeiouy]\{3\}' animaux|sort -u|wc -l) -ne 18 ] ; then
  echo "Oups, l'exercice semble cassée car la réponse hardcodée dans l'énoncée n'est pas la bonne. Merci d'indiquer ce bug à Martin Quinson"
  exit 1
fi
