# Qu'est ce que le shell

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

Marre de passer des heures à cliquer sur vos fichiers pour convertir
vos bmp en gif, ou pour renommer et convertir les photos de vos
dernières vacances ? Fatigués des webapps bardées de publicités pour
regrouper vos pdfs en un seul fichier ? Quand vous saurez vous servir
du shell, tout ceci ne sera plus qu'un mauvais souvenir.

# Qu'est ce que cet environnement "Shutorial" ?

Le shutorial (shell tutorial) permet de faire des exercices
interactifs en ligne de commande. Normalement, si vous lisez ce texte,
c'est que vous avez démarré le premier exercice en ligne de commande
puis que vous avez cliqué sur le lien proposé pour lire l'énoncé. Si
ce n'est pas le cas, ouvrez un terminal puis tapez ```shtrl run
intro``` dans la fenêtre qui s'ouvre.

Le shutorial propose donc plusieurs exercices à faire dans le terminal
pour apprendre pas-à-pas le fonctionnement de cet environnement. À
chaque fois, vous devrez faire des manipulations dans le terminal
et/ou résoudre des quizz dans la page web.

Faites bien attention à faire les manipulations dans l'environnement
du shutorial et non dans votre environnement de travail habituel, car
les manipulations de certains exercices pourraient endommager votre
système si vous vous trompez. Pour reconnaître, remarquez que tous
terminaux du shutoriel commencent par la chaîne de caractères
```SHuToRiaL:~ $ ``` Si votre terminal affiche autre chose, ne tapez
pas les commandes du shutorial !

# Premières commandes

La chaîne ```SHuToRiaL:~ $``` affichée par le terminal du shutorial
s'appelle un *prompt*.  C'est ainsi que le système vous invite à
écrire votre prochaine commande. Essayez de taper n'importe quoi (par
exemple, la commande ```fgddfssdfg```) : Le système vous dira qu'il
n'a pas trouvé cette commande. Notez que dans le shutorial, les
boutons noirs ressemblant à ```fgddfssdfg``` représentent du texte
qu'il est conseillé de copier pour le coller dans le terminal.
Attention, le terminal est un peu particulier : il faut faire
Shift-Ctrl-V ou bien Shift-Inser pour coller dans cette application
(ainsi que Shift-Ctrl-C ou bien Ctrl-Inser pour copier). Essayez,
c'est très pratique.

Mais ```fgddfssdfg``` ne fonctionne pas, arrêtez d'insister.
Utilisez plutôt les commandes ```date``` pour connaître l'heure là où
tourne votre machine virtuelle, ```cal``` pour voir le calendrier de
ce mois, ou encore ```df``` ou ```free``` pour voir la place
libre respectivement sur le disque (df=disk free) ou en mémoire.

Le résultat de ```free``` n'est pas très lisible ? Ajoutez l'option ```-k```
pour lui demander de parler en kilo-octets (en tapant ```free -k```
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
manuel en tapant par exemple ```man free```. Vous pouvez
naviguer dans le manuel grâce aux flèches. Chercher une chaîne
particulière se fait avec ```/``` suivi de la chaîne à chercher, suivi
de Entrée. Quitter le manuel se fait avec avec la touche ```q```, et
on voit la liste des commandes du programme d'affichage avec ```h```.
Si l'affichage devient fou, changer la taille de la fenêtre de votre
navigateur web réinitialise l'affichage du terminal. 

Comment faire pour afficher toute l'année avec ```cal```?
C'est écrit dans le manuel (```man cal```), mais certes pas
de façon très compréhensible. Le manuel permet de retrouver ce qu'on
connaît, mais il faut connaître. Et encore, la page de ``cal`` est
presque lisible, par rapport par exemple à la liste des raccourcis
claviers pour du shell, qui est cachée au fond de ```man
readline```. Les lignes de synopsis (qui indiquent comment
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

1. Quel est l'autre nom de l'invite de commande (le '$' en début de ligne)
     - (x) prompt
     - ( ) login
     - ( ) shell
     - ( ) terminal

2. Que se passe-t-il si on appuie sur Entrée sans rien taper à l'invite ?
     - ( ) Rien ne se passe.
     - (x) Une autre invite de commande est affichée en dessous.
     - ( ) La dernière commande tapée est réexécutée.
     - ( ) Un nouveau shell démarre.

3. Que se passe-t-il si on appelle une commande qui n'existe pas?
     - ( ) Rien ne se passe.
     - ( ) Cela fait une alerte de sécurité à l'administrateur.
     - (x) On obtient un message d'erreur, puis une autre invite.
     - ( ) Un nouveau shell démarre.

4. Que se passe-t-il après la commande suivante: `echo 'Bonjour tout le monde!'`
     - ( ) Cela affiche 'Bonjour tout le monde!' (avec les guillemets)
     - (x) Cela affiche Bonjour tout le monde! (sans les guillemets)
     - ( ) Cela affiche un message d'erreur car la commande echo n'existe pas.
     - ( ) Je n'arrive pas à savoir: je me suis trompé en recopiant car j'ai oublié que Shift-Ctrl-V out Shift-Inser permettent de coller facilement en shell.

## Exercice

Sous Unix, l'heure est codée en comptant le nombre de seconde depuis
le premier janvier 1970. La commande ```date``` peut être utilisée
pour convertir un nombre de secondes en une date lisible. Pour
convertir l'instant 12345 en date lisible, on utilise 
```date --date="@12345"```.

1. En quelle année a eu lieu l'instant 123456789?
    - R:= 1973

2. En quelle année a eu lieu l'instant 1234567890?
    - R:= 2009

3. En quelle année aura lieu l'instant 12345678901?
    - R:= 2361

Notez que si vous cliquez sur "Check" ci-dessous, toutes les réponses
fauses apparaîtront en rougepour vous permettre de voir ce qu'il vous
reste à faire.

