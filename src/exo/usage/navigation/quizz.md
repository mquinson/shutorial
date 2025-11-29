# Quizz sur la navigation dans l'arborescence

Vous avez réussi à recréer l'arborescence demandée, bravo. Voici un
petit questionnaire pour finir cet exercice. Si vous avez des doutes,
n'hésitez pas à lire la documentation dans le terminal avec `man
<commande>` et à faire des essais dans le terminal.

1. Pour effacer un fichier nommé 'bidule' on peut utiliser (plusieurs réponses possibles):
    - [ ] remove bidule
    - [x] rm bidule
    - [x] rm -r bidule
    - [ ] rmdir bidule

2. Peut-on utiliser la commande <tt>touch</tt> sur un fichier existant?
    - ( ) Non, cette commande ne sert qu'à créer de nouveaux fichiers.
    - (x) Oui, cela va changer sa date de dernière modification.

<div id="tg-feedback" class="alert" role="alert" style="display: none">

<ul>
<li>En effet, différentes solutions sont possibles pour effacer un fichier nommé <tt>bidule</tt>:
  <ul>
  <li> &#10060;```remove bidule```: la commande <tt>remove</tt> n'existe pas.</li>
  <li> &#10004; ```rm bidule```: c'est la commande faite pour ça.</li>
  <li> &#10004; ```rm -r bidule```: l'option <tt>-r</tt> demande à la commande <tt>rm</tt> d'agir
      récursivement. Si l'argument est un répertoire, la commande va tenter
      d'effacer son contenu, mais si c'est un fichier, cette option n'a
      aucun effet, et donc ça marche comme d'habitude.</li>
  <li> &#10060; ```rmdir bidule```: la commande <tt>rmdir</tt> ne fonctionne qu'avec les
     répertoires, pas avec les fichiers.</li>
  </ul></li>

<li>On peut effectivement utiliser la commande <tt>touch</tt> sur un
   fichier existant. Dans ce cas, la date de dernière modification du
   fichier est mise à l'heure courante.<br>

   On peut voir la date de dernière modification des fichiers du
   répertoire courant avec la commande ```ls -l```.
   Cela demande l'affichage long à la commande <tt>ls</tt>, ce qui ajoute
   de nombreuses informations comme les permissions (qui a le droit de
   lire ou modifier le fichier -- on y reviendra), le propriétaire du
   fichier et son groupe, la taille du fichier et donc la date de
   dernière modification.</li>
</ul>

Vous pouvez maintenant passer à l'exercice suivant  en tapant
```shutorial run moving``` dans le terminal. Vous pouvez fermer cette
fenêtre.

</div>

