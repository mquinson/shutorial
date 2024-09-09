#! /bin/sh


if proot --help >/dev/null 2>&1 && [ x${SHUTORIAL_PROOT} = x1 ] ; then
    PROOT_OK=1
    ROOT_DIR=`pwd`"/"
    if [ -e /usr/lib/shutorial/debian-stable.tar.xz ] ; then
        ROOTFS=/usr/lib/shutorial/debian-stable.tar.xz
        echo "Found rootFS: ${ROOTFS}"
    else
        ROOTFS=~/.shutorial/debian-stable.tar.xz
        if [ -e ~/.shutorial/debian-stable.tar.xz ] ; then
            echo "Found rootFS: ${ROOTFS}"
        else 
            echo "Download the rootfs from Martin Quinson webpage"
            mkdir ~/.shutorial
            wget https://people.irisa.fr/Martin.Quinson/debian-stable.tar.xz -O ${ROOTFS}
        fi
    fi
    echo "shutorial is usable"
elif [ -e /usr/bin/schroot ] && [ -e /etc/schroot/chroot.d/shutorial.conf ] ; then
    SCHROOT_OK=1
    echo "schroot found"
elif docker ps > /dev/null 2>&1 && echo 1 ; then
    DOCKER_OK=1
    echo "docker found"
fi

if [ -e /var/www/html/shutorial ] ; then
    ROOT_DIR=/var/www/html/shutorial
elif [ -e usage/exercises.list ] ; then
    ROOT_DIR=`pwd`"/"
elif [ -e exo/usage/exercises.list ] ; then
    ROOT_DIR=`pwd`"/exo/"
else 
    echo "Cannot find the exercises. Please install the package, or move to the root dir of the git checkout" >2
    exit 1
fi
echo "Found the exercises under ${ROOT_DIR}"

case "$1" in
list)
    echo "Here is the list of existing exercises:"
    sed 's/^/  /' ${ROOT_DIR}/usage/exercises.list
    echo
    echo "For example, to start the first exercise from this list, simply type:"
    echo "  shutorial run intro"
    exit 0
    ;;

