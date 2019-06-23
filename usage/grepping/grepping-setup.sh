#! /bin/sh

# THIS SCRIPT WAS GENERATED, DO NOT EDIT
# Real source: grepping-setup.sharin

if [ -e /etc/locale.gen ] && grep -q '# fr_FR.UTF-8 UTF-8' /etc/locale.gen ; then
   (apt update; apt -y install locales manpages-fr) 2>/dev/null >/dev/null
   sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
   dpkg-reconfigure --frontend=noninteractive locales  2>/dev/null >/dev/null
   update-locale LANG=fr_FR.UTF-8 2>/dev/null >/dev/null
fi


# KCCLEAN
cd; if [ "x$PWD" = "x/root" ] ; then rm -rf * ; fi

for dir in aa bb cc dd ee ; do
  rm -rf $dir
  mkdir $dir
  cpt=0
  (for a in de be xe ; do
     for b in ru gu wu ; do
       for c in ti li pi ; do
         for d in ka ta ra ; do
           for e in po so vo ; do
  	     echo "C'est pas là: $a$b$c$d$e"
  	   done
	 done
       done
     done
   done) | sort -R | while read line ; do
     cpt=`expr $cpt + 1`
     echo $line > $dir/$cpt
   done 
done

# Rq: il faut que tous les fichiers aient exactement la même taille

# Q1: Trouver l'info dans le fichier où il est écrit 'ici'
echo "Et c'est ici: dewulitavo" > `grep --files-with-matches dewulitavo aa/*`

# Q2: Trouver l'info dans le fichier où il est écrit 'ici' en début de fichier
echo "C'est pas ici:xeguliravo" > `grep --files-with-matches xeguliravo bb/*`
echo "ici c'est bon:derupirapo" > `grep --files-with-matches derupirapo bb/*`

# Q3: Trouver l'info dans le fichier où il est écrit 'plutot la' sans accent (sans tenir compte de la casse)
echo "aH pLutOT lA: bewulikavo" > `grep --files-with-matches bewulikavo cc/*`

# Q4: Trouver l'info dans le fichier où on trouve plus de trois a d'affilé
echo "Non, pas laa: derupikavo" > `grep --files-with-matches derupikavo dd/*`
echo "Oui, laaaaaa: begutikapo" > `grep --files-with-matches begutikapo dd/*`

# Q5: Trouver l'info dans le fichier où on trouve plus de trois voyelles d'affilé
echo "Non, pas laa: xerulitapo" > `grep --files-with-matches xerulitapo ee/*`
echo "Noon, pas la: beruliraso" > `grep --files-with-matches beruliraso ee/*`
echo "oui, ici    : xerulitapo" > `grep --files-with-matches xerulitapo ee/*`
echo "oui42 -> non: bewupikavo" > `grep --files-with-matches bewupikavo ee/*`

for f in `find -type f` ; do
  iconv -f ISO_8859-1 -t utf8 -o /tmp/AZE $f && mv /tmp/AZE $f
done
  

#exit 0
#-------------------------------------------------------------------------
echo "Sol Q1: "
echo -n "  "
grep ici  aa/*

echo "Sol Q2: "
echo -n "  "
grep ^ici bb/*

echo "Sol Q3: "
echo -n "  "
grep -i plutot cc/*

echo "Sol Q4: "
echo -n "  "
grep aaa dd/*

echo "Sol Q5: "
echo -n "  "
grep  \[aeiou\]\[aeiou\]\[aeiou\]  ee/*



rm -f /tmp/.cmd

echo done > /tmp/.katacoda-finished
