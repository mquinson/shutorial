# shell-exercises

Source code of a set of Shell scripting exercices

**This tool used to rely on Katacoda, that was shut down since then.
Please move to the v2 version that runs locally**


Je ne sais pas exactement ce qu'ils ont changé pour que les exos ne
marchent plus, c'est assez pénible. Le plus simple me semble être de
prendre [cette version](https://github.com/UGLimusic/decouverte_shell)
qui utilise [CoCalc](https://cocalc.com/) à la place de Katacoda.
Merci à Fred Leleu pour la conversion des exercices pour cette
nouvelle plate-forme. Voir aussi plus bas pour des réflexions sur la
technique.

# Aller plus loin:

- Le poly de l'ENSIMAG https://matthieu-moy.fr/spip/IMG/pdf/sh.pdf

- Les Capture The Flag (CTF) sont des jeux où l'on cherche à
  contourner la sécurité d'un système conçu pour l'occasion. Ceux-là
  sont pensés comme des petits jeux de logique et réflexion utilisant le
  shell, tandis que d'autres sont des compétitions en équipe ou en
  solo. Ces jeux ne sont pas vraiment pédagogiques: quand on sait on
  gagne et quand on sait pas, il faut chercher par soit même sans
  aucune aide du système.

  http://overthewire.org/wargames/bandit/ un vieux CTF autour du shell (en anglais)
  https://www.root-me.org/ un site collaboratif proposant de très nombreux CTF (en français). 

- Un autre système avec le même objectif, que je n'ai pas encore
  regardé de près. https://github.com/phyver/GameShell

- L'aide à UNIX écrite pour les élèves de l'ENS Paris au siècle passé.
  C'est vieux, mais c'est pas mal et surtout c'est en français.

  https://www.tuteurs.ens.fr/unix/shell/index.html

## En anglais

La liste suivante n'est pas particulièrement triée.

- Des comics expliquant énormément de petites choses: https://jvns.ca/
- Liste de ressources: https://www3.nd.edu/~pbui/teaching/cse.20289.sp19/
- Livre en ligne: http://linuxcommand.org/tlcl.php
- Un script commenté qui explique tout en 10mn: https://learnxinyminutes.com/docs/bash/
- Un exerciseur en node.js à exécuter en local:
  https://github.com/denysdovhan/learnyoubash
  https://github.com/denysdovhan/bash-handbook
- Des tutos et exercices: http://www.ee.surrey.ac.uk/Teaching/Unix/
- Des ptits tutos: https://www.learnshell.org/en/Variables
- Collections de liens vers des tutos: https://www.cyberciti.biz/tips/linux-unix-commands-cheat-sheets.html
- Un outil pour voir les différents bouts d'une commande shell, et la
  doc de chaque bout: https://explainshell.com/
- https://linuxjourney.com/lesson/the-shell 
- http://linuxcommand.org/

# TODO

Ce qui suit est mon fichier de notes perso. Je vous le montre sans
oser espérer qu'il vous sera utile, mais c'est plus simple pour moi de
le mettre là plutôt que le perdre sur mon disque. Si vous voulez
ajouter des trucs, n'hésitez pas à me contacter.

## Leçons manquantes

* Variables et expansion (guillemets simples ou doubles, {}, *, ?)
  - Chercher le mot le plus long. sed|echo ".. $()"|sort|head|cut ou sed
  - Environnement
* Opérations répétitives et conditionnelles (for/while/if)
  - Trier les fichiers en fonction de la sortie de $(file)
* Faire des scripts
  - Debugger nombre_mystere.sh, max2err.sh et jeboucle.sh TP4
  - TP8 de CSH est plein de bonnes choses
  - Introduire 'cat << EOF > fichier'
* Permissions: "ls -gGR --time-style=+" pour afficher les permissions sans bruit
* processus et jobs

## Notions manquantes

* Fichiers cachés: Peut-être dans la navigation? Ou dans un navigation-avancée


## Idées d'exos:

* Trouver la seule ligne qui apparaisse une seule fois dans le fichier. Hint: $(man uniq)
* Trouver les 15 mots les plus fréquents d'un texte. 
* Trouver les bigrammes (séquence de deux mots consécutifs) les plus
  fréquents. En ignorant la casse.
  Hint: utiliser la commande paste pour fusionner deux fichiers contenant la liste des mots, décalés de un mot.
* bunzip-strings: n'afficher que les lettres affichables d'un fichier après décompression
* Pour le sed en anglais, une conversion thou/you avec thousands dans
  le texte, ou une mise entre valeur *Thou* tenant compte de la casse.
* Un texte est un palindrome à une faute près. Corrigez le.
* Motifs:
```
  $ ./motif 3 15 ___/ \\___
  ___/\______/\______/\______/\______/\______/\______/\______/
  \______/\______/\______/\______/\______/\______/\______/\___
  ___/\______/\______/\______/\______/\______/\______/\______/
  $ ./motif 4 10 __] [__
  __][____][____][____][____][__
  [____][____][____][____][____]
  __][____][____][____][____][__
  [____][____][____][____][____]
  $ ./motif 4 20 ’\__’ ’/ ’
  \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__/
  / \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__
  \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__/
  / \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__/ \__
```


## Idées pour remplacer Katacoda

- https://github.com/play-with-docker/play-with-docker: Solution de
  Docker-in-docker pour permettre aux apprenants de jouer avec Docker.
  Y'a un site live, mais j'imagine que c'est surtout pour de
  l'auto-hébergement où l'apprenant lance ça sur son ordi perso (pas
  sûr).

- https://github.com/freeCompilerCamp/freecompilercamp.github.io: Ils
  construisent sur Play-with-Docker, et ils font un
  Play-with-compiler, où on peut déployer son compilo favori pour
  jouer. Objectif pédagogique affiché, et publications scientifiques.