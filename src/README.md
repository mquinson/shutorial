# How does it work?

## Main scripts

Two scripts are provided:

* The `shutorial.sh` script is the main interface provided to the users.
  It is installed within the Docker and serves as an entry point.
  It takes the following sub-commands:

  - `shutorial run list`

  - `shutorial run <exo>`: Start the given exercise if it exists, or
    give the list of existing exercises if not. Press Ctrl-D to exit.

* The `compile.sh` is used at build time (when creating the Docker
  image) and not installed. It compiles the markdown assignments to HTML
  static pages, and the `setup.sharin` script templates into `setup.sh`
  scripts as explained below. It does not take any parameter.

## Exercise components

The assignment web pages are compiled from Markdown by an internal
python-markdown extension allowing to build javascript-controlled
quizzes. This mechanism (found in the `app/` directory and the
`compiler.py` script) is a bit crude as I'm not very good in Python and
rather bad in JavaScript. Any help is welcome.

The machinery of each exercise comes as a set of small shell scripts
that are injected within the chroot environment upon startup. The
script in charge of this injection is called `exo/??/setup.sh`. This
script is often compiled from a file called `exo/??/setup.sharin`.
These file can contain specific directives for the `compile.py`
script. For example in
[exo/usage/moving/setup.sharin](exo/usage/moving/setup.sharin), the
following line request the file `shtrl-check.sh` to be injected within
the chroot tree under `/usr/lib/shutorial/bin`.

```none
# SHTRL_INCLUDE shtrl-check.sh /usr/lib/shutorial/bin
```

In this case, the file is not really copied, but embedded in the
`setup.sh` file with `uuencode` and then decoded in place upon the
execution of the `setup.sh` script. Here is the corresponding chunk in
the `setup.sh` script:

```sh
# SHTRL_INCLUDE shtrl-check.sh /usr/lib/shutorial/bin
uudecode << 'SHTRL_INCLUDE_EOF' >
/usr/lib/shutorial/bin/shtrl-check.sh &&
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
SHTRL_INCLUDE_EOF
chmod 0755 /usr/lib/shutorial/bin/shtrl-check.sh
```


## License

2023-2025 Copyright Martin Quinson.

This tool is provided under the [GPLv3 license](LICENSE), or any
higher version of the GPL license.
