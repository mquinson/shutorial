# Éditer des flux à la volée

Après avoir vu comment rediriger les flux d'un programme vers l'autre,
nous allons aller plus loin dans cette leçon, en éditant les flux à la
volée. Cela se fait avec le deuxième outil magique de la ligne de
commande (avec grep) : le programme ``sed``. C'est un filtre qui fait
des cherche/remplace avancés sur le texte qu'il lit en entrée puis
écrit le résultat en sortie.  Très pratique pour remettre en forme les
affichages d'un programme afin de les rendre compatibles avec l'entrée
d'un autre programme, ou simplement pour les rendre jolies.
Transformer un fichier json récupéré sur internet en un fichier CSV
utilisable dans LibreOffice Calc peut se faire en ``sed``. Ce n'est
pas trivial, mais j'ai l'impression que j'irais presque plus vite en
``sed`` qu'avec ``python``, par exemple.

Mais commençons. 

``sed`` est donc un programme pour faire des cherche/remplace du flux
d'entrée vers le flux de sortie. Par exemple ```echo Bonjour tout le
monde | sed 's/Bonjour/Au revoir/'``` remplace ``Bonjour`` par ``Au
revoir`` dans le flux. La syntaxe de la commande sed est assez simple:
Le premier `s` signifie qu'on veut faire un cherche/remplace (substitute
en anglais). Ensuite on a la chaîne cherchée entre les deux symboles
`/` (ici, `Bonjour`). Vient ensuite ce par quoi il faut remplacer ce
qu'on a trouvé (ici, `Au revoir`) terminé par un troisième `/`.

Au total, la commande sed utilisée est `s/Bonjour/Au revoir/`. On
ajoute une paire de guillemets pour éviter que le shell coupe la
commande sur les espaces et dise à `sed` qu'il a reçu deux arguments 
(`s/Bonjour/Au` d'une part et `revoir/` d'autre part), car sed aurait
du mal à s'y retrouver.

La puissance de ``sed`` vient du fait qu'il comprend les expressions
régulières: `echo Bonjour tout le monde | sed 's/^[[:alpha:]]*/Bonsoir/'` 
remplace le premier mot par la chaîne ``Bonsoir``. En fait, cette commande attrape un ensemble de lettres
car `[[:alpha:]]` attrape n'importe quelle lettre et l'étoile demande
de répéter l'élément suivant autant de fois que possible, donc on
attrape toutes les lettres. Comme il y a `^` tout au début de la
commande, on demande à ce que cet ensemble de lettre soit placé au
début de la ligne.

Prenez le temps de copier/coller ces commandes dans le terminal et de
tenter de les modifier un peu pour mieux comprendre ce qui se passe.
Essayez par exemple de prédire ce qui se passe si l'on remplace le
caractère '^' par ' ' dans la dernière commande avant de vérifier dans
le terminal.

On peut même utiliser les choses trouvées lors de la recherche dans le
remplacement. Dans 
```echo BonJour tout le monde | sed 's/^\([A-Z][a-z]*\)\([A-Z][a-z]*\)/\2\1/'```,
on commence par attraper deux ensembles de lettres commançant chacun par une
majuscule (``\([A-Z][a-z]*\)\([A-Z][a-z]*\)`` -- les parenthèses
disent qu'on va réutiliser le contenu de ces groupes), puis on réécrit
d'abord le second groupe avant le premier (``\2\1``). Je vous avais dit
que "très années 70" en informatique voulait dire "affreusement
préhistorique", mais cela reste extrêmement puissant. Essayez d'écrire
une commande sed inversant les deux premiers mots de l'entrée.

Par défaut, le cherche/remplace s'applique au plus une fois par ligne
de l'entrée, et il faut ajouter ``g`` en fin de commande pour le faire
plusieurs fois: ```echo Bonjour toi | sed 's/o/O/g'```.
Essayez de supprimer ce ``g`` pour voir. Si on veut une recherche qui
ne tienne pas compte des majuscules/minuscules, il faut ajouter
l'option ``i`` après la commande: 
```echo bOnJour tOi | sed 's/o/X/i'```. Oui, cette dernière
commande est un peu frustrante car seul le premier ``o`` est converti, 
mais vous devriez parvenir à corriger ça.

Comme avec grep, la [page
wikipédia](https://fr.wikipedia.org/wiki/Stream_Editor#Utilisation)
est plus compréhensible que le manuel, mais ce n'est pas la panacée.
Quand vous aurez compris, allez améliorer la page de wikipédia, pour
les prochains.

## Exercice avec sed

Vous trouverez dans ce répertoire un fichier
``Ce_siecle_avait_deux_ans.txt`` contenant un extrait d'un poême de
Victor Hugo (sans les accents, pour simplifier l'exercice).

### Question 1: sans o

Faites un fichier ``deux_ans-sans_o`` contenant l'extrait, privé de
tous ses 'o'.

Comme d'habitude, le script ```shtrl-check``` vous montrera la
différence entre le fichier que vous avez produit et ce qui était
attendu.

### Question 2: sans voyelle

Faites un fichier ``deux_ans-sans_voyelle`` contenant l'extrait, privé de
toutes ses voyelles. Mais attention, on ne veut pas changer la
dernière ligne du fichier, qui contient le nom de l'auteur. Il va
falloir la traiter à part, avec une séquence de commandes séparée.

### Question 3, poil aux doigts

Cette question est d'un humour potache déplorable, j'en suis désolé.
Il s'agit de faire un fichier nommé ``deux_ans-poil_aux_dents``, en
complétant chaque vers par "(poil aux dents)", "(poil aux doigts)",
"(poil au nez)" ou "(poils aux guiboles)" quand cela s'applique. Si. Désolé.

Bien sûr, la modification ne doit porter que sur le dernier son de
chaque ligne, avant les signes de ponctuation. Comme il y a plusieurs
rimes à modifier, dont certaines ne s'orthographient pas de la même
façon, il semble plutôt difficile de réussir à faire toutes les
transformations en une seule commande ``sed``. Libre à vous de tenter
le parfait coup de golf en une seule commande pour tout faire, ou
d'être plus pragmatique en tubant plusieurs commandes sed d'affilé. Quand
on a un problème à résoudre dans le shell, il y a toujours plusieurs
solutions.

Ce qui est sûr, c'est que la ligne va vite devenir trop longue pour
être agréable. Le mieux est de l'éditer dans un petit éditeur, en
appuyant sur ``Ctrl-x Ctrl-e`` après l'avoir retrouvée dans
l'historique. Quand on quite l'éditeur, la nouvelle version de la
commande est lancée. Si ça ne fait pas ce qu'il fallait, flèche vers
le haut puis de nouveau ``Ctrl-x Ctrl-e``. Décidément, ce shell est
agréable à l'usage malgré son look.

## Aller plus loin avec sed

Nous n'avons fait qu'effleurer les capacités du programme ``sed``.
Je n'ai malheureusement pas trouvé de jeu en ligne pour vous permettre
d'apprendre les subtilités de cette commande de façon ludique, mais les
jeux sont d'une autre nature autour de ``sed``. Faire des
cherche/remplace n'est que l'une des fonctions offertes, ce qui
explique la présence du 's' pour substituer au début de chaque
commande. Il est possible de faire des programmes complets en sed. La
documentation montre comment émuler plusieurs programmes avec des
scripts sed (```info sed Examples```), et on trouve même
une [implémentation](https://aurelio.net/projects/sedsokoban/) du jeu
sokoban écrite en script sed... 

# Réécriture de flux mais pas ligne à ligne

``sed`` est très puissant, mais il ne permet pas facilement de traiter
plus d'une ligne à la fois. Les gourous ``sed`` les plus avancés
savent faire, mais ce n'est pas la façon la plus simple. Une bonne
alternative est d'utiliser la commande ``tr``. Elle est plus limitée
avec les expressions régulières, mais permet de définir simplement des
translitérations. Dans l'usage le plus simple, on donne une liste de
lettres à chercher puis une liste de lettre par quoi remplacer chaque
lettre trouvée. Par exemple 
```cat Ce_siecle_avait_deux_ans.txt | tr 'a' 'o'```
affiche le texte en entrée en remplaçant tous les a par des o. 
```cat Ce_siecle_avait_deux_ans.txt | tr '[a-z]' '[A-Z]'```
met tout en majuscule.
```cat Ce_siecle_avait_deux_ans.txt | tr -d ' '```
supprime tous les espaces (l'option ``-d`` demande la suppression).

## Exercice avec tr 

Vous pouvez refaire les questions 1 et 2 ci-dessus avec ``tr``.

### Question 4: rot13

Faites un fichier ``deux_ans-rot13`` contenant l'extrait, encodé en
rot13. Référez-vous à la [page wikipédia
correspondante](https://fr.wikipedia.org/wiki/ROT13) au besoin. Vous
veillerez à respecter les majuscules et minuscules dans votre encodage.

### Question 5: Un paragraphe par ligne

Le fichier ``Sept d'un coup.txt`` contient le résumé d'un compte de
Grimm, tel que rapporté par Wikipédia. La mise en page de ce fichier
est justifiée au fer droit, mais on voudrait écrire un paragraphe par
ligne pour bénéficier de la mise en page automatique à l'affichage.

La première difficulté est que ce nom de fichier n'est pas très
pratique dans le terminal. Il y a des espaces, qui d'habitude séparent
les paramètres, et un guillemet (``'``) qui a également une
signification particulière pour le shell. Il faut protéger ce nom
quand on l'utilise en ligne de commande. Fort heureusement, la
complétion automatique peut se charger de cette protection : tapez par
exemple ``cat Sept`` puis appuyez sur la touche Tabulation. Voilà. Ces
caractères rendent ce nom utilisable en shell. Le plus simple est
d'éviter les caractères bizares dans les noms des fichiers qu'on
manipule dans le shell, mais on peut toujours s'en sortir.

Faites maintenant un fichier ``7_lignes.txt`` contenant ce texte avec
chaque paragraphe placé sur une seule ligne. Il ne faut pas toucher
aux deux dernières lignes, qui ne font pas partie du texte mais
indiquent plutôt la source de ce texte. Le fichier produit doit donc
faire 7 lignes: 5 paragraphes, et 2 lignes inchangées en dessous du
texte. Faites également en sorte pour que les espaces consécutives
soient remplacées par une seule espace. Sur les deux dernières lignes,
il faut même supprimer toute espace placée avant le texte.

Comme précédement, si votre commande devient trop compliquée à
modifier dans le terminal, tapez ``Ctrl-x Ctrl-e`` pour l'éditer dans
un vrai éditeur. Cet outil s'appelle nano, et il est assez pratique
pour commencer. C'est fou mais les adeptes de la ligne de commande
adorent s'écharper sur le choix de l'éditeur de texte. Mais vous
pouvez garder ``nano`` tant que vous ne savez pas si vous êtes faits
pour ``vim`` ou ``emacs``.


Comme d'habitude, le script ```shtrl-check``` vous montrera la
différence entre le texte que vous avez produit et ce qui était
attendu.

1. Quel est le code de victoire de cet exercice, tel qu'affiché par ```shtrl-check```?
    - R:= 7b050f10f86034b7bf2a884a281843a88e9a0c92

<div id="tg-feedback" class="alert" role="alert" style="display: none">

Voilà, vous connaissez grep, sed et les tubes, vos trois meilleurs
amis dans le terminal.

Malheureusement, vous venez de finir le dernier exercice du shutorial.
Vous allez devoir apprendre le reste par ailleurs, par exemple en
lisant ces livres et tutoriels:

 - https://linuxcommand.org/tlcl.php
 - https://www.dsl.org/cookbook/
 - http://www.ee.surrey.ac.uk/Teaching/Unix/
 - https://www.learnshell.org/

Si vous avez l'envie (et le courage) d'écrire des exercices pour le
shutorial, n'hésitez pas à proposer un patch au projet
https://github.com/mquinson/shutorial

</div>
