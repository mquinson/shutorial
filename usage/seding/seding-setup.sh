#! /bin/sh

# THIS SCRIPT WAS GENERATED, DO NOT EDIT
# Real source: seding-setup.sharin

if [ -e /etc/locale.gen ] && grep -q '# fr_FR.UTF-8 UTF-8' /etc/locale.gen ; then
   (apt update; apt -y install locales manpages-fr) 2>/dev/null >/dev/null
   sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
   dpkg-reconfigure --frontend=noninteractive locales  2>/dev/null >/dev/null
   update-locale LANG=fr_FR.UTF-8 2>/dev/null >/dev/null
fi


# KCCLEAN
cd; if [ "x$PWD" = "x/root" ] ; then rm -rf * ; fi

# KCINCLUDE Ce_siecle_avait_deux_ans.txt /root
if which uuencode >/dev/null 2>/dev/null ; then :; else apt install sharutils 2>/dev/null >/dev/null; fi
uudecode << 'KCINCLUDE_EOF' > /root/Ce_siecle_avait_deux_ans.txt &&
begin-base64 644 -
Q2Ugc2llY2xlIGF2YWl0IGRldXggYW5zICEgUm9tZSByZW1wbGFjYWl0IFNw
YXJ0ZSwKRGVqYSBOYXBvbGVvbiBwZXJjYWl0IHNvdXMgQm9uYXBhcnRlLApF
dCBkdSBwcmVtaWVyIGNvbnN1bCwgZGVqYSwgcGFyIG1haW50IGVuZHJvaXQs
CkxlIGZyb250IGRlIGwnZW1wZXJldXIgYnJpc2FpdCBsZSBtYXNxdWUgZXRy
b2l0LgpBbG9ycyBkYW5zIEJlc2FuY29uLCB2aWVpbGxlIHZpbGxlIGVzcGFn
bm9sZSwKSmV0ZSBjb21tZSBsYSBncmFpbmUgYXUgZ3JlIGRlIGwnYWlyIHF1
aSB2b2xlLApOYXF1aXQgZCd1biBzYW5nIGJyZXRvbiBldCBsb3JyYWluIGEg
bGEgZm9pcwpVbiBlbmZhbnQgc2FucyBjb3VsZXVyLCBzYW5zIHJlZ2FyZCBl
dCBzYW5zIHZvaXggOwpTaSBkZWJpbGUgcXUnaWwgZnV0LCBhaW5zaSBxdSd1
bmUgY2hpbWVyZSwKQWJhbmRvbm5lIGRlIHRvdXMsIGV4Y2VwdGUgZGUgc2Eg
bWVyZSwKRXQgcXVlIHNvbiBjb3UgcGxveWUgY29tbWUgdW4gZnJlbGUgcm9z
ZWF1CkZpdCBmYWlyZSBlbiBtZW1lIHRlbXBzIHNhIGJpZXJlIGV0IHNvbiBi
ZXJjZWF1LgpDZXQgZW5mYW50IHF1ZSBsYSB2aWUgZWZmYWNhaXQgZGUgc29u
IGxpdnJlLApFdCBxdWkgbidhdmFpdCBwYXMgbWVtZSB1biBsZW5kZW1haW4g
YSB2aXZyZSwKQydlc3QgbW9pLiAtLSBKZSB2b3VzIGRpcmFpIHBldXQtZXRy
ZSBxdWVscXVlIGpvdXIKUXVlbCBsYWl0IHB1ciwgcXVlIGRlIHNvaW5zLCBx
dWUgZGUgdm9ldXgsIHF1ZSBkJ2Ftb3VyLApQcm9kaWd1ZXMgcG91ciBtYSB2
aWUgZW4gbmFpc3NhbnQgY29uZGFtbmVlLApNJ29udCBmYWl0IGRldXggZm9p
cyBsJ2VuZmFudCBkZSBtYSBtZXJlIG9ic3RpbmVlLApBbmdlIHF1aSBzdXIg
dHJvaXMgZmlscyBhdHRhY2hlcyBhIHNlcyBwYXMKZXBhbmRhaXQgc29uIGFt
b3VyIGV0IG5lIG1lc3VyYWl0IHBhcyAhCgpPIGwnYW1vdXIgZCd1bmUgbWVy
ZSAhIGFtb3VyIHF1ZSBudWwgbidvdWJsaWUgIQpQYWluIG1lcnZlaWxsZXV4
IHF1J3VuIERpZXUgcGFydGFnZSBldCBtdWx0aXBsaWUgIQpUYWJsZSB0b3Vq
b3VycyBzZXJ2aWUgYXUgcGF0ZXJuZWwgZm95ZXIgIQpDaGFjdW4gZW4gYSBz
YSBwYXJ0IGV0IHRvdXMgbCdvbnQgdG91dCBlbnRpZXIgIQoKWy4uLl0KCiAg
ICAgICAgQ2Ugc2llY2xlIGF2YWl0IGRldXggYW5zLCBWaWN0b3IgSHVnbywg
MTkwOS4K
====
KCINCLUDE_EOF
chmod 0644 /root/Ce_siecle_avait_deux_ans.txt
# End of KCINCLUDE Ce_siecle_avait_deux_ans.txt


