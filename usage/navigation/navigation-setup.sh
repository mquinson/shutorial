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
ZWUuZ290IC90bXAvLnRyZWUuZXhwZWN0IDsgdGhlbgogICAgZGlmZiAteSAv
dG1wLy50cmVlLmdvdCAvdG1wLy50cmVlLmV4cGVjdAogICAgZWNobyAiRXJy
ZXVyOiBvbiBkaXJhaXQgcXVlIHZvdXMgbidhdmV6IGxhIGJvbm5lIGFyYm9y
ZXNjZW5jZSAoYSBnYXVjaGU6IGNlIHF1ZSB2b3VzIGF2ZXo7IGEgZHJvaXRl
OiBjZSBxdSdpbCBmYXV0KSIKICAgIGV4aXQgMQpmaQoKZWNobyAiZG9uZSIK
====
KCINCLUDE_EOF
chmod 0755 /usr/local/bin/navigation-check.sh
# End of KCINCLUDE navigation-check.sh

