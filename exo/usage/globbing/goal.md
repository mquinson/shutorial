# Manipuler plusieurs fichiers à la fois

Bien. Vous avez compris comment déplacer des fichiers en shell. Mais
avouez que c'est assez rébarbatif : on irait beaucoup plus vite à la
souris avec un bon navigateur de fichiers.  Alors, à quoi bon utiliser
le shell ? Et bien, parce que les opérations non triviales vont
beaucoup plus vite à réaliser en shell.

Voici quelques exemples de commandes manipulant plusieurs fichiers à la fois:

  * ```mv *.html web``` déplace tous les fichiers dont le nom termine par `.html` (et
    seulement ceux-là) dans le répertoire `web`.
  * ```mv t* AZE``` déplace tous les fichiers dont le nom commence par un t dans le répertoire `AZE`.
  * ```mv *G* plouf``` déplace tous les fichiers ayant un G au millieu de leur nom (ni au début, ni à la fin)
  * ```mv [RO]* boum``` déplace les fichiers dont le nom commence par soit par un R, soit par un O.
  * ```mv [a-d]* paf``` déplace les fichiers dont le nom commence par
    une lettre comprise dans l'intervale ```[a-d]``` (donc, commençant
    soit par un a, soit par un b, soit par un c, soit par un d). On
    peut utiliser des motifs encore plus compliqués pour spécifier les
    fichiers que l'on veut sélectionner, mais définir un intervale
    comme dans ce cas est déjà un usage assez avancé. 

À la souris, il serait fastidieux de devoir sélectionner précisément
les fichiers souhaités, les uns après les autres.

## Exercice 

Dans cet exercice, vous avez beaucoup de fichiers de différentes
extensions (vérifiez avec ```ls```). Il vous est demandé de déplacer
tous les fichiers `html` dans le répertoire `web`, les fichiers `pdf`
dans le répertoire `print` (que vous devez créer). Les fichiers `png`
doivent être coupés en deux ensembles: ceux dont le numéro est impair
doivent aller dans le répertoire `images` tandis que les fichiers
`png` dont le numéro est pair doivent aller dans le répertoire
`image2`. Notez que le contenu de ces fichiers étant sans importance,
tous ces fichiers sont vides.

1. Quel est le code de victoire de cet exercice, tel qu'affiché par ```shtrl-check```?
    - R:= 56cd8c81680dc43f59c0a26d0f22eb08ff02c88a

<div id="tg-feedback" class="alert" role="alert" style="display: none">

Avouez que pouvoir déplacer autant de fichiers en une seule commande
est tout de même agréable, non ?

Pour passer à l'exercice suivant, utilisez la commande ```shutorial
run viewing```. Vous pouvez consulter la liste des exercices existants avec
```shutorial list```.
</div>
