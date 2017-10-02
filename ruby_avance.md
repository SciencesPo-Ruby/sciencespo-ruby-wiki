# Ruby : notions avancées

## Les hashs

Nous avons précédemment vu comment stocker un ensemble d'informations dans une même case mémoire, grâce aux tableaux.

Cependant, si les tableaux sont très faciles à manipuler en programmation, il est en pratique assez difficile de s'y retrouver pour l'humain.

Reprenons par exemple l'exercice de la section précédente, qui créait une fonction permettant de compter les voyelles présentes dans une chaîne de caractères.

_Extrait de l'énoncé :_

```
Créer une fonction 'compte_voyelles_occ' qui prend en paramètre une chaîne de caractères, et compte les occurrences de chaque voyelle dans cette chaîne. On utilisera pour cela un tableau où :
la case d'index 0 contiendra le nombre de 'a'
la case d'index 1 contiendra le nombre de 'e'
la case d'index 2 contiendra le nombre de 'i'
la case d'index 3 contiendra le nombre de 'o'
la case d'index 4 contiendra le nombre de 'u'
la case d'index 5 contiendra le nombre de 'y'
```

Cela signifie que le résultat de `compte_voyelles_occ("coucou")` est `[0,0,0,2,2,0]`.

La lecture de ce résultat n'est pas triviale : si je vous demande combien de "u" figurent dans le mot étudié, vous devrez d'abord vous souvenir que la case du tableau contenant cette information est la case d'index 4...

Fort heureusement, les informaticiens ont inventés les "Hashs" : ce sont des sortes de tableaux où au lieu de travailler avec des index numérotés, on donne la possibilité de donner des noms à chaque index.

En Ruby, un hash se note à l'aide de `{}` (hash vide), à ne pas confondre avec le notation des tableaux `[]`.

Pour mettre des éléments dans un hash, on utilise la notation : `hash["cle"] = valeur`, ou `hash = { "cle" => valeur }`.

Chaque index est appelé "clé", et contient une valeur.

La création d'un hash est libre, et nous pouvons donc, dans le cadre de la fonction `compte_voyelles_occ`, décider de renvoyer comme résultat un hash où chaque clé est une voyelle et où chaque valeur est le nombre de fois que cette voyelle apparaît dans le mot étudié.

Exemple : `compte_voyelles_occ("coucou") = { "a" => 0, "e" => 0, "i" => 0, "o" => 2, "u" => 2, "y" => 0 }`.

Codons une telle fonction :

```ruby
def compte_voyelles_occ(chaine)
  
  # On crée un tableau où chaque compteur de voyelles vaut initialement 0.
  resultat = { "a" => 0, "e" => 0, "i" => 0, "o" => 0, "u" => 0, "y" => 0 }
  
  voyelles = ["a","e","i","o","u"]
  
  # On convertit la chaine de caractères en tableau, et on boucle sur chaque élément du tableau
  chaine.split('').each do |caractere|
  
    # On vérifie si caractere est une voyelle
    # pour cela, on peut utiliser "tableau.include? element" sur un tableau qui permet de savoir si element est bien dans le tableau fourni
    if voyelles.include? caractere
      # Si caractere est une voyelle, on augmente le compteur de 1
      resultat[caractere] = resultat[caractere] + 1
    end
  end
  
  return resultat
end
```

Résultat :

```
# compte_voyelles_occ("coucou") renvoie :
{"a"=>0, "e"=>0, "i"=>0, "o"=>2, "u"=>2, "y"=>0} 
```

Ce résultat est un peu plus pratique à lire pour l'humain que lorsque nous utilisions de simples tableaux !

Exercices :

- Faire une fonction compte_alphabet(chaine) qui renvoie à l'aide d'un hash le nombre de caractères de chaque type de A à Z.
- Faire une fonction total_compte_alphabet(chaine) qui, à partir de compte_alphabet(chaine), compte le nombre total de consonnes et de voyelles dans chaine, et renvoie un hash au format `{ "nb_consonnes" => XXX, "nb_voyelles" => XXX }`.


## La programmation orientée objet

A partir des hashs, des tableaux, et des fonctions, on peut déjà faire énormément de choses.

Cependant, chaque opération demande alors beaucoup de code et devient difficile à représenter pour l'esprit humain.

Exemple : cas d'un chat

```ruby

chat_marcel = {
         "prenom" => "Marcel",
         "proprietaire" => "Sciences Po",
         "adresse_proprietaire" => "13 rue de l'Université",
         "etat" => "dort",
         "cri" => "miaou"
       }

def saluer(chat)
  puts chat["cri"] + " je m'appelle " + chat["prenom"]
end

def changer_etat(chat)
  if chat["etat"] == "dort"
    chat["etat"] = "réveillé"
  else
    chat["etat"] = "dort"
  end
  
  puts chat["cri"] + " je suis maintenant à l'état " + chat["etat"]

end
```

On a alors :

```
# saluer(chat_marcel) affiche :
miaou je m'appelle Marcel
# changer_etat(chat_marcel) affiche :
miaou je suis maintenant à l'état réveillé
# une deuxième exécution de changer_etat(chat_marcel) affiche :
miaou je suis maintenant à l'état dort
```

Pour simplifier l'écriture de ce code, on peut utiliser la "programmation orientée objet" qui permet de décrire des objets, des animaux, des personnes de la vraie vie avec une approche plus fluide pour l'humain.

Ici, on considère qu'un chat est un "objet" Ruby qui possède un prénom, un cri, un propriétaire, une adresse de propriétaire, et qui a un état.

On considère également que par défaut, le cri d'un chat est "miaou" et l'état d'un chat est "dort" (il s'agit après tout de modéliser la vraie vie).

