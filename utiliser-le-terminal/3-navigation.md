Comme avec les autres systèmes d'exploitation, Linux range les fichiers dans une
arborescence de répertoires. Voici quelques commandes utiles:

- ```pwd```{{execute}} savoir où on est sur le disque (Print Working Directory)
- ```mkdir machin```{{execute}} créer un nouveau répertoire nommé machin
- ```ls```{{execute}} lister les fichiers et répertoires du répertoire courant
- ```cd machin```{{execute}} entrer dans le répertoire machin (Change Directory)
- ```pwd```{{execute}}
- ```cd ..```{{execute}} aller dans le répertoire "..", c'est-à-dire un étage plus haut
- ```pwd```{{execute}} 
- ```touch bidule```{{execute}} créer un répertoire vide nommé bidule
- ```ls```{{execute}} 
- ```rm bidule```{{execute}} effacer le fichier bidule. Attention, c'est une opération irréversible.
- ```ls```{{execute}} 
- ```rmdir machin```{{execute}} effacer le répertoire machin (il faut qu'il soit
  vide). On peut aussi utiliser ```rm -r machin```{{execute}} pour effacer
  récursivement ```machin``` et tout son contenu.
- ```ls```{{execute}} 

# Au travail

Il s'agit maintenant de créer l'aborescence suivante. Si ce n'est pas fait,
supprimez également le résultat de vos essais antérieurs.

```
📁 dir1
├── 📁 dir2
│   ├── 🖹 doc1
│   └── 📁 dir3
│       └── 🖹 doc2
└── 📁 dir4
    └── 🖹 doc3
```

Les logos sont juste pour l'explication, les noms de fichiers et répertoires ne
doivent contenir que des lettres et des chiffres dans cet exercice. 

Coincée? Utilisez la commande ```ls -R```{{execute}} pour afficher récursivement
le contenu de tous les répertoires. Vous pouvez aussi exécuter le programme de
test ```(cd ~/tutorial;/tmp/kc_verify2.sh)```{{execute}} à la main pour voir le
problème (il n'est pas nécessaire de comprendre ce que fait cette commande pour
l'utiliser, heureusement).

<!--
mkdir -p dir1/dir2/dir3
touch dir1/dir2/doc1
touch dir1/dir2/dir3/doc2
mkdir dir4
touch dir4/doc3
-->
