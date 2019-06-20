#! /bin/sh

# THIS SCRIPT WAS GENERATED, DO NOT EDIT
# Real source: seding-check.sharin

if [ -e /etc/locale.gen ] && grep -q '# fr_FR.UTF-8 UTF-8' /etc/locale.gen ; then
   (apt update; apt -y install locales manpages-fr) 2>/dev/null >/dev/null
   sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
   dpkg-reconfigure --frontend=noninteractive locales  2>/dev/null >/dev/null
   update-locale LANG=fr_FR.UTF-8 2>/dev/null >/dev/null
fi


if [ -e deux_ans-sans_o ] ; then
# KCCOMMAND '$out' gets an opaque value
if which uuencode >/dev/null 2>/dev/null ; then :; else apt install sharutils 2>/dev/null >/dev/null; fi
uudecode << 'KCCOMMAND_EOF' > /tmp/.cmd
begin-base64 644 -
c2VkICdzL28vL2cnIENlX3NpZWNsZV9hdmFpdF9kZXV4X2Fucy50eHQgfCBk
aWZmIC11IGRldXhfYW5zLXNhbnNfbyAtCg==
====
KCCOMMAND_EOF
out=$(sh /tmp/.cmd)
# End of KCCOMMAND


  if [ $? -eq 0 ] ; then
    echo "Félicitations, la question 1 est réussie."
  else
    echo "Oups, votre fichier deux_ans-sans_o n'a pas le bon contenu. Différence constatée:"
    echo "$out"
    exit 1    
  fi
else
  echo "Oups, vous n'avez pas fait la question 1 (le fichier deux_ans-sans_o est introuvable)."
  exit 1
fi 

if [ -e deux_ans-sans_voyelle ] ; then
# KCCOMMAND '$out' gets an opaque value
uudecode << 'KCCOMMAND_EOF' > /tmp/.cmd
begin-base64 644 -
KGhlYWQgLW4gLTEgQ2Vfc2llY2xlX2F2YWl0X2RldXhfYW5zLnR4dCB8IHNl
ZCAncy9bYWVpb3V5XS8vZycgO3RhaWwgLW4gMSBDZV9zaWVjbGVfYXZhaXRf
ZGV1eF9hbnMudHh0KSB8IGRpZmYgLXUgZGV1eF9hbnMtc2Fuc192b3llbGxl
IC0K
====
KCCOMMAND_EOF
out=$(sh /tmp/.cmd)
# End of KCCOMMAND


  if [ $? -eq 0 ] ; then
    echo "Félicitations, la question 2 est réussie."
  else
    echo "Oups, votre fichier deux_ans-sans_voyelle n'a pas le bon contenu. Différence constatée:"
    echo "$out"
    exit 1
  fi
else
  echo "Oups, vous n'avez pas fait la question 2 (le fichier deux_ans-sans_voyelle est introuvable)."
  exit 1
fi 

if [ -e deux_ans-poil_aux_dents ] ; then
# KCCOMMAND '$out' gets an opaque value
uudecode << 'KCCOMMAND_EOF' > /tmp/.cmd
begin-base64 644 -
c2VkICdzL1woW3Jmdl1vaVt0eHNdXClcKFssLiA7XSpcKSQvXDEgKHBvaWwg
YXV4IGRvaWd0cylcMi8nIENlX3NpZWNsZV9hdmFpdF9kZXV4X2Fucy50eHR8
c2VkICdzL1wobmVlXClcKFssLiA7XSpcKSQvXDEgKHBvaWwgYXUgbmV6KVwy
Lyd8c2VkICdzL1woZXJcKVwoWywuIDshXSpcKSQvXDEgKHBvaWwgYXUgbmV6
KVwyLycgfCBkaWZmIC11IGRldXhfYW5zLXBvaWxfYXV4X2RlbnRzIC0K
====
KCCOMMAND_EOF
out=$(sh /tmp/.cmd)
# End of KCCOMMAND

  if [ $? -eq 0 ] ; then
    echo "Félicitations, la question 3 est réussie."
  else
    echo "Oups, votre fichier deux_ans-poil_aux_dents n'a pas le bon contenu. Différence constatée:"
    echo "$out"
    exit 1
  fi
else
  echo "Oups, vous n'avez pas fait la question 3 (le fichier deux_ans-poil_aux_dents est introuvable)."
  exit 1
fi 

echo "done"
rm -f /tmp/.cmd

echo done > /tmp/.katacoda-finished
