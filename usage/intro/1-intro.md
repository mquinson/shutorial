Il s'agit d'une fenêtre noire (le plus souvent) dans laquelle on peut interagir
avec le système d'exploitation directement en mode texte. Le terminal rend en
gros les mêmes services que le navigateur de fichiers de votre ordinateur : on
peut se déplacer sur le disque, consulter le contenu des répertoires, exécuter
des programmes et déplacer des fichiers. Mais on le fait sans la souris, en
tapant des commandes au clavier.

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

On pourrait faire le même genre d'exercice dans un terminal local. Si vous avez
un Linux ou un Mac, c'est inclus dans le système et si vous avez un Windows, il
suffit d'installer le WSL (Windows SubSystem) afin de coinstaller un système
Linux à coté de votre Windows pour pouvoir utiliser les deux en même temps. Une
fois le terminal du WSL lancé, exécutez simplement ```cd /mnt/c``` pour aller
sur votre disque ```C:```. D'ailleurs, vous devriez utiliser ce système au
quotidien quelques temps pour vous entraîner. 

Mais le gros avantage de Katacoda est que vous ne pouvez rien casser car c'est
un environnement virtuel. Si vous effacez des fichiers importants de votre
ordinateur, le réparer peut s'avérer difficile. Mais si vous endommagez le
système utilisé ici, il suffit de recharger la page de votre navigateur pour
rebooter. Toutes vos modifications sont alors annulées. Mais assez de blabla,
commençons.
