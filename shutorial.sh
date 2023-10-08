#! /bin/sh

case "$1" in
   list)
      echo "Here is the list of existing exercises:"
      sed 's/^/  /' /var/www/html/shutorial/usage/exercises.list
      echo
      echo "For example, to start the first exercise from this list, simply type:"
      echo "  shutorial run intro"
      exit 0
    ;;

   run)
      exo=$2
      if [ -z "$exo" -o ! -e "/var/www/html/shutorial/usage/$exo/" ] ; then
        echo "Please select an exercise from the following list:"
	sed 's/^/  /' /var/www/html/shutorial/usage/exercises.list
	echo
	echo "For example, to start the first exercise from this list, simply type:"
	echo "  shutorial run intro"
	exit 1
      fi

      user=$(id -un)

      echo "Entering the schroot"
      session=$(schroot --chroot shutorial --begin-session)
      
      # Some exercises need a setup script (it's automatically removed from the chroot after execution)
      if [ -e "/var/www/html/shutorial/usage/$exo/setup.sh" ] ; then
        cp /var/www/html/shutorial/usage/$exo/setup.sh /var/run/schroot/mount/${session}/usr/lib/shutorial/bin/
        echo "sh /usr/lib/shutorial/bin/setup.sh" >>  "/var/run/schroot/mount/${session}/home/${user}/.bash_profile"
	echo "rm /usr/lib/shutorial/bin/setup.sh" >>  "/var/run/schroot/mount/${session}/home/${user}/.bash_profile"	
      fi
      
      # Tell the user what to do on login
      if pidof -q lighttpd ; then
        url="http://localhost/shutorial/usage/$exo/goal.html"
      else
        url="/var/www/html/shutorial/usage/$exo/goal.html"
      fi
      
      firefox "$url" 2>/dev/null&
      echo "echo 'Please open $url in your browser if it was not automatically done (use Ctrl-Insert in place of Ctrl-C if you need to copy this URL).'" >> "/var/run/schroot/mount/${session}/home/${user}/.bash_profile"
      echo "echo 'When you are done, simply press Ctrl-D to exit the shutorial.'" >> "/var/run/schroot/mount/${session}/home/${user}/.bash_profile"
      echo "echo " >> "/var/run/schroot/mount/${session}/home/${user}/.bash_profile"

      schroot --run -c $session -d /home/$user -- bash --login
      schroot --end-session -c $session
      echo "The session is terminating. Cleaning up."
    ;;

    prune-sessions)
       echo "Ending all shutorial sessions..."
       for session in /run/schroot/mount/shutorial-* ; do
         if [ -e $session ] ; then
           s=`basename $session`
	   echo "  ending session $s"
           schroot -c $s --end-session
	 else
	   echo "  no pending session found."
	 fi
       done
       echo "Done."
    ;;
    *)
        echo "Usage:" >&2
	echp " shutorial list             # Print the list of existing exercises" >&2
	echo " shutorial run [exercise]   # Run the specified exercise" >&2
	echo " shutorial prune-sessions   # End all shutorial sessions (warning, ongoing sessions will be terminated too)" >&2
        exit 1
    ;;
esac

