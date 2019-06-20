Après grep, nous allons voir dans cette leçon l'autre outil magique de
la ligne de commande. Il s'agit du programme ``sed``, l'éditeur de
flux. C'est un filtre qui fait des cherche/remplace avancés sur le
texte qu'il lit en entrée puis écrit le résultat en sortie.  Très
pratique pour remettre en forme les affichages d'un programme afin de
les rendre compatibles avec l'entrée d'un autre programme, ou
simplement pour les rendre jolies. Transformer un fichier json
récupéré sur internet en un fichier CSV utilisable dans LibreOffice Calc
peut se faire en ``sed``. Ce n'est pas trivial, mais j'ai l'impression
que j'irais plus vite en ``sed`` qu'avec ``python``, par exemple.

Mais commençons. 

``sed`` est donc un programme pour faire des
cherche/remplace du flux d'entrée vers le flux de sortie. Par exemple 
```echo Bonjour tout le monde | sed 's/Bonjour/Au revoir/'```{{execute}}
remplace ``Bonjour`` par ``Au revoir`` dans le flux. La puissance de
``sed`` vient du fait qu'il comprend les expressions régulières:
```echo Bonjour tout le monde | sed 's/^[[:alpha:]]*/Bonsoir/'```{{execute}}
remplace le premier mot (en fait, l'ensemble des lettres commençant
la ligne) par la chaîne ``Bonsoir``. 

On peut même utiliser les choses trouvées lors de la recherche dans le
remplacement. Dans 
```echo BonJour tout le monde | sed 's/^\([A-Z][a-z]*\)\([A-Z][a-z]*\)/\2\1/'```{{execute}},
on commence par attraper deux ensembles de lettres commançant chacun par une
majuscule (``\([A-Z][a-z]*\)\([A-Z][a-z]*\)`` -- les parenthèses
disent qu'on va réutiliser le contenu de ces groupes), puis on réécrit
d'abord le second groupe avant le premier (``\2\1``). Je vous avais dit
que "très années 70" en informatique voulait dire "affreusement
préhistorique", mais cela reste extrêmement puissant.

Par défaut, le cherche/remplace s'applique au plus une fois par ligne
de l'entrée, et il faut ajouter ``g`` en fin de commande pour le faire
plusieurs fois: ```echo Bonjour toi | sed 's/o/O/g'```{{execute}}.
Essayez de supprimer ce ``g`` pour voir. Si on veut une recherche qui
ne tienne pas compte des majuscules/minuscules, il faut ajouter
l'option ``i`` après la commande: 
```echo bOnJour tOi | sed 's/o/X/i'```{{execute}}. Oui, cette dernière
commande est un peu frustrante quand on appuie sur le bouton car seul
le premier ``o`` est converti, mais vous devriez parvenir à corriger ça.

Comme avec grep, la [page
wikipédia](https://fr.wikipedia.org/wiki/Stream_Editor#Utilisation)
est plus compréhensible que le manuel, mais ce n'est pas la panacée.
Quand vous aurez compris, allez améliorer la page de wikipédia, pour
les prochains.

## Exercice

Vous trouverez dans ce répertoire un fichier
``Ce_siecle_avait_deux_ans.txt`` contenant un extrait d'un poême de
Victor Hugo (sans les accents, pour simplifier l'exercice).

### Question 1: sans o

Faites un fichier ``deux_ans-sans_o`` contenant l'extrait, privé de
tous ses 'o'.

### Question 2: sans voyelle

Faites un fichier ``deux_ans-sans_voyelle`` contenant l'extrait, privé de
toutes ses voyelles. Mais attention, on ne veut pas changer la
dernière ligne du fichier, qui contient le nom de l'auteur. Il va
falloir la traiter à part, avec une séquence de commandes séparée.

### Question 3, poil aux doigts

Cette question est d'un humour potache déplorable, j'en suis désolé.
Il s'agit de faire un fichier nommé ``deux_ans-poil_aux_dents``, en
complétant chaque vers par "(poil aux dents)", "(poil aux doigts)" ou
"(poil au nez)" quand cela s'applique. Si. Désolé. Pourtant j'aime ce
poème.

Bien sûr, la modification ne doit porter que sur le dernier son de
chaque ligne, avant les signes de ponctuation. Comme il y a plusieurs
rimes à modifier, dont certaines ne s'orthographient pas de la même
façon, il semble plutôt difficile de réussir à faire toutes les
transformations en une seule commande ``sed``. Libre à vous de tenter
le parfait coup de golf en une seule commande pour tout faire, ou
d'être plus pragmatique en tubant plusieurs commandes d'affilé.

Ce qui est sûr, c'est que la ligne va vite devenir trop longue pour
être agréable. Le mieux est de l'éditer dans un petit éditeur, en
appuyant sur ``Ctrl-x Ctrl-e`` après l'avoir retrouvée dans
l'historique. Quand on quite l'éditeur, la nouvelle version de la
commande est lancée. Décidément, ce shell est agréable à l'usage
malgré son look.

## En conclusion

Nous n'avons fait qu'effleurer les capacités du programme ``sed``.
Je n'ai malheureusement pas trouvé de jeu en ligne pour vous permettre
d'apprendre les subtilités de cette commande de façon ludique, mais les
jeux sont d'une autre nature autour de ``sed``. Faire des
cherche/remplace n'est que l'une des fonctions offertes, ce qui
explique la présence du 's' pour substituer au début de chaque
commande. Il est possible de faire des programmes complets en sed. La
documentation montre comment émuler plusieurs programmes avec des
scripts sed (```info sed Examples```{{execute}}), et on trouve même
une [implémentation](https://aurelio.net/projects/sedsokoban/) du jeu
sokoban écrite en script sed... 


Comme d'habitude, le script ```seding-check.sh```{{execute}} vous
montrera la différence entre le texte que vous avez produit et ce qui
était attendu.