chmod -w Ce_siecle_avait_deux_ans.txt 

# KCINCLUDE seding-check.sh /usr/local/bin
uudecode << 'KCINCLUDE_EOF' > /usr/local/bin/seding-check.sh &&
begin-base64 644 -
IyEgL2Jpbi9zaAoKIyBUSElTIFNDUklQVCBXQVMgR0VORVJBVEVELCBETyBO
T1QgRURJVAojIFJlYWwgc291cmNlOiBzZWRpbmctY2hlY2suc2hhcmluCgpp
ZiBbIC1lIC9ldGMvbG9jYWxlLmdlbiBdICYmIGdyZXAgLXEgJyMgZnJfRlIu
VVRGLTggVVRGLTgnIC9ldGMvbG9jYWxlLmdlbiA7IHRoZW4KICAgKGFwdCB1
cGRhdGU7IGFwdCAteSBpbnN0YWxsIGxvY2FsZXMgbWFucGFnZXMtZnIpIDI+
L2Rldi9udWxsID4vZGV2L251bGwKICAgc2VkIC1pIC1lICdzLyMgZnJfRlIu
VVRGLTggVVRGLTgvZnJfRlIuVVRGLTggVVRGLTgvJyAvZXRjL2xvY2FsZS5n
ZW4KICAgZHBrZy1yZWNvbmZpZ3VyZSAtLWZyb250ZW5kPW5vbmludGVyYWN0
aXZlIGxvY2FsZXMgIDI+L2Rldi9udWxsID4vZGV2L251bGwKICAgdXBkYXRl
LWxvY2FsZSBMQU5HPWZyX0ZSLlVURi04IDI+L2Rldi9udWxsID4vZGV2L251
bGwKZmkKCgppZiBbIC1lIGRldXhfYW5zLXNhbnNfbyBdwqA7IHRoZW4KI8Kg
S0NDT01NQU5EICckb3V0JyBnZXRzIGFuIG9wYXF1ZSB2YWx1ZQppZiB3aGlj
aCB1dWVuY29kZSA+L2Rldi9udWxsIDI+L2Rldi9udWxsIDsgdGhlbiA6OyBl
bHNlIGFwdCBpbnN0YWxsIHNoYXJ1dGlscyAyPi9kZXYvbnVsbCA+L2Rldi9u
dWxsOyBmaQp1dWRlY29kZSA8PCAnS0NDT01NQU5EX0VPRicgPiAvdG1wLy5j
bWQKYmVnaW4tYmFzZTY0IDY0NCAtCmMyVmtJQ2R6TDI4dkwyY25JRU5sWDNO
cFpXTnNaVjloZG1GcGRGOWtaWFY0WDJGdWN5NTBlSFFnZkNCawphV1ptSUMx
MUlHUmxkWGhmWVc1ekxYTmhibk5mYnlBdENnPT0KPT09PQpLQ0NPTU1BTkRf
RU9GCm91dD0kKHNoIC90bXAvLmNtZCkKIyBFbmQgb2YgS0NDT01NQU5ECgoK
ICBpZiBbICQ/IC1lcSAwIF0gOyB0aGVuCiAgICBlY2hvICJGw6lsaWNpdGF0
aW9ucywgbGEgcXVlc3Rpb24gMSBlc3QgcsOpdXNzaWUuIgogIGVsc2UKICAg
IGVjaG8gIk91cHMsIHZvdHJlIGZpY2hpZXIgZGV1eF9hbnMtc2Fuc19vIG4n
YSBwYXMgbGUgYm9uIGNvbnRlbnUuIERpZmbDqXJlbmNlIGNvbnN0YXTDqWU6
IgogICAgZWNobyAiJG91dCIKICAgIGV4aXQgMSAgICAKICBmaQplbHNlCiAg
ZWNobyAiT3Vwcywgdm91cyBuJ2F2ZXogcGFzIGZhaXQgbGEgcXVlc3Rpb24g
MSAobGUgZmljaGllciBkZXV4X2Fucy1zYW5zX28gZXN0IGludHJvdXZhYmxl
KS4iCiAgZXhpdCAxCmZpIAoKaWYgWyAtZSBkZXV4X2Fucy1zYW5zX3ZveWVs
bGUgXcKgOyB0aGVuCiPCoEtDQ09NTUFORCAnJG91dCcgZ2V0cyBhbiBvcGFx
dWUgdmFsdWUKdXVkZWNvZGUgPDwgJ0tDQ09NTUFORF9FT0YnID4gL3RtcC8u
Y21kCmJlZ2luLWJhc2U2NCA2NDQgLQpLR2hsWVdRZ0xXNGdMVEVnUTJWZmMy
bGxZMnhsWDJGMllXbDBYMlJsZFhoZllXNXpMblI0ZENCOElITmwKWkNBbmN5
OWJZV1ZwYjNWNVhTOHZaeWNnTzNSaGFXd2dMVzRnTVNCRFpWOXphV1ZqYkdW
ZllYWmhhWFJmClpHVjFlRjloYm5NdWRIaDBLU0I4SUdScFptWWdMWFVnWkdW
MWVGOWhibk10YzJGdWMxOTJiM2xsYkd4bApJQzBLCj09PT0KS0NDT01NQU5E
X0VPRgpvdXQ9JChzaCAvdG1wLy5jbWQpCiMgRW5kIG9mIEtDQ09NTUFORAoK
CiAgaWYgWyAkPyAtZXEgMCBdIDsgdGhlbgogICAgZWNobyAiRsOpbGljaXRh
dGlvbnMsIGxhIHF1ZXN0aW9uIDIgZXN0IHLDqXVzc2llLiIKICBlbHNlCiAg
ICBlY2hvICJPdXBzLCB2b3RyZSBmaWNoaWVyIGRldXhfYW5zLXNhbnNfdm95
ZWxsZSBuJ2EgcGFzIGxlIGJvbiBjb250ZW51LiBEaWZmw6lyZW5jZSBjb25z
dGF0w6llOiIKICAgIGVjaG8gIiRvdXQiCiAgICBleGl0IDEKICBmaQplbHNl
CiAgZWNobyAiT3Vwcywgdm91cyBuJ2F2ZXogcGFzIGZhaXQgbGEgcXVlc3Rp
b24gMiAobGUgZmljaGllciBkZXV4X2Fucy1zYW5zX3ZveWVsbGUgZXN0IGlu
dHJvdXZhYmxlKS4iCiAgZXhpdCAxCmZpIAoKaWYgWyAtZSBkZXV4X2Fucy1w
b2lsX2F1eF9kZW50cyBdwqA7IHRoZW4KI8KgS0NDT01NQU5EICckb3V0JyBn
ZXRzIGFuIG9wYXF1ZSB2YWx1ZQp1dWRlY29kZSA8PCAnS0NDT01NQU5EX0VP
RicgPiAvdG1wLy5jbWQKYmVnaW4tYmFzZTY0IDY0NCAtCmMyVmtJQ2R6TDF3
b1czSm1kbDF2YVZ0MGVITmRYQ2xjS0Zzc0xpQTdYU3BjS1NRdlhERWdLSEJ2
YVd3ZwpZWFY0SUdSdmFXZDBjeWxjTWk4bklFTmxYM05wWldOc1pWOWhkbUZw
ZEY5a1pYVjRYMkZ1Y3k1MGVIUjgKYzJWa0lDZHpMMXdvYm1WbFhDbGNLRnNz
TGlBN1hTcGNLU1F2WERFZ0tIQnZhV3dnWVhVZ2JtVjZLVnd5Ckx5ZDhjMlZr
SUNkekwxd29aWEpjS1Z3b1d5d3VJRHNoWFNwY0tTUXZYREVnS0hCdmFXd2dZ
WFVnYm1WNgpLVnd5THljZ2ZDQmthV1ptSUMxMUlHUmxkWGhmWVc1ekxYQnZh
V3hmWVhWNFgyUmxiblJ6SUMwSwo9PT09CktDQ09NTUFORF9FT0YKb3V0PSQo
c2ggL3RtcC8uY21kKQojIEVuZCBvZiBLQ0NPTU1BTkQKCiAgaWYgWyAkPyAt
ZXEgMCBdIDsgdGhlbgogICAgZWNobyAiRsOpbGljaXRhdGlvbnMsIGxhIHF1
ZXN0aW9uIDMgZXN0IHLDqXVzc2llLiIKICBlbHNlCiAgICBlY2hvICJPdXBz
LCB2b3RyZSBmaWNoaWVyIGRldXhfYW5zLXBvaWxfYXV4X2RlbnRzIG4nYSBw
YXMgbGUgYm9uIGNvbnRlbnUuIERpZmbDqXJlbmNlIGNvbnN0YXTDqWU6Igog
ICAgZWNobyAiJG91dCIKICAgIGV4aXQgMQogIGZpCmVsc2UKICBlY2hvICJP
dXBzLCB2b3VzIG4nYXZleiBwYXMgZmFpdCBsYSBxdWVzdGlvbiAzIChsZSBm
aWNoaWVyIGRldXhfYW5zLXBvaWxfYXV4X2RlbnRzIGVzdCBpbnRyb3V2YWJs
ZSkuIgogIGV4aXQgMQpmaSAKCmlmIFsgLWUgZGV1eF9hbnMtcm90MTMgXcKg
OyB0aGVuCiPCoEtDQ09NTUFORCAnJG91dCcgZ2V0cyBhbiBvcGFxdWUgdmFs
dWUKdXVkZWNvZGUgPDwgJ0tDQ09NTUFORF9FT0YnID4gL3RtcC8uY21kCmJl
Z2luLWJhc2U2NCA2NDQgLQpkSElnVzJFdGVrRXRXbDBnVzI0dGVtRXRiVTR0
V2tFdFRWMGdQRU5sWDNOcFpXTnNaVjloZG1GcGRGOWsKWlhWNFgyRnVjeTUw
ZUhRZ2ZDQmthV1ptSUMxMUlHUmxkWGhmWVc1ekxYSnZkREV6SUMwSwo9PT09
CktDQ09NTUFORF9FT0YKb3V0PSQoc2ggL3RtcC8uY21kKQojIEVuZCBvZiBL
Q0NPTU1BTkQKCiAgaWYgWyAkPyAtZXEgMCBdIDsgdGhlbgogICAgZWNobyAi
RsOpbGljaXRhdGlvbnMsIGxhIHF1ZXN0aW9uIDQgZXN0IHLDqXVzc2llLiIK
ICBlbHNlCiAgICBlY2hvICJPdXBzLCB2b3RyZSBmaWNoaWVyIGRldXhfYW5z
LXJvdDEzIG4nYSBwYXMgbGUgYm9uIGNvbnRlbnUuIERpZmbDqXJlbmNlIGNv
bnN0YXTDqWU6IgogICAgZWNobyAiJG91dCIKICAgIGV4aXQgMQogIGZpCmVs
c2UKICBlY2hvICJPdXBzLCB2b3VzIG4nYXZleiBwYXMgZmFpdCBsYSBxdWVz
dGlvbiA0IChsZSBmaWNoaWVyIGRldXhfYW5zLXJvdDEzIGVzdCBpbnRyb3V2
YWJsZSkuIgogIGV4aXQgMQpmaSAKCgppZiBbIC1lIDdfbGlnbmVzLnR4dCBd
wqA7IHRoZW4KI8KgS0NDT01NQU5EICckb3V0JyBnZXRzIGFuIG9wYXF1ZSB2
YWx1ZQp1dWRlY29kZSA8PCAnS0NDT01NQU5EX0VPRicgPiAvdG1wLy5jbWQK
YmVnaW4tYmFzZTY0IDY0NCAtClkyRjBJQ0pUWlhCMElHUW5kVzRnWTI5MWND
NTBlSFFpSUh3Z2RISWdKMXh1SnlBbk9TZDhjMlZrSUMxbApJQ2R6THprNUwx
eHVMMmNuSUMxbElDZHpMemtnTDF4dUlDOW5KeUF0WlNBbmN5ODVKQzljYmk4
bklDMWwKSUNkekx6a3ZJQzluSnlBdFpTQW5jeTljS0Z0Yk9tRnNiblZ0T2ww
c0xsMGdYQ2tnS2k5Y01TOW5KeUI4CklHUnBabVlnTFhVZ04xOXNhV2R1WlhN
dWRIaDBJQzBLCj09PT0KS0NDT01NQU5EX0VPRgpvdXQ9JChzaCAvdG1wLy5j
bWQpCiMgRW5kIG9mIEtDQ09NTUFORAoKICBpZiBbICQ/IC1lcSAwIF0gOyB0
aGVuCiAgICBlY2hvICJGw6lsaWNpdGF0aW9ucywgbGEgcXVlc3Rpb24gNSBl
c3QgcsOpdXNzaWUuIgogIGVsc2UKICAgIGVjaG8gIk91cHMsIHZvdHJlIGZp
Y2hpZXIgN19saWduZXMudHh0IG4nYSBwYXMgbGUgYm9uIGNvbnRlbnUuIERp
ZmbDqXJlbmNlIGNvbnN0YXTDqWU6IgogICAgZWNobyAiJG91dCIKICAgIGV4
aXQgMQogIGZpCmVsc2UKICBlY2hvICJPdXBzLCB2b3VzIG4nYXZleiBwYXMg
ZmFpdCBsYSBxdWVzdGlvbiA1IChsZSBmaWNoaWVyIDdfbGlnbmVzLnR4dCBl
c3QgaW50cm91dmFibGUpLiIKICBleGl0IDEKZmkgCgoKZWNobyAiZG9uZSIK
CnJtIC1mIC90bXAvLmNtZAoKZWNobyBkb25lID4gL3RtcC8ua2F0YWNvZGEt
ZmluaXNoZWQK
====
KCINCLUDE_EOF
chmod 0700 /usr/local/bin/seding-check.sh
# End of KCINCLUDE seding-check.sh

