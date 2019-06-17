#! /bin/sh

# THIS SCRIPT WAS GENERATED, DO NOT EDIT
# Real source: intro-setup.sharin

(apt update; apt -y install locales manpages-fr) 2>/dev/null >/dev/null
sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
dpkg-reconfigure --frontend=noninteractive locales
update-locale LANG=fr_FR.UTF-8


# Actually, we just want the default setting
echo done > /tmp/.katacoda-finished