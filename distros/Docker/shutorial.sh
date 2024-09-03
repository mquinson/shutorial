#! /bin/sh

case "$1" in
list)
    echo "Here is the list of existing exercises:"
    sed 's/^/  /' ./exo/usage/exercises.list
    echo
    echo "For example, to start the first exercise from this list, simply type:"
    echo "  shutorial run intro"
    exit 0
    ;;

run)
    exo=$2
    if [ -z "$exo" -o ! -e "./exo/usage/exercises.list" ]; then
        echo "Please select an exercise from the following list:"
        sed 's/^/  /' ./exo/usage/exercises.list
        echo
        echo "For example, to start the first exercise from this list, simply type:"
        echo "  shutorial run intro"
        exit 1
    fi

    user=$(id -un)

    echo "Launching exercice $exo"
    
    # Tell the user what to do on login
    if pidof -q lighttpd; then
        url="http://localhost/shutorial/usage/$exo/goal.html"
    else
        url="$PWD/site/usage/$exo/goal.html"
    fi
    firefox "$url" 2>/dev/null
    echo ''
    echo "Please open $url in your browser if it was not automatically done (use Ctrl-Insert in place of Ctrl-C if you need to copy this URL)."
    echo 'When you are done, simply press Ctrl-D to exit the shutorial.'
    echo ''
    docker run -v ./site/usage/$exo:/exo -e LANG=C.UTF-8 -it shutorial sh -c "if test -f /exo/setup.sh; then /bin/bash /exo/setup.sh; fi && export PATH='/shutorial/bin:$PATH' && /bin/bash"


    echo "The session is terminating. Cleaning up."
    ;;

prune-sessions)
    echo "Ending all shutorial sessions..."
    echo "Done."
    ;;
*)
    echo "Usage:" >&2
    echo " shutorial list             # Print the list of existing exercises" >&2
    echo " shutorial run [exercise]   # Run the specified exercise" >&2
    # Actually, no need to prune anything with docker
    echo " shutorial prune-sessions   # End all shutorial sessions (warning, ongoing sessions will be terminated too)" >&2
    exit 1
    ;;
esac
