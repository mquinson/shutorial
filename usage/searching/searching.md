Il arrive souvent qu'on ait besoin de retrouver un fichier sur son
disque. Deux commandes sont bien pratiques en pareille situation.

La commande ``locate`` utilise une base de données des fichiers sur
disque et permet de retrouver très rapidement un fichier par son nom.
Le défaut est qu'il faut que le fichier soit là depuis assez longtemps
pour qu'il ait été indexé dans la base. Mais si vous cherchez un
fichier dont vous connaissez une partie du nom sans savoir du tout où
il se trouve, cette commande est faite pour vous. Essayez par exemple
```locate python/README```{{execute}}, qui va trouver tous les
fichiers de nom README qui sont placés dans des répertoires python.
Étonnamment, il y en a plusieurs, même sur un système minimal comme
celui là.

La commande ``find`` permet de fouiller le disque de façon bien plus
appronfondie. Par exemple, la commande ```find ddd -name "pas-la"```{{execute}}
cherche dans le répertoire ``ddd`` un fichier dont le nom est "pas-la"
(il y en a un, juste pour l'exemple).

La commande ``find`` offre de nombreuses autres possibilités, que vous
pourrez découvrir en lisant la documentation avec ```man find```{{execute}}.
Cela vous permettra de répondre aux questions suivantes.

Comme précédement, pas question de retaper la ligne de commande en
entier à chaque tentative. Soyez fainéants. Utilisez l'historique des
commandes, et faites des copie/colle (avec Ctrl+Inser et Shift+Inser).
Les informaticiens sont de grands fainéants prêts à tout pour faire
travailler l'ordinateur à leur place.

### Dans aaa

Un fichier nommé 'ici' se cache quelque part dans le répertoire 'aaa',
mais la commande ```tree```{{execute}} n'aide pas beaucoup. Il va
falloir utiliser ``find``!

```cd ~/aaa```{{execute}}

>>Que contient ce fichier 'ici'?<<
=~= depikapolu

### Dans bbb

Cette fois, on ne connaît même pas le nom du fichier. On sait juste
que c'est un fichier, et que le prédicat ``-type`` de ``find`` peut
nous aider.

Notez que pour chercher dans le manuel, il faut appuyer sur la touche
'/' après l'avoir ouvert avec ```man find```{{execute}}. Tapez ensuite
la chaîne à chercher (par exemple ``-type``) et entrée. On saute à
l'occurence suivante avec 'n' (précédente avec 'N'), et on quite le
manuel avec 'q'.

```cd ~/bbb```{{execute}}

>>Que contient le fichier caché dans 'bbb'?<<
=~= bepitasolu

### Dans ccc

Il y a maintenant une multitude de fichier, et on cherche celui dont
la taille est supérieure à zéro. Les prédicats ``-size`` ou 
``-empty`` vont probablement nous rendre service, ainsi que les
connecteurs logiques ``-and`` et ``-or``.

```cd ~/ccc```{{execute}}

>>Que contient le fichier caché dans 'ccc'?<<
=~= deliravo

### Dans ddd

Cette fois, il y a une multitude de fichier, et il faut utiliser celui
modifié plus récemment que le fichier ``timestamp`` placé à la racine.
Notez que c'est bien la date de dernière modification qui compte.
Chaque fichier a trois dates: dernier accès, dernière modification du
contenu et dernier changement des méta-données (permissions,
propriétaire, etc). Faites ```stat ddd```{execute} pour voir plus 
d'informations sur ce répertoire que nécessaire.

```cd ~/ddd```{{execute}}

>>Que contient le fichier caché dans 'ddd'?<<<
=~= xepitapozu
