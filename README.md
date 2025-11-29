# Welcome to the shutorial

This is the SHell Tutorial, an exerciser teaching the use of the shell
console. During the assignments, you will execute various commands in
a Docker environment to reach the requested system state. You will
also be presented wrap-up quizzes in the webpage explaining the
assignment. If you mess up the environment within the Docker, simply
exit it and start again.

Everything runs locally on your machine. No remote system is involved,
ensuring a perfect privacy of your data, while your local system is 
protected by the Docker system. Please do not install this in a school
setting, as Docker may allow your students to gain root access if they
use a malicious image (i.e., not the shutorial). 

# Quick start

## Starting 

Download the
[shutorial](https://github.com/mquinson/shutorial/raw/refs/heads/master/shutorial)
script on your disk and run it from a terminal as follows. Move your
terminal to the location where the script was downloaded (or copy the
script in your home directory), and type the following:

```shell
./shutorial run intro
```

The following text should appear in the terminal window. 
```
Launching exercice intro

Please open http://localhost:8080/shutorial/usage/intro/goal.html in your browser
(Ctrl-Click on the URL may help, or use Ctrl-Insert in place of Ctrl-C to copy this URL).
When you are done, simply press Ctrl-D to exit the shutorial.

SHuToRiaL:~ $ 
```

If you get an error about file permission, first make the script
executable as follows, and try again.

```shell
chmod +x shutorial 
```

## Solving the assignment

When entering the shutorial environment, click on the depicted URL
while holding Ctrl to open the right web page, and follow the
instructions. **Do not proceed with the exercise if it does not look
this way**, as it probably means that you are not within Docker.
Running the commands directly on your machine out of Docker may harm
your system.

```none
SHuToRiaL:~ $
```

When you are done or when you want to start again, press Ctrl-D to
exit the shutorial.

## Provided exercises

- intro: Introduction to the concept of shell, and the grammar of a command line.
- navigation: Creating files and directories (introducting pwd, ls, mkdir, rmdir, rm, cd, touch).
- moving: Moving files (introducting mv).
- globbing: Selecting many files together.
- viewing: Seeing files' content (introducting cat, head, tail, less).
- editing: Editing files (introducting nano, vi and emacs).
- searching: Searching files (introducting locate and find).
- grepping: Crawling files (introducting grep).
- piping: Redirecting I/O (introducting < > >> and |)
- seding: Editing streams on the fly (introducting sed)

More lessons are planned, on writing script files, using shell loops
and other such constructs. But I should probably improve the
infrastructure to translate the material before adding more exercises.

## Limitations

For now, every assignments are in French (because I'm reusing some
earlier material) while the machinery is in English. At some point, I
will setup an i18n infrastructure, so that everything becomes
available both in English, French, and other community-provided
languages.

The success per exercises are not saved anywhere yet, so you won't get
any nice shiny stars from this project. Any help in javascript toward
that direction would be welcome.

It is not really difficult to cheat on this system, but if you manage
to understand the logic of my scripts and cheat, then you don't need
no shell course anyway :)


Of course, if you see any concern with this code, please submit a bug
report.


## Security concern

Running a Docker image is always dangerous, as its content may
compromise your system. The administrator of your system (you) shall
not allow this if they don't trust the image providor (me) or the user
(probably you too). If you trust yourself and me, we are good.

**Please do not install this in a school setting**, as the Docker
system may allow the students to gain root access on your system.
There is no such concern if you use it on your own system.


## License

2023-2025 Copyright Martin Quinson.

This tool is provided under the [GPLv3 license](LICENSE), or any
higher version of the GPL license.
