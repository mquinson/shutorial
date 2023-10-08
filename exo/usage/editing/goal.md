# Éditer le contenu des fichiers

Il existe plusieurs éditeurs de texte utilisables depuis le terminal,
sans avoir besoin d'un environnement fenêtré graphique. À première
vue, leur usage est un peu rébarbatif et il est plus confortable
d'utiliser plutôt l'éditeur graphique dont vous avez besoin.

Mais il arrive que l'on veuille éditer un fichier sans 
l'environnement graphique, par exemple parce cet environnement est
gelé ou cassé. Il m'arrive souvent en pareil cas d'ouvrir la console
virtuelle. Avant de partir, notez que l'on revient à l'environnement
graphique avec Alt+Ctrl+F7, puis essayez de passer sur la seconde
console virtuelle avec Alt+Ctrl+F2. Les différentes consoles
existantes (derrière F1 à F5) sont presque toujours utilisables, même
quand le système d'exploitation est surchargé. On a alors accès à
toutes les fonctions du terminal, ce qui est très pratique pour
détecter et tuer le programme qui consomme trop de ressources, ou pour
réparer la configuration d'un programme en cas de coup dur.

Un autre cas où l'on peut avoir besoin d'éditer un fichier sans
pouvoir compter sur l'environnement graphique, c'est quand on se
connecte à distance à une machine grâce à ```ssh```. Ce programme
ouvre un terminal sécurisé sur la machine distante. Il peut également
être utilisé pour ouvrir un programme graphique, mais les performances
réseaux rendent souvent obligatoire de se contenter des programmes
non graphiques.

## Quel éditeur choisir?

Aussi fou que cela puisse paraître, le choix de l'éditeur sous Unix
déclenche souvent des guerres de clocher assez sévère entre les
partisans de l'éditeur ``vi`` (plus rudimentaire et plus efficace) et
l'éditeur ``emacs`` (plus puissant, mais plus difficile à prendre en
main). Cette guerre de geeks dure même depuis plusieurs décennies...

Pour apprendre vi, plusieurs jeux existent. Certains sont en ligne,
comme [vim adventures](https://vim-adventures.com/) ou
[OpenVim](https://www.openvim.com/), tandis que d'autres doivent être
installés sur votre ordinateur comme
[PacVim](https://github.com/jmoon018/PacVim). Il n'existe pas de tel
jeu pour apprendre emacs à ma connaissance, mais il existe de
[nombreuses ressources](https://www.emacswiki.org/emacs/LearningEmacs). 
Le plus dur avec emacs n'est pas tant d'apprendre à s'en servir mais
plutôt de le configurer. Il existe même plusieurs communautés
d'utilisateurs mettant leurs fichiers de configuration en commun pour
se simplifier la vie, comme par exemple
[spacemacs](https://www.spacemacs.org/).

## Au travail

Dans cet exercice, je vous conseille cependant d'utiliser ```nano```
qui est un autre éditeur minimaliste, installé sur presque tous les
systèmes Linux et plus simple à utiliser que les deux autres. Il est
certes aussi plus limité, mais il sera bien suffisant pour cette fois.

Votre tâche est assez simple : il suffit d'ouvrir le fichier STATE
avec la commande ```nano STATE```, trouver la ligne où il est écrit
```C'est en cours.``` et d'écrire ```C'est fini.``` (avec une
majuscule et un point) à la place.

Dans nano, on peut sauvegarder le fichier avec Ctrl+O (c'est ce que
signifie le ```^O Écrire``` en bas de l'écran) et on quitte l'éditeur
avec Ctrl+X pour revenir au terminal. Au besoin, nano nous propose de
sauvegarder le fichier avant de quiter.

Attention à ne rien changer d'autre dans le fichier, sinon vous ne
pourrez pas passer le test avec succès.

1. Quel est le code de victoire de cet exercice, tel qu'affiché par ```shtrl-check```?
    - R:= 605718ab0bac243706ffba0bcf79ff99c12fb607

<div id="tg-feedback" class="alert" role="alert" style="display: none">

Bravo, vous savez maintenant survivre aux fois où il faut éditer en
ligne de commande. Libre à vous maintenant de vous contenter de nano,
ou d'apprendre à utiliser un éditeur plus évolué comme emacs ou vim.

En attendant, vous pouvez passer à l'exercice suivant avec ```shutorial
run searching```. Vous pouvez aussi consulter la liste des exercices
existants avec ```shutorial list```.

</div>
