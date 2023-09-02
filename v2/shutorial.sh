#! /bin/sh

schroot_run() {
    echo "Preparing the schroot"
    session=$(schroot --chroot shutorial --begin-session)

    # ls /var/lib/schroot/union

    user=$(id -un)
    group=$(id -gn)
    
    schroot --run -c $session -d / -- mkdir "/home/$user"
    schroot --run -c $session -d / -- bash -c "sed 's/^      //' > /var/run/schroot/mount/${session}/home/$user/.profile" <<EOF
      export LANG=$LANG
EOF

    schroot --run -c $session -d / -- chown -R $user:$group "/var/run/schroot/mount/${session}/home/$user"

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
