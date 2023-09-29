# Welcome to the shutorial

This is the SHell Tutorial, an exerciser teaching the use of the shell
console, in practice. You will be given a set of assignments to be
solved in a chroot (a sort of light virtual machine providing a
dedicated environment). Each assignment consists in a specific
environment setup in the chroot, a webpage presenting the assignment,
and a machinery to check your success in solving the assignment.

Each assignment comes with a set of practical questions, for which you
should write the right commands in the terminal to achieve a given
state, and some wrap-up quiz questions that you should answer in the
web page.

Everything runs locally on your Linux machine, without any remote web
application involved. The good thing is that everything remains local
with no privacy risk, and the bad thing is that you must install the
package on your machine, which only works on Debian and derivatives
for now.

# How to use it?

## Installation

### Debian

Typing `make debian` from the main directory will build a Debian
package that you can then install with `dpkg -i shutorial_*deb`.

You may need to install the build dependencies for this to work:

```sh
sudo apt install debhelper-compat python3 python3-markdown python3-markupsafe python3-jinja2 sharutils
```

### ArchLinux

Typing `make arch-linux` from the main directory will build an arch package.
You can then install it with `pacman -U shutorial-*.pkg.tar.xz`.

You will need a working `yay` installation to build the package because the `mmdebstrap` package is not in the official repositories. [Here](https://github.com/Jguer/yay#installation) is how to install `yay`.

Everything is installed and configured automatically but, if needed, you can install the package manually.

The following packages are installed as dependencies:

```sh
yay -S mmdebstrap
```

```sh
pacman -S schroot squashfs-tools
```

And the following packages are only needed for building the package:

```sh
pacman -S python-markdown python-markupsafe python-jinja sharutils
```

### Important note

Note that this code is still rather young. You probably don't want to
install it on a shared computer before reading this whole page, and at
least glancing over the source code. I believe that it's safe to use
this tool, but it uses mechanisms that can hurt when shooting in your
foot.

## Running

Once installed, you only need to type `shutorial run intro` in a
terminal to start the first exercise. The terminal will enter the
shutorial environment, and a web page will pop up with the
assignment explanation. Just follow the instructions from there.

## Limitations

For now, every assignments are in French (because I'm reusing some
earlier material) while the machinery is in English. At some point, I
will setup an i18n infrastructure, so that everything becomes
available both in English, French, and other community-provided
languages.

For now, it only works as a Debian package, but I'd be willing to
merge any pull requests porting this tool to other Linux distributions.

The success per exercises are not saved anywhere yet, so you won't get
any nice shiny stars from this project. Any help in javascript toward
that direction would be welcome.

It is not really difficult to cheat on this system, but if you manage
to understand the logic of my scripts and cheat, then you don't need
no shell course anyway :)

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

2023 Copyright Martin Quinson.

This tool is provided under the [GPLv3 license](LICENSE), or any
higher version of the GPL license.

# How does it work?

## Overview

