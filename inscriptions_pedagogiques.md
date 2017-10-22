# TP : Inscriptions pédagogiques

## Objectif

Nous allons ici créer une représentation "simpliste" du système d'inscriptions pédagogiques de Sciences Po à l'aide du langage de programmation Ruby.

Nous utiliserons l'ensemble des connaissances acquises au cours des séances précédentes.

Nous commencerons par faire une phase de conception du système d'inscriptions pédagogiques, puis l'implémenterons.

## Conception

Les inscriptions pédagogiques reposent sur 3 entités : les cours, les étudiants, les agendas.

Ces trois entités peuvent être décrites sous la forme de "classes" Ruby, dont les attributs sont décrits ci-après.

Un Etudiant a :

- un nom (String)
- un prénom (String)
- une date de naissance (Date)
- un emploi du temps (Agenda)

Un Cours a :

- un horaire de début (Integer)
- un horaire de fin (Integer)
- un jour (Integer)
- un nom (String)
- un enseignant (String)
- un nombre maximal d'étudiants (Integer)

Un Agenda a :

- Un tableau de cours (Array de Cours)

On remarque que la classe Etudiant dépend de la classe Agenda via l'attribut emploi du temps, et que la classe Agenda dépend de la classe Cours via l'attribut tableau de cours.

Pour écrire ces classes et avoir un programme fonctionnel, nous devrons donc écrire d'abord la classe Cours, puis la classe Agenda, puis la classe Etudiant.

Cela revient à écrire les classes dans l'ordre inverse des dépendances. On peut représenter cela via l'idée suivante : pour poser les fenêtres d'une maison on a besoin de murs, pour poser les murs on a besoin des fondations, donc on construira d'abord les fondations, puis les murs, puis les fenêtres.

## Implémentation

Nous écrirons dans la suite chaque classe dans un fichier séparé, et créerons un fichier de travail inscription_pedagogiques.rb qui chargera tous les fichiers pour exécuter du code.

Si l'on a deux fichiers "a.rb" et "b.rb", et que "a.rb" utilise du code présent dans le fichier "b.rb", on peut écrire ```load 'b.rb'``` en haut du fichier "a.rb" pour charger le contenu de "b.rb".

1) Ecrire une classe Cours dans un fichier "cours.rb", qui respecte la conception proposée

2) Ecrire une classe Agenda dans un fichier "agenda.rb", qui charge le fichier "cours.rb"

3) Ecrire une classe Etudiant dans un fichier "etudiant.rb", qui charge le fichier "agenda.rb"

4) Créer un fichier de travail "inscription_pedagogiques.rb" qui charge les trois fichiers "agenda.rb", "etudiant.rb", et "cours.rb".

5) Dans le fichier de travail, créer les premiers cours et les insérer dans un tableau "CATALOGUE_COURS".

Exemple :

```ruby
CATALOGUE_COURS = [
  Cours.new(8, 10, 0, "Finances publiques", "DSK", 200),
  Cours.new(10, 12, 1, "Droit administratif", "Yann Aguila", 200),
  Cours.new(14, 16, 1, "Questions sociales", "Martin Hirsch", 100)
]
```

6) Dans le fichier de travail, créer les premiers étudiants et les insérer dans un tableau "LISTE_ETUDIANTS".

Exemple :

```ruby
LISTE_ETUDIANTS = [
  Etudiant.new("Le luron", "Thierry", Date.new(1952,4,2)),
  Etudiant.new("Mion", "Frédéric", Date.new(1969,8,30)),
  Etudiant.new("Boutmy", "Emile", Date.new(1835,4,13))
]
```

7) Dans la classe Etudiant, créer une méthode "inscrire" qui prend en paramètre un cours et permet d'ajouter le cours dans l'agenda de l'étudiant.

8) Dans la classe Agenda, créer une méthode "afficher" qui affiche le nom de tous les cours stockés dans l'agenda.

9) Dans le fichier de travail, inscrire l'étudiant Thierry Le Luron à un cours.

10) Dans le fichier de travail, afficher l'agenda de Thierry Le Luron.

Une proposition de code correspondant à ces exercices est disponible dans le dossier "code_ip".