# WARNING: dangerous alpha-quality dangerous code

This code does not work yet. It's dangerous to use it, as it runs as
sudo and it's not tested enough.

**DO NOT USE IT BEFORE READING (and understanding) ITS CODE!**
You have been warned.

# What it is?

This is an attempt to build an exerciser teaching the use of the shell
console, using chroot for safety (remember: this code is not safe for
now -- but that's the goal) and comfort.

It uses typical Debian tools such as mmdebstrap(1) to build the chroot
and schroot(1) to combine existing chroots as an overlay, so that the
chroot is easy to reset when you restart the exercise.

# How does it work?

The central script is `shutorial.sh`. Here is what it does:

 * Build a fresh system snapshot on need: It downloads the base
   packages from the Debian stable release, configure the system, and
   turn it into a squashfs, that is an archive file that can be used
   later to "boot" on the system

   (This step is skiped if the squashfs file already exists)

 * Configure schroot if needed. This tool needs the `shutorial.conf̀
   file (found in this directory) to be copied under /etc/schroot to
   work correctly. One day, we will ship a Debian package that will
   automate this step correctly. (also an optionnal step)

 * Start the schroot session, configure it (by creating and populating
   /home/$your_user), copy some mandatory files for the exercise, and
   login into the chroot. When you exit the chroot (with Ctrl-D), the
   session is cleaned up. 
   
   Note that thank to schroot, you are yourself into the chroot. For
   example, my user name is still `mquinson` when I enter the chroot.

During the chroot execution, the core image (taken from the squashfs
file) is mounted on `/var/lib/schroot/union/underlay/${session_name}`
while every modification made on the system will be written to 
`/var/lib/schroot/union/overlay/${session_name}`. The shells executing
within the box see the union of both file systems as its root
directory (outside, it's mounted as an onion under
`/var/run/schroot/mount/${session}`). The underlay is read-only, and
the overlay is specific to a session. The overlay is discarded when
you end the schroot session (when you stop your attempt to solve a
given exercise).

## Trouble shoting

If you run the `shutorial.sh`, it should do all above steps and show
you an shell invite as follows:

```
Welcome to the shutorial. Type 'shtrl goal' to see the goal of your mission.

SHuToRiaL:~> 

```

One comon error is that schroot complains that you are not allowed to
run this chroot. You need to add your user name to
`/etc/schroot/chroot.d/shutorial.conf` I'm not sure to know how I
could automate this, even with a proper Debian package.

# What's missing?

Quite a lot of things. There is no exercise yet, and I'm not fully
sure of how I'll do that. 

## Communication intra-extra VM

The idea would be that the `shtrl` binary that exists within the
chroot is supposed to run some verification, and when the exercise is
successfully passed, it writes a magic token on disk. That token would
be found by `shutorial.sh` with the login shell exists before the
session is cleaned up, and would write it back to `~/.shutorial` or
something. It would probably be easy to cheat on this system, but if
you manage to understand the logic and cheat, then you don't need no
shell course anyway :)

## Security

There is ways too much occurences of `sudo` in these scripts. It'd be
great if we could have a small tiny part that is setuid to setup what
needs to be setup, and if the rest could run without any specific
priviledge.

One way would be to have the squashfs built and installed by the wanna
be Debian package, while all session settings would be done by a
script executed within the chroot, with no specific access. Setting up
/home/$your_user cannot be done this way (because we need that
directory when logging), but this could probably be done another way
with a schroot configuration script.

Another security issue is when the user will be given the root access
within the chroot (for example for some sysadmin exercises). In this
case, she could write a setuid script from within the chroot and then
use it from outside. We would need to chown 700 the mount points to
avoid this problem, but that would complexify the intra-extra
communication. One day we'll figure out, I hope.

## Localization

For now, the texts speak French, but the goal would be to make it
speak English and use a proper localization system.

## Proper proper mechanism to write the exercises

  * Idea 1: build squashfs images for each exercises, and mount them
    in the lowerdir of the Overlay_filesystem
    (see https://wiki.archlinux.org/title/Overlay_filesystem).
    
    Pro: technically consistent with the rest of the architecture
    Cons: Is it possible to have several lowerdir in schroot?
   
  * Idea 2: build autoextracting archives for each exercise, that gets
    opened when the exercise starts. Either plain archives or Debian
    packages, that's not really different.
    
    Pro: maybe easier to do.
    Cons: Static exercises. No random elements in exercises that would
          increase the user fun and make it harder for neighbors to cheat
    
  * Idea 3: have a setup script per exercise, doing what needs to be done
  
    Pro:
      - It was done this way in my katacoda version
      - Dynamic exercises become possible
    Cons:
      - Fully dynamic exercises may take some time to setup
      - These scripts are a bit difficult to write in a way that does
        not allow the user to simply find the solution by reading them.
	You need to uuencode many things and such.

The goal is to make it easy and rather dumb-proof. The story is that I
ran `rm -rf ~` on my laptop once when developping the katacoda
version. I thought I was within the katacoda but was on my real
machine instead...

## Convert the exercises from katacoda

... and write new exercises.
