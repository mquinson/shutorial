#! /bin/sh

echo "Entrez deux nombres séparés par une espace: "
read a b

if echo $a $b | grep -q '[^[:digit:][:space:]]' ; then
  echo "Veuillez n'utiliser que des chiffres." >&2
else
  echo "Le résultat est: "
  echo $((a + b))
fi
