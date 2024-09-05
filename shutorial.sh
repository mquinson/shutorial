#! /bin/sh

if [ -e /usr/bin/schroot ] && [ -e /etc/schroot/chroot.d/shutorial.conf ] ; then
    SCHROOT_OK=1
    ROOT_DIR=/var/www/html/shutorial
elif docker ps > /dev/null 2>&1 && echo 1 ; then
    DOCKER_OK=1
    ROOT_DIR=`pwd`"/"
else
    ROOT_DIR=/var/www/html/shutorial
fi

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

    if [ -n ${CHROOT_OK} ] ; then
        echo "Entering the schroot"
        session=$(schroot --chroot shutorial --begin-session)

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
    if [ -n ${CHROOT_OK} ] ; then
        echo "echo 'Please open $url in your browser if it was not automatically done (use Ctrl-Insert in place of Ctrl-C if you need to copy this URL).'" >>"/var/run/schroot/mount/${session}/home/${user}/.bash_profile"
        echo "echo 'When you are done, simply press Ctrl-D to exit the shutorial.'" >>"/var/run/schroot/mount/${session}/home/${user}/.bash_profile"
        echo "echo " >>"/var/run/schroot/mount/${session}/home/${user}/.bash_profile"

        schroot --run -c $session -d /home/$user -- bash --login
        schroot --end-session -c $session
        echo "The session is terminating. Cleaning up."
    elif [ -n ${DOCKER_OK} ] ; then
        echo ''
        echo 'Please open $$url in your browser if it was not automatically done (use Ctrl-Insert in place of Ctrl-C if you need to copy this URL).'
        echo 'When you are done, simply press Ctrl-D to exit the shutorial.'
        echo ''
        docker run -v ./site/usage/$exo:/exo -e LANG=C.UTF-8 -it shutorial sh -c "if test -f /exo/setup.sh; then /bin/bash /exo/setup.sh; fi && export PATH='/shutorial/bin:$PATH' && /bin/bash"
    fi

    ;;

prune-sessions)
    echo "Ending all shutorial sessions..."

    if [ -n ${CHROOT_OK} ] ; then
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
    if [ -n ${CHROOT_OK} ] ; then
        echo " shutorial prune-sessions   # End all shutorial sessions (warning, ongoing sessions will be terminated too)" >&2
    fi
    exit 1
    ;;
esac