On peut alors écrire le code suivant pour représenter cette situation :

```
class Chat

  attr_accessor :prenom, :cri, :proprietaire, :adresse_proprietaire, :etat
  
  ...

end
```

On dit que "Chat" est une classe : c'est une recette pour créer plusieurs objets qui auront des caractéristiques communes. Ici, "Chat" est une classe qui permet de représenter des chats dans la vraie vie.

On précise ici, avec la notation de "attr_accessor", qu'un chat a des attributs auxquels nous pourrons accéder plus tard, et que ceux-ci s'appelle "prenom", "cri", "proprietaire", "adresse_proprietaire", et "etat".

Nous devons ensuite dire à Ruby comment nous souhaitons, à la création d'un nouveau chat, préciser le prénom, le propriétaire, et l'adresse du propriétaire.

On complète alors le code précédent de la manière suivante :

```
class Chat

  attr_accessor :prenom, :cri, :proprietaire, :adresse_proprietaire, :etat
  
  def initialize(prenom_param, proprietaire_param, adresse_proprietaire_param)
    @prenom = prenom_param
    @proprietaire = proprietaire_param
    @adresse_proprietaire = adresse_proprietaire_param
    @cri = "miaou"
    @etat = "dort"
  end

end
```

La fonction "initialize" permet d'indiquer ce qu'il se passe à la création d'un objet utilisant la classe définie.

La notation "@ATTRIBUT" permet de stocker dans l'attribut "ATTRIBUT" de l'objet une valeur.

Ici, on dit qu'à la création d'un nouveau chat, on donne trois paramètres : "prenom_param", "proprietaire_param", "adresse_proprietaire_param", et que ceux-ci sont stockés dans les attributs "prenom", "proprietaire", et "adresse_proprietaire".

On indique aussi ici que l'attribut "cri" stocke "miaou", et que l'attribut "etat" stocke "dort".

On peut alors créer un nouveau chat de la manière suivante :

```
marcel_chat = Chat.new("Marcel", "Sciences Po", "13 rue de l'Université")
```

Dans ce cas, `Chat.new("Marcel", "Sciences Po", "13 rue de l'Université")` utilise la fonction "initialize" de "Chat" en passant "Marcel" comme paramètre "prenom_param", "Sciences Po" comme paramètre "proprietaire_param", et "13 rue de l'Université" comme paramètre "adresse_proprietaire_param".

On peut ensuite accéder aux attributs de "marcel_chat" et déclarés dans la classe "Chat" à l'aide de la notation "marcel_chat.ATTRIBUT" : 

```
marcel_chat = Chat.new("Marcel", "Sciences Po", "13 rue de l'Université")
puts marcel_chat.prenom # Affiche Marcel
```

On peut également aller un peu plus loin encore, et intégrer les fonctions saluer et changer_etat directement dans le code de la classe "Chat" :

```
class Chat

  attr_accessor :prenom, :cri, :proprietaire, :adresse_proprietaire, :etat
  
  def initialize(prenom_param, proprietaire_param, adresse_proprietaire_param)
    @prenom = prenom_param
    @proprietaire = proprietaire_param
    @adresse_proprietaire = adresse_proprietaire_param
    @cri = "miaou"
    @etat = "dort"
  end

  def saluer
    puts @cri + " je m'appelle " + @prenom
  end

  def changer_etat
    if @etat == "dort"
      @etat = "réveillé"
    else
      @etat = "dort"
    end
  
    puts @cri + " je suis maintenant à l'état " + @etat

  end

end
```

La syntaxe "@ATTRIBUT" permet aussi ici de lire le contenu d'un attribut.

De telles fonctions directement intégrées dans le code d'une classe s'appellent des "méthodes".

On peut alors appeler ces fonctions / méthodes "saluer" et "changer_etat" directement depuis l'objet créé :

```
marcel_chat = Chat.new("Marcel", "Sciences Po", "13 rue de l'Université")
puts marcel_chat.saluer # Affiche miaou je m'appelle Marcel
```

On peut également utiliser la classe "Chat" comme une recette pour créer plusieurs objets à la suite les uns des autres :

```
marcel_chat = Chat.new("Marcel", "Sciences Po", "13 rue de l'Université")
puts marcel_chat.saluer # Affiche miaou je m'appelle Marcel
tom_chat = Chat.new("Tom", "Jerry", "1 rue Warner Bros")
puts tom_chat.saluer # Affiche miaou je m'appelle Tom
```

Exercices :

- Créer une classe Chien, dont les attributs sont le prénom et l'âge
- Créer une méthode aboyer qui renvoie "Wouf" si le chien a 5 ans ou moins, et "Ouaf ouaf" si le chien a 6 ans ou plus
- Créer une méthode saluer qui fait aboyer le chien, puis affiche le prénom du chien
- Créer un chien dont le prénom est "Dingo", âge de 4 ans, et le faire aboyer
- Modifier l'âge de Dingo pour le faire vieillir de 2 ans, puis le faire aboyer


Exercices avancés :

- Créer une classe Refuge, dont les attributs sont "nom", "adresse", "animaux_en_stock"
- Créer un objet "spa_paris" de type refuge
- Créer une classe Chat, dont les attributs sont le prénom et l'âge
- Créer une classe Chien, dont les attributs sont le prénom et l'âge
- Créer une méthode "crier" pour la classe Chat, qui affiche "miaou"
- Créer une méthode "crier" pour la classe Chat, qui affiche "ouaf"
- Créer une méthode "accueillir" pour la classe Refuge, qui prend en paramètre un chat ou un chien et qui l'ajoute dans "animaux_en_stock"
- Créer une méthode "crier_animaux" pour la classe Refuge, qui appelle la méthode crier de chaque animal dans "animaux_en_stock"