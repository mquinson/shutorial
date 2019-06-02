Bien. Vous avez compris comment déplacer des fichiers en shell. Mais
avouez que c'est assez rébarbatif : on irait beaucoup plus vite à la
souris avec un bon navigateur de fichiers. 

Alors, à quoi bon utiliser le shell ? Et bien, parce que les
opérations non triviales vont beaucoup plus vite à réaliser en shell.
Par exemple, la commande ```mv *.html web```{{execute}} va déplacer
tous les fichiers dont le nom termine par `.html` dans le répertoire
`web` (et seulement ceux-là). À la souris, il serait fastidieux de
devoir les sélectionner les uns après les autres.

Dans cet exercice, vous avez beaucoup de fichiers de différentes
extensions (vérifiez avec ```ls```{{execute}}). Il vous est demandé de
déplacer tous les fichiers `html` dans le répertoire `web`, les
fichiers `pdf` dans le répertoire `print` (que vous devez créer) et
les fichiers `png` dans le répertoire `image`. 

Comme d'habitude, vous pouvez utiliser la commande
```/tmp/kc_verify1.sh```{{execute}} vous permet de lancer le script de
validation à la main si vous êtes coincé. 

Avouez que pouvoir déplacer autant de fichiers en une seule commande
est tout de même agréable, non ?