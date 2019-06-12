#! /bin/bash

# THIS SCRIPT WAS GENERATED, DO NOT EDIT
# Real source: moving-1-setup.sharin
if which uuencode >/dev/null 2>/dev/null ; then :; else (apt update;apt install sharutils) 2>/dev/null >/dev/null; fi
if which tree >/dev/null 2>/dev/null ; then :; else (apt update;apt install tree) 2>/dev/null >/dev/null; fi

cd
mkdir -p dir1/dir2
printf "This is the content of doc1.\n">  dir1/dir2/doc1
mkdir dir3
printf "This is the content of doc2.\n">  dir3/doc2
mkdir truc
touch machin toto

## KCINCLUDE moving-1-check.sh /usr/local/bin
uudecode << 'KCINCLUDE_EOF' > /usr/local/bin/moving-1-check.sh &&
begin-base64 644 -
IyEgL2Jpbi9zaAoKY2QgCnRyZWUgLW4gLS1ub3JlcG9ydCAtLWNoYXJzZXQg
YXNjaWkgfCBzZWQgJ3MvYC9cXC8nID4gL3RtcC8udHJlZS5nb3QKY2F0ID4g
L3RtcC8udHJlZS5leHBlY3QgPDxFT0YKLgp8LS0gRElSMQp8ICAgXC0tIERJ
UjIKfCAgICAgICBcLS0gRE9DMQpcLS0gRElSMwogICAgXC0tIERPQzIKRU9G
CgpjYXQgPiAvdG1wLy5tZDVzdW0uZXhwZWN0IDw8RU9GCjk0NWMwYTdjYzI4
ZDY3NWY1MDc1MzM2NTc2M2UzOTJlICBESVIxL0RJUjIvRE9DMQo3N2Y1Nzk5
MDlkNTBjOWM5YzFmYmJjNTAwYzFjOTBhMiAgRElSMy9ET0MyCkVPRgoKc3lu
YwojIyMjIyMjIyMjIyMjIyMjIyMjCgppZiAhIGNtcCAvdG1wLy50cmVlLmdv
dCAvdG1wLy50cmVlLmV4cGVjdCA7IHRoZW4KICAgIGRpZmYgLXkgL3RtcC8u
dHJlZS5nb3QgL3RtcC8udHJlZS5leHBlY3QKICAgIGVjaG8gIkVycmV1cjog
b24gZGlyYWl0IHF1ZSB2b3VzIG4nYXZleiBsYSBib25uZSBhcmJvcmVzY2Vu
Y2UgKGEgZ2F1Y2hlOiBjZSBxdWUgdm91cyBhdmV6OyBhIGRyb2l0ZTogY2Ug
cXUnaWwgZmF1dCkiCiAgICBleGl0IDEKZmkKCmlmICEgbWQ1c3VtIC1jIC90
bXAvLm1kNXN1bS5leHBlY3QgOyB0aGVuCiAgICBlY2hvICJFcnJvcjogb24g
ZGlyYWl0IHF1ZSB2b3MgZmljaGllcnMgRElSMS9ESVIyL0RPQzEgZXQgRElS
My9ET0MyIG4nb250IHBhcyBsZSBib24gY29udGVudS4iCiAgICBleGl0IDEK
ZmkKCmVjaG8gImRvbmUiCg==
====
KCINCLUDE_EOF
chmod 0755 /usr/local/bin/moving-1-check.sh
# End of KCINCLUDE moving-1-check.sh


if tree > /dev/null ; then
  echo "tree already installed as asset"
else
  rm /usr/local/bin/tree
  apt-get update
  apt-get install -y tree
fi

touch /tmp/.kc_started

echo done > /tmp/.katacoda-finished