#! /bin/sh

find dir* -type d 2>/dev/null | sort | sed 's|^./||' | grep [a-zA-Z] > /tmp/.dir.got
cat > /tmp/.dir.expect <<EOF
dir1
dir1/dir2
dir1/dir2/dir3
dir4
EOF

find dir* -type f 2>/dev/null | sort -r | sed 's|^./||' > /tmp/.file.got
cat > /tmp/.file.expect <<EOF
dir4/doc3
dir1/dir2/doc1
dir1/dir2/dir3/doc2
EOF

sync
###################

if ! diff -u /tmp/.dir.got /tmp/.dir.expect ; then
    echo "Erreur: on dirait que vous n'avez la bonne arborescence (ligne en -: répertoire en trop; ligne en +: répertoire manquant)"
    exit 1
fi

if ! diff -u /tmp/.file.got /tmp/.file.expect ; then 
    echo "Erreur: on dirait que vous n'avez la bonne arborescence (ligne en -: fichier en trop; ligne en +: fichier manquant)"
    exit 1
fi

echo "done"
