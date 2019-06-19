## Combiner des programmes

Jusqu'à présent, nous avons utilisé le terminal pour lancer des
programmes les uns après les autres, mais ça n'allait pas très loin
car ces programmes étaient très simples. Mais la puissance du shell ne
vient pas d'outils de plus en plus perfectionnés, mais plutôt de la
facilité avec laquelle on peut combiner des programmes simples pour
faire des outils parfaitements adaptés à la situation actuelle.

Le plus souvent, on ne fait même pas un script à proprement parler,
mais on combine plusieurs programmes sur la même ligne de commande.
On peut par exemple recompiler un programme, l'exécuter sur plusieurs
fichiers, vérifier que tout s'est bien passé puis effacer les fichiers
temporaires. Le tout en une seule commande, accessible simplement avec
flèche vers le haut.

Pour exécuter deux commandes à la suite, il suffit de les séparer par
``;`` ```touch temporaire; ls temporaire; rm temporaire```{{execute}}
va créer un fichier vide, afficher son nom puis le supprimer.

Parfois, on mais on ne veut lancer la seconde commande que si la 
première s'est bien passée. Pour cela, il faut écrire ``&&`` (lu "ET" 
logique) entre les deux commandes. Comparez le résultat de 
```ls OK && echo "le fichier existe"```{{execute}} et celui de
```ls GaBuZoMeu && echo "le fichier existe"```{{execute}}, sachant
que le premier existe mais pas le second.

À l'inverse, on peut vouloir ne lancer la seconde commande que si la
première a échoué. ```ls OK && echo "PROBLÈME!"```{{execute}} ou
```ls GaBuZoMeu && echo "PROBLÈME!"```{{execute}} 

On peut même grouper des commandes avec des parenthèses: l'ensemble
s'est bien passé si la dernière se passe bien.
```(ls GaBuZoMeu;ls présent) && echo "le fichier existe"```{{execute}}

Pour les plus courageux: Les commandes entre parenthèses s'exécutent
dans un autre contexte, donc ```(cd /)```{{execute}} ne change pas le
répertoire courant, seulement celui du contexte entre parenthèses.
Demandez à ``pwd`` (print working directory) ainsi si vous n'y croyez
pas: ```(cd / ; echo "changé:"; pwd) ; echo "pas changé:" ; pwd```{{execute}} 

## Rediriger l'entrée et la sortie

Il est très facile de capturer les affichages d'un programme dans un
fichier. Par exemple ```date > sortie```{{execute}} place
l'affichage de la commande à gauche du ``>`` dans un fichier nommé
``sortie`` (voir le contenu du fichier:  ```cat sortie```{{execute}}).
Le symbole ``>`` ne devrait pas se lire "plus grand" mais plutôt
"vers", comme une flèche: l'affichage du programme à gauche est
redirigé dans le fichier à droite.

Si on réexécute la première commande ```date > sortie```{{execute}},
le contenu du fichier ``sortie`` est réécrit. On peut ajouter à la fin
du fichier au lieu de le remplacer de la façon suivante : 
```date >> sortie```{{execute}}. 


On peut également faire le contraire, et demander à un programme de
lire son entrée dans un fichier. Par exemple, ce répertoire compte un
petit script permettant de calculer la somme de deux nombres.
Essayez-le: ```./plus.sh```{{execute}} (l'extension sh signifie qu'il
est écrit en shell). Au lieu de lire depuis le clavier, on peut faire
en sorte que ce script lise depuis un fichier. 

```echo 4 6 > fichier```{{execute}} permet de créer le fichier tandis
que ```./plus.sh < fichier```{{execute}} lance le script en redirigeant
son entrée standard depuis le fichier. 

On peut même rediriger à la fois l'entrée et la sortie d'un programme
de la façon suivante: ```./plus.sh < fichier > sortie```{{execute}}

Les redirections peuvent également être utilisée pour faire taire un
programme un peu trop bavard. Par exemple ```ls -lR /```{{execute}}
demande à afficher la liste complète de tous les fichiers du disque.
C'est beaucoup, et vous voulez probablement faire ``Ctrl-C`` pour
l'interrompre avant la fin. Mais si vous faites 
```ls -lR / > sortie```{{execute}}, vous ne voyez plus tout cet
affichage agaçant. Si vous voulez juste faire disparaître l'affichage
sans le sauvegarder sur disque, redirigez la sortie vers le fichier
``/dev/null`` qui est une sorte de trou noir où tout ce qui est écrit
est perdu.

