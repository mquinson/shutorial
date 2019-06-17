Dans la fenêtre à droite, le signe ```$``` s'appelle un *prompt*. C'est ainsi
que le système vous invite à écrire votre prochaine commande. Essayez de taper
n'importe quoi (par exemple, la commande ```fgddfssdfg```{{execute}}) : Le
système vous dira qu'il n'a pas trouvé cette commande.

Utilisez plutôt les commandes ```date```{{execute}} pour connaître l'heure là où
tourne votre machine virtuelle, ```cal```{{execute}} pour voir le calendrier de
ce mois, ou encore ```df```{{execute}} ```free```{{execute}} pour voir la place
libre respectivement sur le disque (df=disk free) ou en mémoire.

Le résultat de free n'est pas très lisible ? Ajoutez l'option ```-m``` pour lui
demander de parler en Mega-octets, ou carrément ```-h``` pour lui dire que vous
êtes un humain (et non un script) et que vous voulez la meilleure unité
possible. Allez-y.

Marre de taper les lettres de ```free``` à chaque fois ? Utilisez les flèches
pour retrouver ce que vous venez d'écrire et le modifier avant de refaire
entrée. 

Vous ne vous souvenez plus des options d'un programme ? Consultez le manuel en
tapant par exemple ```man free```{{execute}}. Vous pouvez naviguer dans le
manuel grâce aux flèches. Chercher une chaîne
particulière se fait avec ```/``` suivi de la chaîne à chercher, suivi
de Entrée. Quitter le manuel se fait avec avec la touche ```q```, et
on voit la liste des commandes du programme d'affichage avec ```h```.

La chose importante à retenir avant de continuer, c'est que toutes les lignes
que vous taperez dans le terminal auront la même syntaxe (la même grammaire). En
français, les phrases les plus simples sont de la forme ```sujet verbe complément```. 
En ligne de commande, toutes les phrases sont de la forme
```verbe complément1 complément2 complément3 ...```. Les verbes sont les différents
programmes qu'on peut lancer, et les compléments sont les options et autres 
paramètres (tous séparés par des espaces). 
