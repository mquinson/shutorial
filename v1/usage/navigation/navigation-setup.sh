#! /bin/sh

# THIS SCRIPT WAS GENERATED, DO NOT EDIT
# Real source: navigation-setup.sharin

if [ -e /etc/locale.gen ] && grep -q '# fr_FR.UTF-8 UTF-8' /etc/locale.gen ; then
   (apt update; apt -y install locales manpages-fr) 2>/dev/null >/dev/null
   sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
   dpkg-reconfigure --frontend=noninteractive locales  2>/dev/null >/dev/null
   update-locale LANG=fr_FR.UTF-8 2>/dev/null >/dev/null
fi


# KCINSTALL tree tree
if which tree >/dev/null 2>/dev/null || [ -e tree ] ; then :; else apt install tree 2>/dev/null >/dev/null; fi
# KCINCLUDE navigation-check.sh /usr/local/bin
if which uuencode >/dev/null 2>/dev/null ; then :; else apt install sharutils 2>/dev/null >/dev/null; fi
uudecode << 'KCINCLUDE_EOF' > /usr/local/bin/navigation-check.sh &&
begin-base64 644 -
IyEgL2Jpbi9zaAoKY2QgCnRyZWUgLW4gLS1ub3JlcG9ydCAtLWNoYXJzZXQg
YXNjaWkgfCBzZWQgJ3MvYC9cXC8nID4gL3RtcC8udHJlZS5nb3QKY2F0ID4g
L3RtcC8udHJlZS5leHBlY3QgPDxFT0YKLgp8LS0gZGlyMQp8ICAgXC0tIGRp
cjIKfCAgICAgICBcLS0gZG9jMQpcLS0gZGlyMwogICAgXC0tIGRvYzIKRU9G
CgpzeW5jCiMjIyMjIyMjIyMjIyMjIyMjIyMKCmlmICEgY21wIC90bXAvLnRy
ZWUuZ290IC90bXAvLnRyZWUuZXhwZWN0IDI+L2Rldi9udWxsOyB0aGVuCiAg
ICBkaWZmIC15IC90bXAvLnRyZWUuZ290IC90bXAvLnRyZWUuZXhwZWN0CiAg
ICBlY2hvICJFcnJldXI6IG9uIGRpcmFpdCBxdWUgdm91cyBuJ2F2ZXogbGEg
Ym9ubmUgYXJib3Jlc2NlbmNlIChhIGdhdWNoZTogY2UgcXVlIHZvdXMgYXZl
ejsgYSBkcm9pdGU6IGNlIHF1J2lsIGZhdXQpIgogICAgZXhpdCAxCmZpCgpl
Y2hvICJkb25lIgo=
====
KCINCLUDE_EOF
chmod 0755 /usr/local/bin/navigation-check.sh
# End of KCINCLUDE navigation-check.sh


rm -f /tmp/.cmd

echo done > /tmp/.katacoda-finished
