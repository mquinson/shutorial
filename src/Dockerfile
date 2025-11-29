FROM debian:stable

USER root

# Find the missing commands used in the exercices
RUN    apt update --fix-missing \
    && apt -y install procps man-db ncal tree less console-data nano \
    && apt -y install locate sharutils lighttpd media-types sudo coreutils \
    && rm -rf /var/cache/apt/* /var/cache/debconf/*-old /var/lib/apt/* 


# Setup everything in French
RUN    set -x \ 
    && apt update && apt -y install locales manpages-fr \
    && sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen fr_FR.UTF-8 \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=fr_FR.UTF-8 LANGUAGE="fr_FR" \
    && rm -rf /var/cache/apt/* /var/cache/debconf/*-old /var/lib/apt/* 
   

# Setup a nice shutorial environnment
RUN    useradd --groups sudo --password toto SHuToRiaL && mkdir /home/SHuToRiaL && chown SHuToRiaL /home/SHuToRiaL \
    && echo "export LANG=fr_FR.UTF-8"                > /home/SHuToRiaL/.bashrc \
    && echo "export PS1='\u:\w $ '"                 >> /home/SHuToRiaL/.bashrc \
    && echo "export PATH=\"/shutorial/bin:\$PATH\"" >> /home/SHuToRiaL/.bashrc 

# Allow passwordless sudo for SHuToRiaL
RUN    echo "SHuToRiaL ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/shutorial \
    && chmod 440 /etc/sudoers.d/shutorial

# Install the exercises
COPY . /usr/share/shutorial
RUN ln -s /usr/share/shutorial/ /var/www/html/

# Required to have shtrl-check executable working
#   without that, the script couldn't be created in a nice place other than Home
RUN    mkdir -p /shutorial/bin \
    && chown SHuToRiaL /shutorial/bin \
    && mv /usr/share/shutorial/shutorial.sh /usr/bin/shutorial

# Move the docker to the created environment
USER SHuToRiaL
WORKDIR /home/SHuToRiaL
ENTRYPOINT ["/usr/bin/shutorial"]