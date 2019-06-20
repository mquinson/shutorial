#! /bin/sh

# THIS SCRIPT WAS GENERATED, DO NOT EDIT
# Real source: piping-check.sharin

if [ -e /etc/locale.gen ] && grep -q '# fr_FR.UTF-8 UTF-8' /etc/locale.gen ; then
   (apt update; apt -y install locales manpages-fr) 2>/dev/null >/dev/null
   sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
   dpkg-reconfigure --frontend=noninteractive locales  2>/dev/null >/dev/null
   update-locale LANG=fr_FR.UTF-8 2>/dev/null >/dev/null
fi


if [ -e animaux.ok ] ; then
# KCCOMMAND '$out' gets an opaque value
if which uuencode >/dev/null 2>/dev/null ; then :; else apt install sharutils 2>/dev/null >/dev/null; fi
uudecode << 'KCCOMMAND_EOF' > /tmp/.cmd
begin-base64 644 -
c29ydCAtdSBhbmltYXV4IHwgZGlmZiAtdSBhbmltYXV4Lm9rIC0K
====
KCCOMMAND_EOF
out=$(sh /tmp/.cmd)
# End of KCCOMMAND


  if [ $? -eq 0 ] ; then
    echo "Félicitations, la question 1 est réussie."
  else
    echo "Oups, votre fichier animaux.ok n'a pas le bon contenu. Différence constatée:"
    echo "$out"
    exit 1    
  fi
else
  echo "Oups, vous n'avez pas fait la question 1 (le fichier animaux.ok est introuvable)."
  exit 1
fi 

if [ -e ligne33 ] ; then
# KCCOMMAND '$out' gets an opaque value
uudecode << 'KCCOMMAND_EOF' > /tmp/.cmd
begin-base64 644 -
c29ydCAtdSBhbmltYXV4IHxoZWFkIC1uIDMzIHx0YWlsIC1uIDEgfCBkaWZm
IC11IGxpZ25lMzMgLQo=
====
KCCOMMAND_EOF
out=$(sh /tmp/.cmd)
# End of KCCOMMAND


  if [ $? -eq 0 ] ; then
    echo "Félicitations, la question 2 est réussie."
  else
    echo "Oups, votre fichier ligne33 n'a pas le bon contenu. Différence constatée:"
    echo "$out"
    exit 1
  fi
else
  echo "Oups, vous n'avez pas fait la question 2 (le fichier ligne33 est introuvable)."
  exit 1
fi 

echo "done"
rm -f /tmp/.cmd

echo done > /tmp/.katacoda-finished
