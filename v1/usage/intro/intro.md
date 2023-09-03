Il s'agit d'une fenêtre noire (le plus souvent) dans laquelle on peut
interagir avec le système d'exploitation directement en mode texte. Le
terminal rend en gros les mêmes services que votre navigateur de
fichiers : on peut se déplacer sur le disque, consulter le contenu des
répertoires, exécuter des programmes et déplacer des fichiers. Mais on
le fait au clavier, presque sans la souris.

Ce n'est pas très attirant à priori, mais cette approche est très puissante. Au
lieu de simplement double-cliquer sur un programme, on peut passer des
paramètres avancés simplement en les écrivant après le nom du programme à
exécuter. Pour sélectionner les fichiers, on a des moyens beaucoup plus précis
qu'un simple glissé-lâché dans une zone. Les programmes se combinent très bien,
et on peut même faire des scripts très facilement. Alors c'est vrai, il faut
taper les choses, mais en fait, le terminal regorge de trucs de fainéants pour
taper moins. Il y a un vrai risque pour que vous *appréciez* ce système après
l'avoir découvert.

Marre de passer des heures à cliquer sur vos fichiers pour convertir vos bmp en
gif, ou pour renommer les photos de vos dernières vacances ? Quand vous saurez
vous servir du shell, tout ceci ne sera plus qu'un mauvais souvenir.

# Qu'est ce que cet environnement "Katacoda" ?

Katacoda permet de faire des exercices interactifs en ligne de commande depuis
une simple page web. La zone noire à droite n'est pas un émulateur, mais bien un
vrai terminal, connecté à une machine virtuelle s'exécutant quelque part sur
internet. Tout se passe exactement comme si vous utilisiez le terminal qui vient
avec votre ordinateur.

On pourrait effectivement tout faire dans un terminal local, mais ce
serait moins pratique. Katacoda permet de faire des exercices
autocorrigés, et vous ne pouvez rien casser dans l'environnement
virtuel. Si vous effacez des fichiers importants de votre ordinateur,
le réparer peut s'avérer difficile. Mais si vous endommagez le système
utilisé ici, il suffit de recharger la page de votre navigateur pour
rebooter. Toutes vos modifications sont alors annulées.

**Si Katacoda fonctionne mal pour vous,** j'en suis désolé. Je n'ai
aucun contrôle sur les évolutions de cet outil, qui cassent parfois
mes exercices. Je tente de corriger quand je peux, mais vous pouvez
aussi utiliser [la version CoCalc](https://github.com/UGLimusic/decouverte_shell)
de ces exercices. Merci à Fred Leleu pour la conversion.

# Premières commandes

Dans la fenêtre à droite, le signe ```$``` s'appelle un *prompt*.
C'est ainsi que le système vous invite à écrire votre prochaine
commande. Essayez de taper n'importe quoi (par exemple, la commande
```fgddfssdfg```{{execute}}) : Le système vous dira qu'il n'a pas
trouvé cette commande. Notez que dans katacoda, les boutons noirs
ressemblant à ```fgddfssdfg```{{execute}} permettent d'écrire leur
contenu dans le terminal juste en cliquant dessus. Essayez, c'est très
pratique.

Mais ```fgddfssdfg```{{execute}} ne fonctionne pas, arrêtez d'insister.
Utilisez plutôt les commandes ```date```{{execute}} pour connaître l'heure là où
tourne votre machine virtuelle, ```cal```{{execute}} pour voir le calendrier de
ce mois, ou encore ```df```{{execute}} ou ```free```{{execute}} pour voir la place
libre respectivement sur le disque (df=disk free) ou en mémoire.

Le résultat de ```free``` n'est pas très lisible ? Ajoutez l'option ```-k```
pour lui demander de parler en kilo-octets (```free -k```{{execute}}
avec une espace entre la commande et l'option), ```-m``` pour avoir
des kilo-octets, ou carrément ```-h``` pour lui dire que vous êtes un
humain (et non un programme) et que vous voulez la meilleure unité
possible. Allez-y, essayez.

Marre de taper les lettres de ```free``` à chaque fois ? Utilisez les flèches
pour retrouver ce que vous venez d'écrire et le modifier avant de refaire
entrée. Vous voulez effacer le mot à gauche du curseur? Esc-Backspace
est le raccourci que vous cherchez. Il y en a
[énormément](https://readline.kablamo.org/emacs.html)
d'[autres](https://github.com/chzyer/readline/blob/master/doc/shortcut.md).

Vous ne vous souvenez plus des options d'un programme ? Consultez le
manuel en tapant par exemple ```man free```{{execute}}. Vous pouvez
naviguer dans le manuel grâce aux flèches. Chercher une chaîne
particulière se fait avec ```/``` suivi de la chaîne à chercher, suivi
de Entrée. Quitter le manuel se fait avec avec la touche ```q```, et
on voit la liste des commandes du programme d'affichage avec ```h```.
Si l'affichage devient fou, changer la taille de la fenêtre de votre
navigateur web réinitialise l'affichage du terminal. 

Comment faire pour afficher toute l'année avec ```cal```{{execute}}?
C'est écrit dans le manuel (```man cal```{{execute}}), mais certes pas
de façon très compréhensible. Le manuel permet de retrouver ce qu'on
connaît, mais il faut connaître. Et encore, la page de ``cal`` est
presque lisible, par rapport par exemple à la liste des raccourcis
claviers pour du shell, qui est cachée au fond de ```man
readline```{{execute}}. Les lignes de synopsis (qui indiquent comment
on peut utiliser la ``cal``) terminent toutes par ``[[month] year]``.
Les crochets indiquent que cette partie est optionnelle: on peut
invoquer cal sans aucun paramètre, ou avec un paramètre qui sera
compris comme l'année, ou avec deux paramètres qui seront compris
comme le mois puis l'année. Affichez l'année de votre naissance, pour
voir. Vous êtes né·e un jeudi, vous aussi ?

La chose importante à comprendre pour l'instant, c'est que toutes les lignes
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
de droite. Utilisez le bouton "Continuer" tout en bas pour valider.

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

>>Que se passe-t-il après la commande suivante: echo 'Bonjour tout le monde!'<<
( ) Cela affiche 'Bonjour tout le monde!' (avec les guillemets)
(*) Cela affiche Bonjour tout le monde! (sans les guillemets)
( ) Cela affiche un message d'erreur car la commande echo n'existe pas.
( ) Je n'arrive pas à savoir: je me suis trompé en recopiant car je ne sais pas que Ctrl-Inser et Shift-Inser permettent de copier/coller facilement en shell.

## Exercice

Sous Unix, l'heure est codée en comptant le nombre de seconde depuis
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