run)
    exo=$2
    if [ -z "$exo" -o ! -e "${ROOT_DIR}/usage/${exo}/" ]; then
        echo "Please select an exercise from the following list:"
        sed 's/^/  /' ${ROOT_DIR}/usage/exercises.list
        echo
        echo "For example, to start the first exercise from this list, simply type:"
        echo "  shutorial run intro"
        exit 1
    fi

    user=$(id -un)

    if [ "x${PROOT_OK}" = x1 ] ; then
        OLD_PWD=`pwd`
        TMPDIR=`mktemp --directory /tmp/shutorial.XXXXXXXXX`
        cd ${TMPDIR}
        tar xf ${ROOTFS}
        mkdir home/${user}
        cd ${OLD_PWD}

        # Some exercises need a setup script (it's automatically removed from the chroot after execution)
        if [ -e "${ROOT_DIR}/usage/$exo/setup.sh" ]; then
            mkdir -p ${TMPDIR}/usr/lib/shutorial/bin/
            cp ${ROOT_DIR}/usage/$exo/setup.sh ${TMPDIR}/usr/lib/shutorial/bin/
            echo "sh /usr/lib/shutorial/bin/setup.sh" >>"${TMPDIR}/home/${user}/.bash_profile"
            #echo "rm -f /usr/lib/shutorial/bin/setup.sh" >>"${TMPDIR}/home/${user}/.bash_profile"
        fi

    elif [ "x${SCHROOT_OK}" = x1 ] ; then
        echo "Entering the schroot"
        session=$(schroot --chroot shutorial --begin-session)

        mkdir /var/run/schroot/mount/${session}/home/${user}
        echo "export LANG=$LANG" > /var/run/schroot/mount/${session}/home/${user}/.bash_profile
        echo "export PATH=\$PATH:/usr/lib/shutorial/bin" >> /var/run/schroot/mount/${session}/home/${user}/.bash_profile

        # Some exercises need a setup script (it's automatically removed from the chroot after execution)
        if [ -e "${ROOT_DIR}/usage/$exo/setup.sh" ]; then
            cp ${ROOT_DIR}/usage/$exo/setup.sh /var/run/schroot/mount/${session}/usr/lib/shutorial/bin/
            echo "sh /usr/lib/shutorial/bin/setup.sh" >>"/var/run/schroot/mount/${session}/home/${user}/.bash_profile"
            echo "rm /usr/lib/shutorial/bin/setup.sh" >>"/var/run/schroot/mount/${session}/home/${user}/.bash_profile"
        fi
    fi

    # Tell the user what to do on login
    if pidof -q lighttpd; then
        url="http://localhost/shutorial/usage/$exo/goal.html"
    else
        url="${ROOT_DIR}/usage/$exo/goal.html"
    fi

    firefox "$url" 2>/dev/null &
    if [ "x${PROOT_OK}" = x1 ] ; then

        echo "echo 'Please open $url in your browser if it was not automatically done (use Ctrl-Insert in place of Ctrl-C if you need to copy this URL).'" >>"${TMPDIR}/home/${user}/.bash_profile"
        echo "echo 'When you are done, simply press Ctrl-D to exit the shutorial.'" >>"${TMPDIR}/home/${user}/.bash_profile"
        echo "echo " >>"${TMPDIR}/home/${user}/.bash_profile"

        proot --rootfs=${TMPDIR} --cwd=/home/$user --mount=/dev --mount=/proc --mount=/sys --mount=/etc/passwd --mount=/etc/group \
              --mount=/etc/nsswitch.conf --mount=/etc/localtime --mount=/run/ --mount=/var/run/dbus/system_bus_socket --mount=${TMPDIR} \
              bash --login

        echo "The session is terminating. Cleaning up."
        rm -rf ${TMPDIR}

    elif [ "x${SCHROOT_OK}" = x1 ] ; then
        echo "echo 'Please open $url in your browser if it was not automatically done (use Ctrl-Insert in place of Ctrl-C if you need to copy this URL).'" >>"/var/run/schroot/mount/${session}/home/${user}/.bash_profile"
        echo "echo 'When you are done, simply press Ctrl-D to exit the shutorial.'" >>"/var/run/schroot/mount/${session}/home/${user}/.bash_profile"
        echo "echo " >>"/var/run/schroot/mount/${session}/home/${user}/.bash_profile"

        schroot --run -c $session -d /home/$user -- bash --login

        echo "The session is terminating. Cleaning up."
        schroot --end-session -c $session
    elif [ "x${DOCKER_OK}" = x1 ] ; then
        echo ''
        echo 'Please open $$url in your browser if it was not automatically done (use Ctrl-Insert in place of Ctrl-C if you need to copy this URL).'
        echo 'When you are done, simply press Ctrl-D to exit the shutorial.'
        echo ''
        docker run -v ./site/usage/$exo:/exo -e LANG=C.UTF-8 -it shutorial sh -c "if test -f /exo/setup.sh; then /bin/bash /exo/setup.sh; fi && export PATH='/shutorial/bin:$PATH' && /bin/bash"
    fi

    ;;

prune-sessions)
    echo "Ending all shutorial sessions..."

    if [ "x${PROOT_OK}" = x1 ] ; then
        killall -TERM proot
        sleep 1
        killall proot
        rm -rf /tmp/shutorial.*
    elif [ "x${CHROOT_OK}" = x1 ] ; then
        for session in /run/schroot/mount/shutorial-*; do
            if [ -e $session ]; then
                s=$(basename $session)
                echo "  ending session $s"
                schroot -c $s --end-session
            else
                echo "  no pending session found."
            fi
        done
    fi
    echo "Done."
    ;;
*)
    echo "Usage:" >&2
    echo " shutorial list             # Print the list of existing exercises" >&2
    echo " shutorial run [exercise]   # Run the specified exercise" >&2
    if [ "x${SCHROOT_OK}" = x1 ] ; then
        echo " shutorial prune-sessions   # End all shutorial sessions (warning, ongoing sessions will be terminated too)" >&2
    fi
    exit 1
    ;;
esac
