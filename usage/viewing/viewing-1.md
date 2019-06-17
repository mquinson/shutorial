Il existe de nombreuses commandes pour afficher le contenu des
fichiers à l'écran. La plus simple est ```cat fichier```{{execute}},
qui affiche le contenu du fichier sur la console. 

Si on affiche un fichier contenant non pas du texte mais du binaire,
on peut avoir des résultats surprenants: 
```cat fichier-binaire```{{execute}} affiche un fichier assez peu
intelligible en l'état. Si votre terminal est ... dérangé après un tel
affichage, il suffit de taper ```reset```{{execute}} pour tout
réinitialiser. 

Si le fichier est plus long, cette méthode permet assez facilement de
voir la fin du contenu. C'est déjà ça. Par exemple, 
```cat fichier_long```{{execute}} risque de vous remplir l'écran. Et
si on demande à afficher un programme binaire, c'est long ET illisible
à priori: ```cat /bin/cat```{{execute}} affiche le programme cat
lui-même. 

Si on veut voir le début d'un fichier, on peut utiliser la commande 
```head fichier_long```{{execute}} qui n'affiche que les premières
lignes du fichier passé. On peut aussi préciser que l'on veut les 50
premières lignes avec l'option ``-n``: ```head -n 50 fichier_long```{{execute}}

De même, la commande ```tail -n 10 fichier_long```{{execute}} permet
d'afficher les 10 dernières lignes d'un fichier long.
Enfin, la commande ```less fichier_long```{{execute}} permet
de se promener dans l'affichage d'un fichier : la navigation se fait avec
les mêmes raccourcis que le manuel (le manuel appelle ``less`` en interne).
Pour rappel : les flèches et page vers le haut/bas permettent de se déplacer
dans le fichier, 'q' quitte le programme, la recherche se fait avec '/',
'n' et 'N'.

Pour passer à la suite, il suffit de trouver différents mots de passe,
répartis dans différents fichiers du répertoire. ``Ctrl-C`` ne
fonctionne pas dans le terminal (c'est la séquence pour interrompre un
programme qui prend du temps). C'est agaçant, mais le terminal
existait plusieurs décennies avant que certains décident qu'on
utiliserait ``Ctrl-C`` pour copier. Dans le terminal il faut faire
``Ctrl-Inser`` pour copier, et ``Shift-Inser`` pour coller.

>>Quel est le contenu du fichier 'mot-de-passe' ?<<
=== poufpouf badaboum

>>Quelle information se cache à la fin du fichier 'cache-cache-passe' ?<<
=== Bop bop BOUM

>>Quelle information se cache au début du fichier 'cache-cache-passe' ?<<
=== Attention, attention

>>Quelle information se cache un peu après le début du fichier 'cache-cache-passe' ?<<
=== Plouf plouf

>>Quelle information se cache vers le millieu du fichier 'cache-cache-passe' ?<<
=== Bim bam

