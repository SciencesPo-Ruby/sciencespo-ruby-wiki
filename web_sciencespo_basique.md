# TP : site web basique pour modéliser Sciences Po

## Conception

Comme nous l'avons vu, la conception est une étape importante pour tout projet Ruby on Rails.

Nous allons ici créer un site web basique modélisant Sciences Po et ses écoles.

Nous allons dans un premier temps créer un système pour créer des écoles et y affecter des étudiants.

Les écoles auront un nom, un responsable, et un effectif maximal.

Les étudiants auront un nom, un prénom, une date de naissance, et seront affectés à une école.

La conception Ruby on Rails demande de définir les types des données utilisées.

Dans notre cas :

- Ecole :
	- nom sera une chaîne de caractère (string) ;
	- responsable sera une chaîne de caractère (string) ;
	- effectif_max sera un entier (integer).
- Etudiant :
	- nom sera une chaîne de caractère (string) ;
	- prenom sera une chaîne de caractère (string) ;
	- date_naissance sera une date (date) ;
	- ecole sera une référence vers une école existante.

## Mise en oeuvre de l'architecture logicielle

A partir de notre schéma de conception, nous allons pouvoir générer des pages basiques pour créer/éditer/supprimer/afficher des étudiants et des écoles, et le tout en quelques lignes de commande.

En effet, il est très courant d'avoir besoin d'afficher, d'éditer, de créer, et de supprimer des entités dans un projet web. On appelle ces opérations élémentaires **CRUD** pour Create/Retrieve/Update/Delete.

Rails en a donc fait une convention, et propose de générer automatiquement le code nécessaire pour les opérations CRUD pour les entités définies en conception.

La syntaxe est :

```
rails g scaffold Nomentite attribut1:type1 attribut2:type2 ...
```

Rails g signifie "rails generate", tandis que "scaffold" (échafaudage) indique que nous voulons générer les modèles, les vues, les contrôleurs propres à notre entité en une seule fois.

Dans notre cas, nous allons taper :

```
rails g scaffold Ecole nom:string responsable:string effectif_max:integer
```

puis 

```
rails g scaffold Etudiant nom:string prenom:string date_naissance:date ecole:references
```

Notons le "references" qui indique qu'un étudiant est lié à une école.

## Premières opérations sur les étudiants et les écoles

On peut ensuite accéder aux pages relatives aux étudiants et aux écoles sur :

- http://vps451459.ovh.net:50XX/etudiants pour les étudiants
- http://vps451459.ovh.net:50XX/ecoles pour les écoles

1. Utilisez le formulaire des écoles pour créer une école ;
2. Utilisez le formulaire des étudiants pour créer un étudiant.

Que remarquez-vous ?

Etudiez le fichier app/views/etudiants/_form.html.erb, en particulier les lignes 29 à 32 :

```ruby
  <div class="field">
    <%= form.label :ecole_id %>
    <%= form.text_field :ecole_id, id: :etudiant_ecole_id %>
  </div>
```

La ligne form.text_field indique qu'on prend un formulaire de texte.

Un champ permettant de sélectionner une école parmi celles disponibles serait plus pratique !

Pour cela, on remplace les lignes mentionnées par :

```ruby
  <div class="field">
    <%= form.label :ecole_id %>
    <%= form.select :ecole_id,
    options_for_select(
      Ecole.all.map{ |e| [e.nom, e.id] },
      params[:ecole_id]
      )
    %>
  </div>
```

form.select sert à créer un menu de sélection dans un formulaire, et options_for_select permet de générer les options correspondantes.

Ici, on dit que l'on prend toutes les écoles disponibles (Ecole.all), et que pour chacune de ces écoles, on affiche le nom à l'utilisateur, et la sélection de cette école affectera l'id de cette école dans l'étudiant (`|e| [e.nom, e.id]`). Enfin, on précise également que si l'étudiant un déjà une école, celle-ci sera affichée par défaut dans le menu déroulant (`params[:ecole_id]`).

De même, si vous créez un étudiant, et que vous consultez sa fiche, le champ école affiche une valeur inintelligible : elle affiche l'objet Ruby "Ecole", et non le nom de l'école affectée à l'étudiant...

Pour cela, consultez :

- la ligne 22 du fichier app/views/etudiants/index.html.erb
- la ligne 20 du fichier app/views/etudiants/show.html.erb

Remplacez ".ecole" par ".ecole.nom", et sauvegardez.

## Vérification de l'effectif des écoles

Dernière étape de ce TP : nous allons vérifier que chaque école ne dépasse pas son quota d'étudiants lors de l'affectation d'un nouvel étudiant.

Pour cela, nous allons utiliser ce que l'on appelle un "validator".

Un validator est une fonction qui s'exécute lors de la création/édition d'une entité en base, et qui va vérifier que l'on peut effectuer l'opération.

Dans notre cas, nous souhaitons valider que lors de l'enregistrement d'un étudiant dans une école, l'école ne dépasse pas son effectif.

Pour cela, nous devons déjà permettre à une école d'indiquer le nombre d'étudiants inscrits.

Modifiez le fichier app/models/ecole.rb de la manière suivante :

```ruby
class Ecole < ApplicationRecord
  has_many :etudiant

  def effectif
    etudiant.count
  end
  
end
```

Ensuite, modifiez le fichier app/models/etudiant.rb de la manière suivante :

```ruby
class Etudiant < ApplicationRecord
  belongs_to :ecole
  validate :check_effectif

  def check_effectif
    if ecole.effectif >= ecole.effectif_max
      errors.add(:ecole, "Cette école a atteint son effectif maximal !")
    end
  end
  
end
```