# KCINCLUDE Sept_dun_coup.txt /root
uudecode << 'KCINCLUDE_EOF' > /root/Sept_dun_coup.txt &&
begin-base64 644 -
VW4gdGFpbGxldXIgc2UgcHLDqXBhcmUgIMOgIG1hbmdlciB1bmUgdGFydGlu
ZSBkZSBtYXJtZWxhZGUsICBtYWlzIGVsbGUgYXR0aXJlIGxlcwptb3VjaGVz
LiBMZSB0YWlsbGV1ciwgZXhjw6lkw6ksICBmcmFwcGUgZGFucyBsZSB0YXMg
YXZlYyB1bmUgIHBpw6hjZSBkJ8OpdG9mZmUgZXQgZW4KdHVlIHNlcHQgZCd1
biAgY291cC4gUG91ciBtYXJxdWVyIGNldCAgZXhwbG9pdCwgaWwgc2UgZmFi
cmlxdWUgIHVuZSBjZWludHVyZSBzdXIKbGFxdWVsbGUgaWwgYnJvZGUgbGVz
ICBtb3RzIDogwqsgU2VwdCBkJ3VuIGNvdXAgwrsuIFN0aW11bMOpICBwYXIg
c29uIGhhdXQgZmFpdCwgaWwKcGFydCBkYW5zICBsZSBtb25kZSwgZMOpY2lk
w6kgw6AgIHJlbGV2ZXIgdG91cyBsZXMgIGTDqWZpcy4gSWwgcGFydCBhdmVj
LCAgZW4gcG9jaGUsCnNldWxlbWVudCB1biBmcm9tYWdlIGV0IHVuIG9pc2Vh
dS4KCkxlIHRhaWxsZXVyIHJlbmNvbnRyZSB1biBnw6lhbnQgcXVpLCBlbiAg
dm95YW50IHNhIGNlaW50dXJlLCBzJ2ltYWdpbmUgcXVlIMKrIFNlcHQKZCd1
biBjb3VwICDCuyBmYWl0IHLDqWbDqXJlbmNlIMOgICBzZXB0IGhvbW1lcy4g
TGUgIGfDqWFudCBkw6ljaWRlIGFsb3JzIGRlICBtZXR0cmUgbGUKdGFpbGxl
dXIgw6AgbCfDqXByZXV2ZS4gUXVhbmQgbGUgZ8OpYW50IHByZW5kICB1bmUg
cGllcnJlIGV0IGxhIHNlcnJlIHNpIGZvcnQgcXUnaWwKZW4gZmFpdCAgc29y
dGlyIGRlIGwnZWF1LCBsZSAgdGFpbGxldXIgc29ydCBkZSAgc2EgcG9jaGUg
bGUgZnJvbWFnZSwgIHF1J2lsIGZhaXQKcGFzc2VyIHBvdXIgdW5lIHBpZXJy
ZSwgZXQgbGUgcHJlc3NlIGRlIGZhw6dvbiDDoCBsZSBmYWlyZSBzdWludGVy
LiBMZSBnw6lhbnQgbGFuY2UKdW5lIHBpZXJyZSBsb2luIGRhbnMgIGxlcyBh
aXJzLCBtYWlzIGVsbGUgZmluaXQgcGFyIHJldG9tYmVyICA7IGxlIHRhaWxs
ZXVyIHNvcnQKZGUgc2EgIHBvY2hlIGwnb2lzZWF1LCBxdSdpbCAgZmFpdCBw
YXNzZXIgIHBvdXIgdW5lIHBpZXJyZSwgIGxlIGxhbmNlLCBldCAgaWwgbmUK
cmV0b21iZSBqYW1haXMuIExlICBnw6lhbnQgZMOpZmllIGVuc3VpdGUgbGUg
dGFpbGxldXIgZGUgIGwnYWlkZXIgw6AgdHJhbnNwb3J0ZXIgdW4KYXJicmUu
IExlIHRhaWxsZXVyIHMnYXJyYW5nZSBwb3VyIGRldm9pciBwb3J0ZXIgbGVz
IGJyYW5jaGVzIHRhbmRpcyBxdWUgbGUgZ8OpYW50CnBvcnRlcmEgbGUgIHRy
b25jIG1haXMsIGVuIGZhaXQsICBhdSBsaWV1IGRlICBwb3J0ZXIgbGVzIGJy
YW5jaGVzLCBpbCAgbW9udGUgc3VyCmwnYXJicmUsIGRlICBzb3J0ZSBxdWUg
bGUgIGfDqWFudCBwb3J0ZSBub24gIHNldWxlbWVudCBsJ2FyYnJlIG1haXMg
IMOpZ2FsZW1lbnQgbGUKdGFpbGxldXIuIExlIHBldGl0IGhvbW1lIHLDqXVz
c2l0IGVuZmluIMOgIGZhaXJlIGNyb2lyZSBhdSBnw6lhbnQgcXUnaWwgcGV1
dCBzYXV0ZXIKcGFyLWRlc3N1cyB1biBhcmJyZSwgY2UgcXVlIGxlIGfDqWFu
dCB0ZW50ZSBkZSBmYWlyZSwgbWFpcyBzYW5zIHkgcGFydmVuaXIuCgpMZSBn
w6lhbnQgIGVtbcOobmUgZW5zdWl0ZSBsZSAgdGFpbGxldXIgZGFucyBzb24g
IGFudHJlLCBvw7kgdml2ZW50ICBhdXNzaSBkJ2F1dHJlcwpnw6lhbnRzLiBW
ZXJzICBtaW51aXQsIGxlICBnw6lhbnQgZXNzYXllIGRlICB0dWVyIGxlIHBl
dGl0ICBob21tZSBlbiAgYWJhdHRhbnQgdW5lCmJhcnJlIGRlICBmZXIgc3Vy
ICBzb24gbGl0LCAgbWFpcyBsZSB0YWlsbGV1ciwgIHRyb3V2YW50IHNvbiAg
bGl0IHRyb3AgIGdyYW5kLCBhCnByw6lmw6lyw6kgZG9ybWlyICBibG90dGkg
ZGFucyB1biAgY29pbiBkZSBsYSBjaGFtYnJlLiAgTGUgbGVuZGVtYWluLCBl
biAgdm95YW50IGxlCnRhaWxsZXVyIHRvdWpvdXJzIGVuIHZpZSwgbGVzIGF1
dHJlcyBnw6lhbnRzLCBlZmZyYXnDqXMsIHByZW5uZW50IGxhIGZ1aXRlLgoK
TGUgcsOpY2l0IGRlcyBleHBsb2l0cyAgZHUgdGFpbGxldXIgcGFydmllbnQg
YXV4IG9yZWlsbGVzIGR1ICByb2ksIHF1aSBsJ2VuZ2FnZSDDoApzb24gc2Vy
dmljZS4gQ2VwZW5kYW50LCBsZXMgYXV0cmVzIHNvbGRhdHMgY3JhaWduZW50
IHF1ZSBsZSB0YWlsbGV1ciBuZSBwZXJkZSB1bgpqb3VyIHNvbiBzYW5nLWZy
b2lkIGV0ICBxdSdpbCBmYXNzZSBhbG9ycyBww6lyaXIgc2VwdCBkJ2VudHJl
ICBldXggw6AgY2hhcXVlIGNvdXAuCklscyBkaXNlbnQgYXUgIHJvaSBxdSdp
bHMgcGFydGlyb250IHNpICBsZSB0YWlsbGV1ciByZXN0ZS4gRGUgcGV1ciAg
cXVlIGxlIHBldGl0CmhvbW1lIG5lIGxlIHR1ZSBzJ2lsIGxlIGTDqW1ldCAg
ZGUgc2VzIGZvbmN0aW9ucywgbGUgcm9pIGwnZW52b2llIGTDqWZpZXIgZCdh
dXRyZXMKZ8OpYW50cyBlbiBsdWkgcHJvbWV0dGFudCwgIHMnaWwgcsOpdXNz
aXQsIGRlIGx1aSBvZmZyaXIgbGEgIG1vaXRpw6kgZGUgc29uIHJveWF1bWUK
ZXQgbGEgIG1haW4gZGUgc2EgZmlsbGUuICBMZSB0YWlsbGV1ciB0cm91dmUg
IGRldXggZ8OpYW50cyBlbmRvcm1pcyBhdSAgcGllZCBkJ3VuCmFyYnJlLCBt
b250ZSAgc3VyIGwnYXJicmUgIGV0IGxhaXNzZSAgdG9tYmVyIGRlcyBwaWVy
cmVzICBzdXIgZXV4LiAgQ2hhY3VuIGQnZXV4CmNyb2l0ICBxdWUgIGMnZXN0
ICBsJ2F1dHJlICBxdWkgIGwnYWdhY2UuICAgSWxzICBzZSAgYmF0dGVudCAg
ZXQgIGZpbmlzc2VudCAgcGFyCnMnZW50cmV0dWVyLiBMZSAgcm9pIGVudm9p
ZSAgbGUgdGFpbGxldXIgIGNhcHR1cmVyIHVuZSAgbGljb3JuZS4gTGUgIHRh
aWxsZXVyIGVuCnRyb3V2ZSAgdW5lLCBzZSAgbWV0IGRldmFudCAgdW4gYXJi
cmUgIGV0IGluY2l0ZSAgbGEgY3LDqWF0dXJlICDDoCBsZSAgY2hhcmdlci4g
QXUKZGVybmllciBtb21lbnQsICBpbCBmYWl0ICB1biBwYXMgIGRlIGPDtHTD
qSwgZXQgIGxhIGxpY29ybmUgIHBsYW50ZSBzYSAgY29ybmUgZGFucwpsJ2Fy
YnJlICBldCAgcmVzdGUgY29pbmPDqWUuICBMZSAgcm9pICBlbnZvaWUgIGVu
c3VpdGUgIGxlIHRhaWxsZXVyICBjYXB0dXJlciAgdW4Kc2FuZ2xpZXIsIG1h
aXMgbGUgdGFpbGxldXIgcsOpdXNzaXQgw6AgZW5mZXJtZXIgbCdhbmltYWwg
ZGFucyB1bmUgY2hhcGVsbGUuCgpMZSAgcm9pIGVzdCAgZmluYWxlbWVudCAg
YmllbiBvYmxpZ8OpICBkZSAgZG9ubmVyICBsYSBtb2l0acOpICBkZSAgc29u
IHJveWF1bWUgIGF1CnRhaWxsZXVyLCBsZXF1ZWwgcGV1dCBhdXNzaSAgw6lw
b3VzZXIgbGEgZmlsbGUgZHUgcm9pLiBUYW5kaXMgIHF1J2VsbGUgZXN0IGF1
IGxpdAphdmVjIHNvbiAgbWFyaSwgbGEgIGZpbGxlIGR1IHJvaSAgbCdlbnRl
bmQgcGFybGVyIGRhbnMgIHNvbiBzb21tZWlsICBldCBjb21wcmVuZApxdSdp
bCBuJ2VzdCBxdSd1biAgc2ltcGxlIHRhaWxsZXVyLiBMZSByb2kgZMOpY2lk
ZSBkJ2Vudm95ZXIgIGRlcyBob21tZXMgY2FwdHVyZXIKc29uIGdlbmRyZSB0
YW5kaXMgcXUnaWwgZG9ydCwgcG91ciBsJ2VtYmFycXVlciBzdXIgdW4gbmF2
aXJlLiBQcsOpdmVudSBkdSBjb21wbG90CnBhciAgc29uIMOpY3V5ZXIgIGZp
ZMOobGUsIGV0ICBhbG9ycyBxdWUgIGxlcyBzZXJ2aXRldXJzICBkdSByb2kg
IHNvbnQgcHLDqHMgIGRlIHNhCmNoYW1icmUsIGxlIHRhaWxsZXVyIGZhaXQg
IHNlbWJsYW50IGRlIGRvcm1pciBldCBkZSBwYXJsZXIgIGRhbnMgc29uIHNv
bW1laWwsIGV0CmlsIGRpdCBxdWUgYydlc3QgYmllbiBsdWkgcXVpIGEgIHLD
qWFsaXPDqSB0b3VzIGNlcyBleHBsb2l0cyBldCBxdSdpbCBuJ2EgcGFzIHBl
dXIKZGVzIGhvbW1lcyBjYWNow6lzICBkZXJyacOocmUgbGEgcG9ydGUuIExl
cyBzZXJ2aXRldXJzLCAgdGVycmlmacOpcywgcydlbmZ1aWVudCwgZXQKcGx1
cyBqYW1haXMgcGFyIGxhIHN1aXRlIGxlIHBldGl0IHRhaWxsZXVyLCBkZXZl
bnUgcm9pLCBuZSBzZXJhIGVubnV5w6kuCgogICAgICAgUsOpc3Vtw6kgZHUg
Y29udGUgwqtMZSBWYWlsbGFudCBQZXRpdCBUYWlsbGV1csK7IGRlcyBmcsOo
cmVzIEdyaW1tIChDQy1CWS1TQSkuCiAgICAgICAgICAgICAgICAgICAgICAg
IGh0dHBzOi8vZnIud2lraXBlZGlhLm9yZy93aWtpL0xlX1ZhaWxsYW50X1Bl
dGl0X1RhaWxsZXVyCg==
====
KCINCLUDE_EOF
chmod 0644 /root/Sept_dun_coup.txt
# End of KCINCLUDE Sept_dun_coup.txt


mv Sept_dun_coup.txt "Sept d'un coup.txt"
rm -f /tmp/.cmd

echo done > /tmp/.katacoda-finished