The environment of each exercice is an [union
mount](https://en.wikipedia.org/wiki/Union_mount) of a read-only fixed
image (called underlay) and a read-write directory called upper layer.
You can modify the whole system from within the chroot, but your
modifications do not actually modify the underlay: Linux writes every
modification to the upper layer, even those of files provided by the
underlay. This way, the image remains clean and can be reused for the
next exercise. This is similar to the notion of snapshots provided by
some virtual machines.

In the shutorial, the underlay is a minimal Debian system, built with
the tool mmdebstrap(1) that is fast and modular. The resulting image
file is built upon the installation of the package and is compressed
as squashfs. This gives a complete system for less than 50Mb on disk.

The union mount is handled by [schroot](https://wiki.debian.org/Schroot),
a tool often used within the Debian infrastructure to provide a fresh
copy of the OS while [building packages](https://wiki.debian.org/sbuild),
or to provide user-specific environments on
[porter boxes](https://wiki.debian.org/PorterBoxHowToUse).

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

Three scripts are used to get the shutorial working.

The `shutorial` script is the main interface provided to the users.
It takes the following sub-commands:

- `shutorial run <exo>`: Start the given exercise if it exists, or
  give the list of existing exercises if not. Press Ctrl-D to exit.
- `shutorial prune-sessions`: Close every existing shutorial
  sessions, both stalled and active ones. You should not need this
  command unless there is a bug in shutorial. Note that it may even
  close the sessions of other users logged in this machine.

The `shutorial-admin` script is installed under /usr/sbin as it needs
the root access to operate. It takes the following sub-commands:

- `shutorial-admin ensure-squashfs`: Makes sure that the squash base
  image exists (under `/usr/lib/shutorial/debian-stable.squashfs`).
  Create it if it's not found, do nothing if it already exists.
- `shutorial-admin rebuild-squashfs`: Rebuilds the squashfs even if it
  already exists.
- `shutorial-admin remove-squashfs`: Removes the squashfs from disk.
- `shutorial-admin schroot-users`: Modifies the schroot config file
   so that every human users of the machine can connect to the
   shutorial.

The `compile.sh` is used at build time and not installed. It compiles
the markdown assignments to HTML static pages, and the `setup.sharin`
script templates into `setup.sh` scripts. It does not take any
parameter.

## Other configuration

schroot is configured in  `/etc/schroot/setup.d/shutorial.conf`. This
file is customized upon Debian installation to allow every human users
to connect to the shutorial. If you add new users, simply re-run
`shutorial-admin schroot-users`.

## Technical details

During the chroot execution, the core image (taken from the squashfs
file) is mounted on `/var/lib/schroot/union/underlay/${session_name}`
while every modification made on the system will be written to
`/var/lib/schroot/union/overlay/${session_name}`. The shells executing
within the box see the union of both file systems as its root
directory (outside, it's mounted as an onion under
`/var/run/schroot/mount/${session}`). As expected, the overlay is
discarded when you end the schroot session.

## Trouble shoting

When you start an exercise, you should get the following shell invite:

```none
SHuToRiaL:~ $

```

One common error is that schroot complains that you are not allowed to
run this chroot. You need to add your user name to
`/etc/schroot/chroot.d/shutorial.conf` This can be done automatically
by re-running `shutorial-admin schroot-users`.

Please report any other problem that you may encounter.

## Security concern

First of all, notice that this is a rather young and dangerous code.
It's using mechanisms that *could* be used for privilege escalation
and other attacks, but I *think* that I got everything covered. You
probably still want to inspect the code of this tool before trusting
it blindly.

The security model is that this tool should be run on your private
machine, where you already have the privileges. **I would not install
this tool on a shared machine or on the network of a school.** It's
not that it's known to be vulnerable to anything, but rather that
given its relative complexity, it's probably too young to be trusted.

That being said, I think that it should be rather difficult to achieve
any privilege escalation with this tool.

`shutorial-admin` contains every operation needing root access, and
you should execute it as sudo or such. The content of this script
should be rather straightforward and hopefully safe: create a chroot,
compress it on disk, etc. The image is built from Debian stable, which
is safe. This script is executed automatically upon package
installation.

The overlay mounting by schroot should be safe too: The user becomes
herself within the chroot, with no extra privilege. For example, I
get connected as mquinson within the chroot, with the exact same
privileges that I have out of the chroot. So, I cannot leverage this
mechanism to read or write something on disk within the chroot that I
would not be allowed to read or write out of the chroot. This is
important because the chroot mount point could be explored by the user
from outside of the chroot.

At some point, I'd like to provide exercises requesting the root
access within the chroot (for example for some sysadmin exercises, or
for a package building tutorial), but I plan to implement this using
sudo. schroot makes it easy to give the sudo access within the chroot
to users who are already sudo out of the box. So that should not
constitute any privilege escalation either.

Of course, if you see any concern with this code, please submit a bug
report.
