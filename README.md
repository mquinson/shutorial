# Welcome to the shutorial

This is the SHell Tutorial, an exerciser teaching the use of the shell
console, in practice. You will be given a set of assignments to be
solved in a Docker image (a sort of light virtual machine providing a
dedicated environment). Each assignment consists in a specific
environment setup in the chroot, a webpage presenting the assignment,
and a machinery to check your success in solving the assignment.

Each assignment comes with a set of practical questions, for which you
should write the right commands in the terminal to achieve a given
state, and some wrap-up quiz questions that you should answer in the
web page.

Everything runs locally on your Linux machine, without any remote web
application involved. The good thing is that everything remains local
with no privacy risk, provided that you have the Docker program
installed on your machine.

# How to use it?

Download the
[https://github.com/mquinson/shutorial/raw/refs/heads/master/shutorial](shutorial)
script on your disk. This needs to run from a terminal, with an extra
parameter. Move your terminal to the location where the script was
downloaded (or copy the script in your home directory), and type the
following:

```shell
./shutorial run intro
```

The terminal shall enter the shutorial environment. Click on the
depicted URL while holding Ctrl to open the right web page, and 
follow the instructions.

If you get an error about file permission, first make the script
executable as follows, and try again.

```shell
chmod +x shutorial 
```


## Provided exercises

Here is the list of exercises:

- intro: Introduction to the concept of shell, and the grammar of a command line.
- navigation: Creating files and directories (introducting pwd, ls, mkdir, rmdir, rm, cd, touch).
- moving: Moving files (introducting mv).
- globbing: Selecting many files together.
- viewing: Seeing files' content (introducting cat, head, tail, less).
- editing: Editing files (introducting nano, vi and emacs).
- searching: Searching files (introducting locate and find).
- grepping: Crawling files (introducting grep).
- piping: Redirecting I/O (introducting < > >> and |)
- seding: Editing streams on the fly (introducting sed)

More lessons are planned, on writing script files, using shell loops
and other such constructs. But I should probably improve the
infrastructure to translate the material before adding more exercises.

## License

2023-2025 Copyright Martin Quinson.

This tool is provided under the [GPLv3 license](LICENSE), or any
higher version of the GPL license.

# How does it work?

## Limitations

For now, every assignments are in French (because I'm reusing some
earlier material) while the machinery is in English. At some point, I
will setup an i18n infrastructure, so that everything becomes
available both in English, French, and other community-provided
languages.

The success per exercises are not saved anywhere yet, so you won't get
any nice shiny stars from this project. Any help in javascript toward
that direction would be welcome.

It is not really difficult to cheat on this system, but if you manage
to understand the logic of my scripts and cheat, then you don't need
no shell course anyway :)

## Exercise components

The assignment web pages are compiled from Markdown by an internal
python-markdown extension allowing to build javascript-controlled
quizzes. This mechanism (found in the `app/` directory and the
`compiler.py` script) is a bit crude as I'm not very good in Python and
rather bad in JavaScript. Any help is welcome, as usual.

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

## Main scripts

Two scripts are used to get the shutorial working.

The `shutorial` script is the main interface provided to the users.
It takes the following sub-commands:

- `shutorial run <exo>`: Start the given exercise if it exists, or
  give the list of existing exercises if not. Press Ctrl-D to exit.

The `compile.sh` is used at build time (when creating the Docker
image) and not installed. It compiles the markdown assignments to HTML
static pages, and the `setup.sharin` script templates into `setup.sh`
scripts. It does not take any parameter.

## Trouble shoting

When you start an exercise, you should get the following shell invite:

```none
SHuToRiaL:~ $

```

## Security concern

Running a Docker image is always dangerous, as its content may
compromise your system. The administrator of your system (you) shall
not allow this if they don't trust the image providor (me) or the user
(probably you too). If you trust yourself and me, we are good.

**Please do not install this in a school setting**, as the Docker
system may allow the students to gain root access on your system.
There is no such concern if you use it on your own system.

Of course, if you see any concern with this code, please submit a bug
report.
