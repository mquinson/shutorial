# Déplacer des fichiers sur disque

Nous avons vu quelques commandes pour se déplacer sur le disque et
pour créer des fichiers et répertoires. Pour ne pas les oublier,
imprimez le [pense-bête du shell](https://framagit.org/mquinson/C-2nd-language/raw/master/refcard/refcard-shell.pdf?inline=false).

Dans cet exercice, nous allons apprendre à déplacer des fichiers.
Utilisez la commande ```tree``` pour voir la situation
initiale.

La commande `mv` permet de déplacer (MoVe) des fichiers et
répertoires. Sa syntaxe est très facile: De base, 
```mv toto bidule``` permet de renommer le fichier `toto` en `bidule`.
Cela marche aussi si `toto` est un répertoire. Verifiez le résultat
avec la commande ```tree```.

Si le second paramètre de la commande `mv` existe, ça doit être un
répertoire dans lequel le premier paramètre est déplacé. Par exemple
```mv bidule dir1``` déplace le fichier `bidule` dans le
répertoire `dir1`. Vérifiez l'état courant avec 
```tree``` ou ```ls -R``` (listing récursif).

Enfin, si vous passez plus de deux paramètres à la commande `mv`, tous
ceux du début de la ligne sont déplacés dans le répertoire indiqué en
dernier paramètre. Par exemple ```mv machin dir1/bidule truc``` déplace les fichiers `machin` et `dir1/bidule`
(c'est à dire le fichier `bidule` placé dans `dir1`) dans le
répertoire `truc`. Vérifiez l'état actuel avec ```tree```.

La commande `mv`, comme beaucoup d'autres, accepte beaucoup de
paramètres intéressants. Par exemple `mv -i [paramètres habituels]`
passe en mode interactif: vous devez confirmer chaque opération qui écrase
un fichier existant.
Consultez le manuel de cette commande en tapant
```man mv```.

## Quizz

Voici un petit questionnaire pour commencer. Si vous avez des doutes,
n'hésitez pas à lire la documentation en ligne avec `man <commande>`
et à faire des essais dans le terminal.


1. Comment renommer le répertoire 'rep1' en 'rep2'?
    - ( ) cp rep1 rep2
    - ( ) ls rep1 rep2
    - (x) mv rep1 rep2
    - ( ) mkdir -p rep1 rep2

2. Que fait la commande 'cd' sans paramètre?
    - ( ) Rien.
    - (x) Le shell retourne dans le répertoire de départ de l'utilisateur.
    - ( ) Cela remonte d'un niveau dans l'arborescence des répertoires.
    - ( ) Cela retourne dans le dernier répertoire visité avant celui là.

3. Que fait la commande 'cd -' (avec un tiret comme paramètre)?
    - ( ) Rien.
    - ( ) Le shell retourne dans le répertoire de départ de l'utilisateur.
    - ( ) Cela remonte d'un niveau dans l'arborescence des répertoires.
    - (x) Cela retourne dans le dernier répertoire visité avant celui là.

## Au travail

Si vous effacez les quelques répertoires et fichiers en trop (avec
```rm -r truc/``` et compagnie), vous devriez avoir une arborescence
très proche de ce que vous aviez à la fin de l'exercice précédent:


     📁
     ├── 📁 dir1
     │   └── 📁 dir2
     │       └── 🖹 doc1
     └── 📁 dir3
         └── 🖹 doc2

L'objectif est de renommer tous les éléments pour les mettre en
majuscule, comme suit. Il n'est pas possible de juste recréer
l'arborescence, car le contenu des fichiers doc1 et doc2 doit être
préservé.

     📁
     ├── 📁 DIR1
     │   └── 📁 DIR2
     │       └── 🖹 DOC1
     └── 📁 DIR3
         └── 🖹 DOC2

Lorsque vous pensez avoir terminé, lancez la commande
```shtrl-check```. Si vous avez réussi, cette commande vous donnera un
code secret à taper dans la boite ci-dessus pour continuer. 

1. Quel est le code de victoire de cet exercice, tel qu'affiché par ```shtrl-check```?
    - R:= 2f199f5e73061ab23be958ac89d3fc1c232885f2

Coincé? Utilisez la commande ```ls -R``` ou ```tree``` pour afficher récursivement
le contenu de tous les répertoires.  Si les choses sont graves,
relancez l'exercice en tapant Ctrl-D dans le terminal et en relançant
l'exercice avec ```shutorial run moving```.

<div id="tg-feedback" class="alert" role="alert" style="display: none">

Bravo! Vous avez terminé cet exercice. Vous pouvez passer à l'exercice
suivant avec la commande ```shutorial run globbing```. Vous pouvez
fermer cette fenêtre.

Vous pouvez aussi consulter la liste des exercices existants avec ```shutorial list```.
</div>
