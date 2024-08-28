FROM debian:latest

USER root

# Find the missing commands used in the exercices
RUN apt-get update --fix-missing
RUN apt-get -y install procps man-db ncal tree less console-data
RUN apt-get -y install emacs
RUN apt-get -y install nano
RUN apt-get -y install vim
RUN apt-get -y install locate
RUN apt-get -y install sharutils

# Setup a nice shutorial environnment
RUN useradd SHuToRiaL
RUN mkdir /home/SHuToRiaL
RUN chown SHuToRiaL /home/SHuToRiaL
# Required to have shtrl-check executable working
#   without that, the script couldn't be created in a nice place other than Home
RUN mkdir /shutorial
RUN mkdir /shutorial/bin
RUN chown SHuToRiaL /shutorial/bin

# Move the docker to the created environment
USER SHuToRiaL
WORKDIR /home/SHuToRiaL