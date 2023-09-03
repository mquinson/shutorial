#! /bin/bash

# THIS SCRIPT WAS GENERATED, DO NOT EDIT
# Real source: moving-2-setup.sharin

if [ -e /etc/locale.gen ] && grep -q '# fr_FR.UTF-8 UTF-8' /etc/locale.gen ; then
   (apt update; apt -y install locales manpages-fr) 2>/dev/null >/dev/null
   sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
   dpkg-reconfigure --frontend=noninteractive locales  2>/dev/null >/dev/null
   update-locale LANG=fr_FR.UTF-8 2>/dev/null >/dev/null
fi


cd

## KCINSTALL tree tree
if which tree >/dev/null 2>/dev/null || [ -e tree ] ; then :; else apt install tree 2>/dev/null >/dev/null; fi

## KCINCLUDE step2-check.sh /usr/local/bin
if which uuencode >/dev/null 2>/dev/null ; then :; else apt install sharutils 2>/dev/null >/dev/null; fi
uudecode << 'KCINCLUDE_EOF' > /usr/local/bin/step2-check.sh &&
begin-base64 644 -
IyEgL2Jpbi9zaAoKY2QgCnRyZWUgLW4gLS1ub3JlcG9ydCAtLWNoYXJzZXQg
YXNjaWkgfCBzZWQgJ3MvYC9cXC8nID4gL3RtcC8udHJlZS5nb3QKY2F0ID4g
L3RtcC8udHJlZS5leHBlY3QgPDxFT0YKLgp8LS0gaW1hZ2UKfCAgIHwtLSBm
aWxlLTAxLnBuZwp8ICAgfC0tIGZpbGUtMDIucG5nCnwgICB8LS0gZmlsZS0w
My5wbmcKfCAgIHwtLSBmaWxlLTA0LnBuZwp8ICAgfC0tIGZpbGUtMDUucG5n
CnwgICB8LS0gZmlsZS0wNi5wbmcKfCAgIHwtLSBmaWxlLTA3LnBuZwp8ICAg
fC0tIGZpbGUtMDgucG5nCnwgICB8LS0gZmlsZS0wOS5wbmcKfCAgIHwtLSBm
aWxlLTEwLnBuZwp8ICAgfC0tIGZpbGUtMTEucG5nCnwgICB8LS0gZmlsZS0x
Mi5wbmcKfCAgIHwtLSBmaWxlLTEzLnBuZwp8ICAgfC0tIGZpbGUtMTQucG5n
CnwgICB8LS0gZmlsZS0xNS5wbmcKfCAgIHwtLSBmaWxlLTE2LnBuZwp8ICAg
fC0tIGZpbGUtMTcucG5nCnwgICB8LS0gZmlsZS0xOC5wbmcKfCAgIHwtLSBm
aWxlLTE5LnBuZwp8ICAgfC0tIGZpbGUtMjAucG5nCnwgICB8LS0gZmlsZS0y
MS5wbmcKfCAgIHwtLSBmaWxlLTIyLnBuZwp8ICAgfC0tIGZpbGUtMjMucG5n
CnwgICB8LS0gZmlsZS0yNC5wbmcKfCAgIHwtLSBmaWxlLTI1LnBuZwp8ICAg
fC0tIGZpbGUtMjYucG5nCnwgICB8LS0gZmlsZS0yNy5wbmcKfCAgIHwtLSBm
aWxlLTI4LnBuZwp8ICAgfC0tIGZpbGUtMjkucG5nCnwgICBcLS0gZmlsZS0z
MC5wbmcKfC0tIHByaW50CnwgICB8LS0gZmlsZS0wMS5wZGYKfCAgIHwtLSBm
aWxlLTAyLnBkZgp8ICAgfC0tIGZpbGUtMDMucGRmCnwgICB8LS0gZmlsZS0w
NC5wZGYKfCAgIHwtLSBmaWxlLTA1LnBkZgp8ICAgfC0tIGZpbGUtMDYucGRm
CnwgICB8LS0gZmlsZS0wNy5wZGYKfCAgIHwtLSBmaWxlLTA4LnBkZgp8ICAg
fC0tIGZpbGUtMDkucGRmCnwgICB8LS0gZmlsZS0xMC5wZGYKfCAgIHwtLSBm
aWxlLTExLnBkZgp8ICAgfC0tIGZpbGUtMTIucGRmCnwgICB8LS0gZmlsZS0x
My5wZGYKfCAgIHwtLSBmaWxlLTE0LnBkZgp8ICAgfC0tIGZpbGUtMTUucGRm
CnwgICB8LS0gZmlsZS0xNi5wZGYKfCAgIHwtLSBmaWxlLTE3LnBkZgp8ICAg
fC0tIGZpbGUtMTgucGRmCnwgICB8LS0gZmlsZS0xOS5wZGYKfCAgIHwtLSBm
aWxlLTIwLnBkZgp8ICAgfC0tIGZpbGUtMjEucGRmCnwgICB8LS0gZmlsZS0y
Mi5wZGYKfCAgIHwtLSBmaWxlLTIzLnBkZgp8ICAgfC0tIGZpbGUtMjQucGRm
CnwgICB8LS0gZmlsZS0yNS5wZGYKfCAgIHwtLSBmaWxlLTI2LnBkZgp8ICAg
fC0tIGZpbGUtMjcucGRmCnwgICB8LS0gZmlsZS0yOC5wZGYKfCAgIHwtLSBm
aWxlLTI5LnBkZgp8ICAgXC0tIGZpbGUtMzAucGRmClwtLSB3ZWIKICAgIHwt
LSBmaWxlLTAxLmh0bWwKICAgIHwtLSBmaWxlLTAyLmh0bWwKICAgIHwtLSBm
aWxlLTAzLmh0bWwKICAgIHwtLSBmaWxlLTA0Lmh0bWwKICAgIHwtLSBmaWxl
LTA1Lmh0bWwKICAgIHwtLSBmaWxlLTA2Lmh0bWwKICAgIHwtLSBmaWxlLTA3
Lmh0bWwKICAgIHwtLSBmaWxlLTA4Lmh0bWwKICAgIHwtLSBmaWxlLTA5Lmh0
bWwKICAgIHwtLSBmaWxlLTEwLmh0bWwKICAgIHwtLSBmaWxlLTExLmh0bWwK
ICAgIHwtLSBmaWxlLTEyLmh0bWwKICAgIHwtLSBmaWxlLTEzLmh0bWwKICAg
IHwtLSBmaWxlLTE0Lmh0bWwKICAgIHwtLSBmaWxlLTE1Lmh0bWwKICAgIHwt
LSBmaWxlLTE2Lmh0bWwKICAgIHwtLSBmaWxlLTE3Lmh0bWwKICAgIHwtLSBm
aWxlLTE4Lmh0bWwKICAgIHwtLSBmaWxlLTE5Lmh0bWwKICAgIHwtLSBmaWxl
LTIwLmh0bWwKICAgIHwtLSBmaWxlLTIxLmh0bWwKICAgIHwtLSBmaWxlLTIy
Lmh0bWwKICAgIHwtLSBmaWxlLTIzLmh0bWwKICAgIHwtLSBmaWxlLTI0Lmh0
bWwKICAgIHwtLSBmaWxlLTI1Lmh0bWwKICAgIHwtLSBmaWxlLTI2Lmh0bWwK
ICAgIHwtLSBmaWxlLTI3Lmh0bWwKICAgIHwtLSBmaWxlLTI4Lmh0bWwKICAg
IHwtLSBmaWxlLTI5Lmh0bWwKICAgIFwtLSBmaWxlLTMwLmh0bWwKRU9GCgoj
IyMjIyMjIyMjIyMjIyMjIyMjCgppZiAhIGNtcCAvdG1wLy50cmVlLmdvdCAv
dG1wLy50cmVlLmV4cGVjdCA7IHRoZW4KICAgIGRpZmYgLXkgL3RtcC8udHJl
ZS5nb3QgL3RtcC8udHJlZS5leHBlY3QKICAgIGVjaG8gIkVycmV1cjogb24g
ZGlyYWl0IHF1ZSB2b3VzIG4nYXZleiBsYSBib25uZSBhcmJvcmVzY2VuY2Ug
KGEgZ2F1Y2hlOiBjZSBxdWUgdm91cyBhdmV6OyBhIGRyb2l0ZTogY2UgcXUn
aWwgZmF1dCkiCiAgICBleGl0IDEKZmkKCmVjaG8gImRvbmUiCg==
====
KCINCLUDE_EOF
chmod 0755 /usr/local/bin/step2-check.sh
# End of KCINCLUDE step2-check.sh


## KCINCLUDE step2-setup.sh /usr/local/bin
uudecode << 'KCINCLUDE_EOF' > /usr/local/bin/step2-setup.sh &&
begin-base64 644 -
IyEgL2Jpbi9zaAoKY2QgCnJtIC1yZiAqCmZvciBzdWZmaXggaW4gaHRtbCBw
ZGYgcG5nIDsgZG8KICBmb3IgbmFtZSBpbiBgc2VxIDEgMzBgIDsgZG8KICAg
IHRvdWNoIGZpbGUtYHByaW50ZiAiJTAyZCIgJG5hbWVgLiRzdWZmaXgKICBk
b25lCmRvbmUKbWtkaXIgd2ViCg==
====
KCINCLUDE_EOF
chmod 0755 /usr/local/bin/step2-setup.sh
# End of KCINCLUDE step2-setup.sh


step2-setup.sh

touch /tmp/.kc_started

rm -f /tmp/.cmd

echo done > /tmp/.katacoda-finished