#! /bin/sh

schroot_run() {
    echo "Preparing the schroot"
    session=$(schroot --chroot shutorial --begin-session)

#    cp src/shtrl.sh "/var/run/schroot/mount/${session}/usr/bin/shtrl"
#    chmod 755 "/var/run/schroot/mount/${session}/usr/bin/shtrl"

#    mkdir -p "/var/run/schroot/mount/${session}/usr/share/shtrl/"

    echo "The schroot is reading. Entering."
    schroot --run -c $session -d /home/$user -- bash --login

    schroot --end-session -c $session
    echo "The session is terminating. Cleaning up."
}

# Let's go!

schroot_run     # Enter the schroot
