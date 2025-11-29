# Chercher des fichiers

Il arrive souvent qu'on ait besoin de retrouver un fichier sur son
disque. Deux commandes sont bien pratiques en pareille situation.

La commande ``locate`` utilise une base de données des fichiers sur
disque et permet de retrouver très rapidement un fichier par son nom.
Le défaut est qu'il faut que le fichier soit là depuis assez longtemps
pour qu'il ait été indexé dans la base. Mais si vous cherchez un
fichier dont vous connaissez une partie du nom sans savoir du tout où
il se trouve, cette commande est faite pour vous. Essayez par exemple
```locate README```, qui va trouver tous les fichiers dont le nom est
`README`. Il n'y en a finalement pas beaucoup sur un système minimal
comme celui-ci, mais vous voyez l'idée.

La commande ``find`` permet quant à elle de fouiller le disque de
façon bien plus appronfondie. Par exemple, la commande ```find ddd
-name "pas-la"``` cherche dans le répertoire ``ddd`` un fichier dont
le nom est "pas-la" (il y en a un, juste pour l'exemple).

La commande ``find`` offre de nombreuses autres possibilités, que vous
pourrez découvrir en lisant la documentation avec ```man find```.
Cela vous permettra de répondre aux questions suivantes.

Comme précédement, pas question de retaper la ligne de commande en
entier à chaque tentative. Soyez fainéants. Utilisez l'historique des
commandes, et faites des copier/coller (avec Ctrl+Inser et Shift+Inser).
Les informaticiens sont de grands fainéants prêts à tout pour faire
travailler l'ordinateur à leur place.

### Dans le répertoire aaa

Un fichier nommé 'ici' se cache quelque part dans le répertoire 'aaa',
mais la commande ```tree``` n'aide pas beaucoup. Il va
falloir utiliser ``find``!

Commencez par vous rendre dans le bon répertoire avec ```cd ~/aaa```

1. Que contient ce fichier 'ici'?
    - R:= depikapolu

### Dans le répertoire bbb

Cette fois, on ne connaît même pas le nom du fichier. On sait juste
que c'est un fichier, et que le prédicat ``-type`` de ``find`` peut
nous aider.

Notez que pour chercher dans le manuel, il faut appuyer sur la touche
'/' après l'avoir ouvert avec ```man find```. Tapez ensuite
la chaîne à chercher (par exemple ``-type``) et entrée. On saute à
l'occurence suivante avec 'n' (précédente avec 'N'), et on quite le
manuel avec 'q'.

Commencez par vous rendre dans le bon répertoire avec ```cd ~/bbb```

2. Que contient le fichier caché dans 'bbb'?
    - R:= bepitasolu

### Dans le répertoire ccc

Il y a maintenant une multitude de fichiers, et on cherche celui dont
la taille est supérieure à zéro. Les prédicats ``-size`` ou 
``-empty`` vont probablement nous rendre service, ainsi que les
connecteurs logiques ``-and`` et ``-or``.

Commencez par vous rendre dans le bon répertoire avec ```cd ~/ccc```

3. Que contient le fichier caché dans 'ccc'?
    - R:= deliravo

### Dans le répertoire ddd

Cette fois, il y a une multitude de fichier, et il faut utiliser celui
modifié plus récemment que le fichier ``timestamp`` placé à la racine.
Notez que c'est bien la date de dernière modification qui compte.
Chaque fichier a trois dates: dernier accès, dernière modification du
contenu et dernier changement des méta-données (permissions,
propriétaire, etc). Faites ```stat ddd``` pour voir plus 
d'informations sur ce répertoire que nécessaire, et cherchez comment
sélectionner un fichier en fonction de son âge dans la page de manuel
de `find`.

Commencez par vous rendre dans le bon répertoire avec ```cd ~/ddd```

4. Que contient le fichier caché dans 'ddd'?
    - R:= xepitapozu

<div id="tg-feedback" class="alert" role="alert" style="display: none">

Bravo, vous êtes maintenant capable de retrouver vos fichiers plus
vite avec un clavier qu'avec une souris. Vous pouvez maintenant passer
à l'exercice suivant avec ```shutorial run grepping```. Vous pouvez
aussi consulter la liste des exercices existants avec ```shutorial
list```.

</div>
