#! /bin/sh

# Shutorial admin tool. 

# Existing commands:
#  ensure-squashfs: Make sure that the squashfs exists, and create it if not
#  build-squashfs:  Do build /usr/lib/shutorial/debian-stable.squashfs 
#  remove-squashfs: Remove the squashfs

squashfs_build() {
    # Config: check the language to use
    if [ x$LANG = x ] ; then
        echo "LANG not set. Defaulting to C language"
        LANG=C
    fi
    lang=`echo $LANG|sed 's/_.*$//'`

    # First, clean previous attempts and create the base directory
    rm -rf /usr/lib/shutorial/basedir
    mkdir -p /usr/lib/shutorial

    # 1. Prepare the chroot base directory in /usr/lib/shutorial/basedir
    mmdebstrap --variant=essential \
      --include=less,nano,tree,man-db,manpages,manpages-dev,manpages-fr,manpages-fr-dev,locales,bash,bash-completion,passwd,sharutils,locate \
      --setup-hook='mkdir -p "$1/bin"' \
      --setup-hook='echo root:x:0:0:root:/root:/bin/sh > "$1/etc/passwd"' \
      --setup-hook='printf "root:x:0:\nmail:x:8:\nutmp:x:43:\n" > "$1/etc/group"' \
      --setup-hook='mkdir -p "$1/etc/apt/trusted.gpg.d"' \
      --setup-hook='apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 54404762BBB6E853 0E98404D386FA1D9' \
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
      --customize-hook='chroot "$1" updatedb' \
      --customize-hook='chroot "$1" passwd --delete root' \
      --customize-hook='echo shutorial > "$1/etc/hostname"' \
      --customize-hook='echo "127.0.0.1 localhost host" > "$1/etc/hosts"' \
      stable /usr/lib/shutorial/basedir

#    --customize-hook='chroot "$1" mandb' \
#    --dpkgopt='path-exclude=/usr/lib/*/gconv/*' \
#    --dpkgopt='path-exclude=/usr/lib/locale/*' \

    # 2. Further configure the environment
    bash -c 'sed "s/^      //" >> /usr/lib/shutorial/basedir//etc/bash.bashrc' <<EOF
        # Addition for shutorial
        if [ "\$color_prompt" = yes ]; then
           PS1="\[\033[01;32m\]SHuToRiaL\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $ "
	 else
	   PS1="SHuToRiaL:\w $ "
       fi
       cd
       echo "Welcome to the shutorial."
       echo
EOF

    # Create a directory in which the exercises can add binaries (such as setup and check scripts)
    mkdir -p /usr/lib/shutorial/basedir//usr/lib/shutorial/bin
    chmod 777 /usr/lib/shutorial/basedir//usr/lib/shutorial/bin
    
    # Create a home directory for every user that could log in
    for user in `getent passwd $(ls /home) | sed 's/:.*//'` ; do
      echo "Create /home/$user within the squashfs"
      group=`groups $user | sed 's/^[^:]*: //' | cut -d' ' -f1`
      mkdir -p /usr/lib/shutorial/basedir//home/$user
      echo "export LANG=$LANG" > /usr/lib/shutorial/basedir//home/$user/.bash_profile
      echo "export PATH=\$PATH:/usr/lib/shutorial/bin" >> /usr/lib/shutorial/basedir//home/$user/.bash_profile
      chown -R $user:$group /usr/lib/shutorial/basedir//home/$user
    done

    # 3. Build a squashfs out of that basedir (and remove the basedir)
    cd /usr/lib/shutorial/
    rm -f debian-stable.squashfs
    mksquashfs basedir debian-stable.squashfs -comp xz
    chown root:root debian-stable.squashfs
    rm -rf basedir
}

case "$1" in
    rebuild-squashfs)
       echo "Rebuild the shutorial squahfs."
       squashfs_build
    ;;
    ensure-squashfs)
       if [ -e "/usr/lib/shutorial/debian-stable.squashfs" ] ; then
           echo "The shutorial squashfs already exists. Good."
       else
           echo "Rebuild the missing shutorial squashfs."
	   squashfs_build
       fi
    ;;
    remove-squashfs)
       echo "Removing the shutorial squahfs."
       rm -rf /usr/lib/shutorial/debian-stable.squashfs
    ;;
    schroot-users)
	for user in `getent passwd $(ls /home) | sed 's/:.*//'` ; do 
	  users="$user,$users"
	done
	users=`echo $users | sed 's/,$//'`
	echo "Giving access to the schroot to the following users: $users."
	sed -i 's/^[# ]*users.*$/users='"$users/" /etc/schroot/chroot.d/shutorial.conf
    ;;
    *)
        echo "Usage:" >&2
        echo " shutorial-admin ensure-squashfs  # Make sure that the squashfs exists" >&2
	echo " shutorial-admin rebuild-squashfs # Build the squashfs even if it already exists" >&2
	echo " shutorial-admin remove-squashfs  # Erase the squashfs if it exists" >&2
	echo " shutorial-admin schroot-users    # Configure schroot to allow every users to connect" >&2
        exit 1
    ;;
esac
