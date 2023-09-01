#! /bin/sh

# Existing functions:
#  squashfs_build : do build /srv/shutorial/debian-stable.squashfs 
#  squashfs_ensure: Make sure that the squashfs exists, and create it if not
#  schroot_ensure : Make sure that schroot is configured

squashfs_build() {
    # Config: check the language to use
    if [ x$LANG = x ] ; then
        echo "LANG not set. Defaulting to C language"
        LANG=C
    fi
    lang=`echo $LANG|sed 's/_.*$//'`

    # First, clean previous attempts and create the base directory
    sudo rm -rf /srv/shutorial/basedir
    sudo mkdir -p /srv/shutorial

    # 1. Prepare the chroot base directory in /srv/shutorial/basedir
    sudo mmdebstrap --variant=essential \
      --include=less,nano,tree,man-db,manpages,manpages-dev,manpages-fr,manpages-fr-dev,locales,bash,bash-completion,passwd,sudo \
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
      --customize-hook='echo shutorial > "$1/etc/hostname"' \
      --customize-hook='echo "127.0.0.1 localhost host" > "$1/etc/hosts"' \
      stable /srv/shutorial/basedir

#    --customize-hook='chroot "$1" mandb' \
#    --dpkgopt='path-exclude=/usr/lib/*/gconv/*' \
#    --dpkgopt='path-exclude=/usr/lib/locale/*' \

    # 2. Further configure the environment
    sudo bash -c 'sed "s/^      //" >> /srv/shutorial/basedir//etc/bash.bashrc' <<EOF
        # Addition for shutorial
        if [ "\$color_prompt" = yes ]; then
           PS1="\[\033[01;32m\]SHuToRiaL\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $ "
	 else
	   PS1="SHuToRiaL:\w $ "
       fi
       cd
       echo "Welcome to the shutorial. Type 'shtrl goal' to see the goal of your mission."
       echo
EOF

    # 3. Build a squashfs out of that basedir (and remove the basedir)
    cd /srv/shutorial/
    sudo rm -f debian-stable.squashfs
    sudo mksquashfs basedir debian-stable.squashfs -comp xz
    sudo chown root:root debian-stable.squashfs
    sudo rm -rf basedir
}

squashfs_ensure() {
    if [ ! -e  /srv/shutorial/debian-stable.squashfs ] ; then
        squashfs_build  
    fi
}

schroot_ensure() {
    if test -e /etc/schroot/chroot.d/shutorial.conf ; then 
        echo "schroot config file in position -- good"
    else
        sudo cp shutorial.conf /etc/schroot/chroot.d
	sudo chown root /etc/schroot/chroot.d/shutorial.conf
    fi
}

schroot_run() {
    echo "Preparing the schroot"
    session=$(schroot --chroot shutorial --begin-session)

    # ls /var/lib/schroot/union

    user=$(id -un)
    group=$(id -gn)
    
    sudo mkdir "/var/run/schroot/mount/${session}/home/$user"
    sudo bash -c "sed 's/^      //' > /var/run/schroot/mount/${session}/home/$user/.profile" <<EOF
      export LANG=$LANG
EOF

    sudo chown -R $user:$group "/var/run/schroot/mount/${session}/home/$user"

    sudo cp src/shtrl.sh "/var/run/schroot/mount/${session}/usr/bin/shtrl"
    sudo chmod 755 "/var/run/schroot/mount/${session}/usr/bin/shtrl"

    sudo mkdir -p "/var/run/schroot/mount/${session}/usr/share/shtrl/"
    sudo cp exo/usage/intro/goal.txt "/var/run/schroot/mount/${session}/usr/share/shtrl/goal.txt"

    echo "The schroot is reading. Entering."
    schroot --run -c $session -d /home/$user -- bash --login

    schroot --end-session -c $session
    echo "The session is terminating. Cleaning up."
}

# Let's go!

#squashfs_ensure # Make sure that we have an existing squashfs
#schroot_ensure  # Make sure that schroot is configured
schroot_run     # Enter the schroot
