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

Pour passer à la suite, il suffit de trouver le mot de passe qui se
trouve dans le fichier ``mot-de-passe``, et le recopier ci-dessous.

>>Quel est le contenu du fichier 'mot-de-passe' ?<<
=== poufpouf badaboum

>>Quelle information se cache à la fin du fichier 'cache-cache-passe' ?<<
=== Bop bop BOUM
