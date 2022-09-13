#! /bin/sh


if [ x$LANG = x ] ; then
  echo "LANG not set. Defaulting to C language"
  LANG=C
fi

lang=`echo $LANG|sed 's/_.*$//'`

sudo rm -rf chrootdir

mmdebstrap --variant=essential \
    --include=less,nano,tree,man-db,manpages,manpages-dev,manpages-fr,manpages-fr-dev,locales,bash,bash-completion,passwd \
    --setup-hook='mkdir -p "$1/bin"' \
    --setup-hook='echo root:x:0:0:root:/root:/bin/sh > "$1/etc/passwd"' \
    --setup-hook='printf "root:x:0:\nmail:x:8:\nutmp:x:43:\n" > "$1/etc/group"' \
    --dpkgopt='path-exclude=/usr/share/doc/*' \
    --dpkgopt='path-exclude=/usr/share/man/*' \
    --dpkgopt='path-include=/usr/share/man/man[12345678]/*' \
    --dpkgopt="path-include=/usr/share/man/$lang*" \
    --dpkgopt='path-exclude=/usr/share/locale/*' \
    --dpkgopt='path-include=/usr/share/locale/locale.alias' \
    --dpkgopt="path-include=/usr/share/locale/$lang*" \
    --dpkgopt='path-exclude=/usr/share/{help,gnome/help}/*' \
    --dpkgopt='path-include=/usr/share/{help,gnome/help}/C' \
    --dpkgopt="path-include=/usr/share/{help,gnome/help}/$lang" \
    --customize-hook='echo "'$LANG' UTF-8" >> $1/etc/locale.gen' \
    --customize-hook='chroot "$1" locale-gen' \
    --customize-hook='echo '$LANG' > $1/etc/default/locale' \
    --customize-hook='chroot "$1" passwd --delete root' \
    --customize-hook='chroot "$1" groupadd --gid 101000 user' \
    --customize-hook='chroot "$1" useradd --uid 101000 --gid 101000 --home-dir /home/user --create-home user' \
    --customize-hook='chroot "$1" passwd --delete user' \
    --customize-hook='chroot "$1" mandb' \
    --customize-hook='echo shutorial > "$1/etc/hostname"' \
    --customize-hook='echo "127.0.0.1 localhost host" > "$1/etc/hosts"' \
    stable chrootdir

sudo bash -c 'sed "s/^  //" >> chrootdir/home/user/.bashrc' <<EOF
  # Addition for shutorial
  if [ "\$color_prompt" = yes ]; then
    PS1="\[\033[01;32m\]SHuToRiaL\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]> "
  else
    PS1="SHuToRiaL:\w> "
  fi
  cd
  echo "Welcome to the shutorial. Type 'shtrl goal' to see the goal of your mission."
  echo
EOF

rm -f debian-stable.squashfs
mksquashfs chrootdir debian-stable.squashfs -comp xz

#    --dpkgopt='path-exclude=/usr/lib/*/gconv/*' \
#    --dpkgopt='path-exclude=/usr/lib/locale/*' \
