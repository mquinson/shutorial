La commande ```find``` est très pratique pour trouver un fichier
d'après son nom ou ses attributs de fichier, mais elle ne permet pas
d'ouvrir les fichiers à la recherche d'un contenu particulier. C'est
l'un des multiples services que la commande ```grep``` peut rendre.

Grep permet de chercher efficacement un texte donné dans des fichiers
ou des flux de données.  Cet outil est installé sur tous les Unix de
la terre, et il existe des versions pour Windows. Tout les
utilisateurs du terminal utilisent grep de temps à autres.

Par exemple, ```grep xeruti aa/*```{{execute}} cherche la chaîne
``xeruti`` dans tous les fichiers du répertoire aa/. Chaque fois que
cette chaîne est trouvée, grep écrit le nom du fichier où il l'a
trouvé séparé par ':' de la ligne complète contenant la chaîne.

Mais grep est bien plus puissant que cela. Il permet de chercher non
seulement des mots, mais également des motifs avancés comme "un i
suivi d'un nombre pair de t (ou bien d'un nombre impaire de s), mais
uniquement si c'est en début de ligne". En informatique, ces motifs
s'appellent des expressions régulière ("regular expression" ou "regex"
en anglais), et c'est d'ailleurs de là que vient le nom de grep:
"Global Regular Expression Print" (affichage d'expressions
régulières globales). 

La syntaxe des expressions rationnelles fleure bon les années 70 (en
informatique, cela veut dire que c'est affreusement préhistorique),
mais la puissance de la chose vaut bien la peine qu'on apprenne un peu
à s'en servir. En cas de problème, on trouve même des assistants à
l'écriture de regex sur internet.

Vous devez maintenant utiliser la commande grep pour trouver des
informations dans le répertoire de l'exercice. La page de manuel de
grep n'est pas très utile car elle n'est absolument pas pédagogique
(c'est un guide de référence), et elle ne donne même pas l'intégralité
de la syntaxe. Préférez la [page
wikipédia](https://fr.wikipedia.org/wiki/Expression_r%C3%A9guli%C3%A8re#Utilisation).

### Chercher un mot

On trouve 243 fichiers aux noms parfaitement inintéressants, dont l'un
d'entre eux contient la chaîne 'ici'. Utilisez grep pour trouver
lequel, et recopier le mot bizarre ci-dessous.

>> Mot étrange sur une ligne contenant 'ici' dans aa/* <<
=~= dewulitavo

### Limiter aux mots débutant la ligne

Cette fois, 'ici' est dans deux fichiers et il faut sélectionner la
ligne où le motif est placé en début de ligne. Bien sûr, vous pouvez
grepper 'ici' sans spécifier et choisir à la main lequel des deux
recopier. Mais rien ne sert de tricher ici: ce n'est pas évalué. Il
vaut mieux chercher la regex magique sélectionnant directement la
bonne ligne (relisez wikipedia au besoin).

>> Mot étrange sur une ligne débutant par 'ici' dans bb/* <<
=~= derupirapo

### Ignorer la casse

Cette fois, on cherche "plutot" sans accent, mais on ne sait pas s'il
est écrit en majuscule ou minuscule. Il y a une option pour ignorer la
casse, comme indiqué sur la page man de grep (```man grep```{{execute}})
ou dans le message d'aide du programme (```grep --help```{{execute}}).

>> Mot étrange sur une ligne contenant 'plutot' dans cc/* <<
=~= bewulikavo

### Répéter un motif

Là encore, il est plus facile de tricher que de trouver la bonne
regex. Soyez fort, persistez!

>> Mot sur une ligne contenant trois ou quatre 'a' consécutifs dans dd/* <<
=~= begutikapo

### Classes de caractères

On cherche un mot contenant trois voyelles successives (trois fois
l'une des lettres suivantes: ``aeoiu``), suivies de quelque chose qui
n'est pas un chiffre.

>> Trois voyelles consécutives, pas pas suivies d'un chiffre dans ee/* <<
=~= xerulitapo

### Aller plus loin

Internet regorge de très bonnes ressources pour continuer à vous
entrainer avec les expressions régulières. Ma favorite est peut-être
le [mot-croisé des regex](https://regexcrossword.com). C'est un jeu
très geek, mais plutôt amusant.