#! /bin/sh

# THIS SCRIPT WAS GENERATED, DO NOT EDIT
# Real source: searching-setup.sharin

(apt update; apt -y install locales manpages-fr) 2>/dev/null >/dev/null
sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
dpkg-reconfigure --frontend=noninteractive locales
update-locale LANG=fr_FR.UTF-8


# KCCLEAN
cd; rm -rf *
updatedb

# KCINSTALL tree tree
if which tree >/dev/null 2>/dev/null || [ -e tree ] ; then :; else apt install tree 2>/dev/null >/dev/null; fi

for a in aaa bbb ccc ddd ; do 
  for b in de be xe ; do
    for c in ti li pi ; do
      for d in ka ta ra ; do
        for e in po so vo ; do
	  for f in mu lu zu ; do 
 	    mkdir -p $a/$b/$c/$d/$e/$f
	  done
	done
      done
    done
  done
done

# Q1: trouver un fichier de nom "ici"
echo "Bravo, vous avez trouvé le fichier. L'information cherchée est: depikapolu." > aaa/de/pi/ka/po/lu/ici

# Q2: trouver un fichier dont on ignore le nom (find -type f)
echo "Bravo, c'était bien là. L'information était: bepitasolu." > bbb/be/pi/ta/so/lu/fichier_perdu

# Q3: trouver un fichier non vide (find -type f -size 0)
for a in ccc ; do 
  for b in de be xe ; do
    for c in ti li pi ; do
      for d in ka ta ra ; do
        for e in po so vo ; do
	  #for f in mu lu zu ; do
 	    # Des répertoires vides pour géner la recherche
	  #done
	  touch $a/$b/$c/$d/$e/peut-etre-la
	done
        touch $a/$b/$c/$d/peut-etre-la
      done
      touch $a/$b/$c/peut-etre-la
    done
    touch $a/$b/peut-etre-la
  done
done
echo "Bravo, c'était bien là. L'information était: deliravo." > ccc/de/li/ra/vo/peut-etre-la

# Q4: trouver un fichier plus récent qu'un autre
for a in ddd ; do 
  for b in de be xe ; do
    for c in ti li pi ; do
      for d in ka ta ra ; do
        for e in po so vo ; do
	  for f in mu lu zu ; do
	    echo "L'information ici est: ${b}${c}${d}${e}${f}." > $a/$b/$c/$d/$e/$f/peut-etre-la
	  done
	  echo "L'information ici est: ${b}${c}${d}${e}." > $a/$b/$c/$d/$e/peut-etre-la
	done
	echo "L'information ici est: ${b}${c}${d}." > $a/$b/$c/$d/peut-etre-la
      done
      echo "L'information ici est: ${b}${c}." > $a/$b/$c/peut-etre-la
    done
    echo "L'information ici est: ${b}." > $a/$b/peut-etre-la
  done
done
touch timestamp
echo "Rien d'intéressant dans ce fichier" > ddd/xe/pi/ta/po/zu/pas-la

for f in `find -type f` ; do
  iconv -f ISO_8859-1 -t utf8 -o /tmp/AZE $f && mv /tmp/AZE $f
done

sleep 2
touch ddd/be/ti/ra/so/lu

echo done > /tmp/.katacoda-finished