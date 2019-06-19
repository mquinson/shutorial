Dans la fenêtre à droite, le signe ```$``` s'appelle un *prompt*. C'est ainsi
que le système vous invite à écrire votre prochaine commande. Essayez de taper
n'importe quoi (par exemple, la commande ```fgddfssdfg```{{execute}}) : Le
système vous dira qu'il n'a pas trouvé cette commande.

Utilisez plutôt les commandes ```date```{{execute}} pour connaître l'heure là où
tourne votre machine virtuelle, ```cal```{{execute}} pour voir le calendrier de
ce mois, ou encore ```df```{{execute}} ```free```{{execute}} pour voir la place
libre respectivement sur le disque (df=disk free) ou en mémoire.

Le résultat de free n'est pas très lisible ? Ajoutez l'option ```-k```
pour lui demander de parler en kilo-octets (```date -k```{{execute}}
avec une espace entre la commande et l'option), ```-m``` pour avoir
des kilo-octets, ou carrément ```-h``` pour lui dire que vous êtes un
humain (et non un script) et que vous voulez la meilleure unité
possible. Allez-y, essayez.

Marre de taper les lettres de ```free``` à chaque fois ? Utilisez les flèches
pour retrouver ce que vous venez d'écrire et le modifier avant de refaire
entrée. 

Vous ne vous souvenez plus des options d'un programme ? Consultez le
manuel en tapant par exemple ```man free```{{execute}}. Vous pouvez
naviguer dans le manuel grâce aux flèches. Chercher une chaîne
particulière se fait avec ```/``` suivi de la chaîne à chercher, suivi
de Entrée. Quitter le manuel se fait avec avec la touche ```q```, et
on voit la liste des commandes du programme d'affichage avec ```h```.
Si l'affichage devient fou, il est souvent utile de redimensionner la
fenêtre de votre navigateur web.

La chose importante à retenir avant de continuer, c'est que toutes les lignes
que vous taperez dans le terminal auront la même syntaxe (la même grammaire). En
français, les phrases les plus simples sont de la forme ```sujet verbe complément```. 
En ligne de commande, toutes les phrases sont de la forme
```verbe complément1 complément2 complément3 ...```. Les verbes sont les différents
programmes qu'on peut lancer, et les compléments sont les options et autres 
paramètres (tous séparés par des espaces). 

## Quizz

Veuillez répondre à ces petites questions pour pouvoir passer à la
suite. Certaines réponses demandent d'avoir lu le texte ci-dessus,
mais pour d'autre, il faudra avoir essayé, directement dans la fenêtre
de droite. Utilisez le bouton "Continuer" tout en bas pour valider vos
réponses.

>>Quel est l'autre nom de l'invite de commande (le '$' en début de ligne)<<
(*) prompt
( ) login
( ) shell
( ) terminal

>>Que se passe-t-il si on appuie sur Entrée sans rien taper à l'invite ?<<
( ) Rien ne se passe.
(*) Une autre invite de commande est affichée en dessous.
( ) La dernière commande tapée est réexécutée.
( ) Un nouveau shell démarre.

>>Que se passe-t-il si on appelle une commande qui n'existe pas?<<
( ) Rien ne se passe.
( ) Cela fait une alerte de sécurité à l'administrateur.
(*) On obtient un message d'erreur, puis une autre invite.
( ) Un nouveau shell démarre.

Que se passe-t-il après la commande suivante: echo 'Bonjour tout le monde!'
( ) Cela affiche 'Bonjour tout le monde!' (avec les guillemets)
(*) Cela affiche Bonjour tout le monde! (sans les guillemets)
( ) Cela affiche un message d'erreur car la commande echo n'existe pas.
( ) Je n'arrive pas à savoir: je me suis trompé en recopiant car je ne sais pas que Ctrl-Inser et Shift-Inser permettent de copier/coller facilement en shell.

## Exercice

Sous Unix, l'heure est stoquée en comptant le nombre de seconde depuis
le premier janvier 1970. La commande ```date``` peut être utilisée
pour convertir un nombre de secondes en une date lisible. Pour
convertir l'instant 12345 en date lisible, on utilise 
```date --date="@12345"```{{execute}}.

>>En quelle année a eu lieu l'instant 123456789?<<
=~= 1973

>>En quelle année a eu lieu l'instant 1234567890?<<
=~= 2009

>>En quelle année aura lieu l'instant 12345678901?<<
=~= 2361

Notez que si vous cliquez sur "Continuer" ci-dessous, toutes les
réponses justes sont entourées de vert pour vous permettre de voir ce
qu'il vous reste à faire.