Mais si vous faites ```ls GaBuZoMeu > /dev/null```{{execute}} ou 
```echo bla bla > fichier ; ./plus.sh < fichier```{{execute}}, vous
verrez quand même le message d'erreur s'afficher. Comment ce message
a-t-il réussi à s'échapper du trou noir ? C'est qu'en fait, tous les
programmes ont deux flux de sortie sur lesquels ils peuvent écrire: la
sortie standard (nommée ``stdout``) est celle par défaut. Le symbole
``>`` ne redirige que ``stdout`` sans toucher à ka sortie d'erreur
(nommée ``stderr``), qui continue donc à atterrir sur l'écran.
Cela permet aux programmes d'indiquer leurs problèmes même quand on a
redirigé leur sortie standard. Si on le souhaite, on peut rediriger ``stderr`` avec
``2>`` : ```ls GaBuZoMeu 2> erreur```{{execute}}  (inspectez
le fichier produit: ```cat erreur```{{execute}} ).  Et bien entendu,
on peut rediriger l'entrée standard et les deux sorties en même temps.
La ligne devient un peu longue, mais ça ne pose pas de problème.

## Tuber des programmes

Faire ```echo 4 6 > fichier ; ./plus.sh < fichier```{{execute}} devient
vite fastidieux, et en plus ça laisse un fichier sur disque. On peut
faire mieux en branchant directement la sortie d'un programme sur
l'entrée d'un autre, avec le symbole ``|``. On le lit "tube" ou "pipe"
en anglais, et on l'obtient sur un clavier français en faisant
``AltGr+6``.

L'exemple ci-dessus devient ```echo 4 6 | ./plus.sh```{{execute}}, tout
simplement. Et on peut enchaîner les commandes presque à l'infini:
Avec ```echo 4 6 | ./plus.sh | grep [0-9]```{{execute}}, le ``grep``
final filtre les lignes contenant au moins un chiffre, c'est-à-dire
celle de résultat.

**Attention!** ``|`` et ``>`` sont TRÈS différents. Le premier
redirige la sortie d'un programme dans un autre, tandis que le second
écrit dans un fichier. Exécuter ``echo 4 6 > ./plus.sh`` serait une
TRÈS mauvaise idée puisque ça écrirait ``4 6`` **à la place** du
script ``./plus.sh``. Avec ``|`` vous essayez de parler au programme à
droite. Avec ``>`` vous tentez de l'effacer en lui écrivant dessus...

## Exercice 1

Le fichier ``animaux`` contient une liste d'animaux, mais avec des
doublons. On voudrait utiliser la commande ``uniq`` pour retirer les
lignes en doublon, puis écrire le résultat dans un fichier
``animaux.ok``. Mais malheureusement, ``uniq`` ne supprime que les
doublons que s'il s'agit de lignes consécutives dans le flux. Il
faudra donc utiliser la commande ``sort`` pour trier les animaux avant
de supprimer les doublons.

Vous pouvez lancer le script de validation à la main au besoin:
```piping-check.sh```{{execute}}

## Exercice 2

On voudrait constituer un fichier nommé ``ligne33`` contenant exactement
la ligne 33 du fichier ``animaux.ok``. 

Indication: vous aurez besoin des commandes ``head`` et ``tail``.
Quand on ne leur précise pas le fichier à lire, ces commandes lisent
leur entrée standard. Par défaut, ``head`` affiche les 10 premières
lignes de ce qu'il lit tandis que ``tail`` en affiche les 10 dernières
lignes. Regardez dans le manuel comment changer le nombre de lignes
affichées.

## Exercice 3

>>Combien d'animaux de la liste ont 3 voyelles successives dans leur nom?<<
=== 18

*Indication:* utilisez ``grep``, ``uniq`` et ``sort``, ainsi que la
commande ``wc -l`` qui compte le nombre de lignes de son entrée
standard.
