#! /bin/sh


# Lauch lighttpd so that it will display the exercises
if pidof -q lighttpd; then
  : # already running. The shutorial was started from with the shutorial, but that's OK
else
  sudo lighttpd -D -f /etc/lighttpd/lighttpd.conf &
fi

case "$1" in
login)
    # log into the docker
    exec bash
    ;;
list)
    echo "Here is the list of existing exercises:"
    sed 's/^/  /' /usr/share/shutorial/usage/exercises.list
    echo
    echo "For example, to start the first exercise from this list, simply type:"
    echo "  shutorial run intro"
    exit 0
    ;;

run)
    exo=$2
    if [ -z "$exo" -o ! -e "/usr/share/shutorial/usage/exercises.list" ]; then
        echo "Please select an exercise from the following list:"
        sed 's/^/  /' /usr/share/shutorial/usage/exercises.list
        echo
        echo "For example, to start the first exercise from this list, simply type:"
        echo "  shutorial run intro"
        exit 1
    fi

    user=$(id -un)

    echo "Launching exercice $exo"
    
    # Tell the user what to do on login
    echo ''
    echo "Please open http://localhost:8080/shutorial/usage/$exo/goal.html in your browser (Ctrl-Click on the URL may help, or use Ctrl-Insert in place of Ctrl-C to copy this URL)."
    echo 'When you are done, simply press Ctrl-D to exit the shutorial.'
    echo ''
    #-e LANG=C.UTF-8 -it shutorial sh -c "
    
    # Configure what needs to be
    if test -f /usr/share/shutorial/usage/$exo/setup.sh ; then 
       /bin/bash /usr/share/shutorial/usage/$exo/setup.sh; 
    fi
#    export LANG=fr_FR.UTF-8
#    echo "export PS1='\u:\w $ '" >> /home/SHuToRiaL/.bashrc
    
    # Enter the interactive session
    exec /bin/bash

    ;;

*)
    echo "Usage:" >&2
    echo " shutorial list             # Print the list of existing exercises" >&2
    echo " shutorial run [exercise]   # Run the specified exercise" >&2
    exit 1
    ;;
esac
