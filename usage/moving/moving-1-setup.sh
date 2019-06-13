#! /bin/bash

# THIS SCRIPT WAS GENERATED, DO NOT EDIT
# Real source: moving-1-setup.sharin

(apt update; apt -y install locales manpages-fr) 2>/dev/null >/dev/null
sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
dpkg-reconfigure --frontend=noninteractive locales
update-locale LANG=fr_FR.UTF-8


cd

## KCINSTALL tree tree
if which tree >/dev/null 2>/dev/null || [ -e tree ] ; then :; else apt install tree 2>/dev/null >/dev/null; fi

## KCINCLUDE step1-check.sh /usr/local/bin
if which uuencode >/dev/null 2>/dev/null ; then :; else apt install sharutils 2>/dev/null >/dev/null; fi
uudecode << 'KCINCLUDE_EOF' > /usr/local/bin/step1-check.sh &&
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
chmod 0755 /usr/local/bin/step1-check.sh
# End of KCINCLUDE step1-check.sh


## KCINCLUDE step1-setup.sh /usr/local/bin
uudecode << 'KCINCLUDE_EOF' > /usr/local/bin/step1-setup.sh &&
begin-base64 644 -
IyEgL2Jpbi9zaAoKY2QKcm0gLXJmICoKbWtkaXIgLXAgZGlyMS9kaXIyCnBy
aW50ZiAiVGhpcyBpcyB0aGUgY29udGVudCBvZiBkb2MxLlxuIj4gIGRpcjEv
ZGlyMi9kb2MxCm1rZGlyIGRpcjMKcHJpbnRmICJUaGlzIGlzIHRoZSBjb250
ZW50IG9mIGRvYzIuXG4iPiAgZGlyMy9kb2MyCm1rZGlyIHRydWMKdG91Y2gg
bWFjaGluIHRvdG8K
====
KCINCLUDE_EOF
chmod 0755 /usr/local/bin/step1-setup.sh
# End of KCINCLUDE step1-setup.sh


step1-setup.sh

touch /tmp/.kc_started

echo done > /tmp/.katacoda-finished