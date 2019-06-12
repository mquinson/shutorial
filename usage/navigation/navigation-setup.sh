#! /bin/sh

# THIS SCRIPT WAS GENERATED, DO NOT EDIT
# Real source: navigation-setup.sharin
if which uuencode >/dev/null 2>/dev/null ; then pass; else (apt update;apt install sharutils) 2>/dev/null >/dev/null; fi

# KCINCLUDE navigation-check.sh /usr/local/bin
uudecode << KCINCLUDE_EOF > /usr/local/bin/navigation-check.sh &&
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

