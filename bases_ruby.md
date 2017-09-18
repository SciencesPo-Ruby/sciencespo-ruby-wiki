# Ruby : les bases

## Présentation générale

Ruby est un langage de programmation créé en 1995 par Yukihiro Matsumoto, qui repose sur de grands principes de simplicité permettant de concevoir rapidement et en peu de code des logiciels complets.

Ruby est un langage idéal pour débuter en programmation informatique, et pour faire des projets rapidement sans contraintes particulières de performances.

## Les grands principes

### Les opérations de base

Tout comme une calculatrice, il est possible de réaliser les opérations mathématiques de base `+` (addition), `-` (soustraction), `*` (multiplication), `/` (division).

Ainsi, écrire `3+2` en Ruby additionnera les chiffres 3 et 2.

### Afficher un résultat

Pour afficher le résultat d'une instruction, il faut utiliser la commande `puts INSTRUCTION`.

Cette commande affichera dans la console le résultat de l'instruction.

Exemple :
```ruby
puts 3+2
```
=> affichera 5

### Stocker un résultat

Par défaut, le résultat d'une instruction est perdu : il faut donc spécifiquement indiquer à l'ordinateur que l'on souhaite stocker le fruit de notre travail dans sa mémoire.

Pour cela, on utilise ce que l'on appelle "l'affectation".

Pour affecter une instruction dans la mémoire et donc en stocker le résultat, on utilise la syntaxe : `variable = instruction`. Dans ce cas, "variable" stockera le résultat de l'instruction.

Il est alors possible d'utiliser la commande `puts VARIABLE` pour afficher le contenu de celle-ci.

Exemple :

```ruby
resultat = 3+2
puts resultat
```

=> affichera 5

### Les chaînes de caractères

Au-delà des chiffres, Ruby permet également de traiter du texte.

Le texte est une suite de caractères, appelée "chaîne de caractères".

Une chaîne de caractères est délimitée par un guillemet double `"` ou un guillemet simple `'`.

Exemple :
```ruby
puts "Hello World!"
```

=> affichera Hello World!

Une opération très pratique existe pour les chaînes de caractères : la concaténation. Cette opération, notée `+`, permet de mettre bout à bout deux chaînes de caractères.

Exemple :

```ruby
chaine1 = "Début"
chaine2 = "Fin"
puts chaine1+chaine2
```

=> affichera DébutFin

### Les fonctions

La programmation consiste à mettre bout à bout une série d'instructions permettant de traiter de l'information afin de créer de la valeur.

Souvent, l'informaticien se retrouve à réutiliser plusieurs fois une même série d'instructions.

Par exemple, prenons le cas d'une série d'instructions permettant de saluer plusieurs personnes :

```ruby
puts "Bonjour Yann, bienvenue dans ce cours !"
puts "Bonjour Christopher, bienvenue dans ce cours !"
puts "Bonjour Eve, bienvenue dans ce cours !"
puts "Bonjour Pauline, bienvenue dans ce cours !"
puts "Bonjour Marion, bienvenue dans ce cours !"
```

On note que ces phrases ont beaucoup d'éléments en commun : "Bonjour", et ", bienvenue dans ce cours !".

Il y a donc beaucoup de répétitions, et l'informatique nous permet de simplifier tout cela.

Nous pouvons ainsi définir une série d'instructions répétables, dont la seule information qui change est un prénom :

```ruby
prenom = "Yann"
puts "Bonjour "+prenom+", bienvenue dans ce cours !"
```

En changeant le contenu de "prenom", on change le texte affiché par ces deux lignes de code.

On peut alors aller un peu plus loin et donner un nom à cette suite d'instructions afin de pouvoir s'en resservir facilement par la suite : on  transforme ces instructions en fonction.

La notation d'une fonction est la suivante :
```ruby
def nomfonction(parametres)
  instructions...
end
```

Dans notre cas, pour saluer un prénom, on peut noter :
```ruby
def saluer(prenom)
  puts "Bonjour "+prenom+", bienvenue dans ce cours !"
end
```

On peut ensuite utiliser "saluer" en lui donnant comme paramètre le prénom à saluer, afin d'exécuter les instructions sur ce prénom : on dit que l'on "appelle" la fonction et qu'on lui passe comme "argument" le paramètre prénom.

```ruby
saluer("Yann")
saluer("Christopher")
saluer("Eve")
saluer("Pauline")
saluer("Marion")
```

=> affiche la même chose que l'écran précédent, avec beaucoup moins de répétitions !

### Les tableaux

Parfois, nous avons besoin de stocker un nombre flexible d'informations dans la mémoire de l'ordinateur.

De manière naïve, on pourrait alors prévoir un grand nombre de variables afin de stocker ces informations en mémoire.

Exemple :
```ruby
def saluer_plusieurs(prenom1, prenom2, prenom3)
  saluer(prenom1)
  saluer(prenom2)
  saluer(prenom3)
end
```

Mais que se passe t-il si je veux saluer une quatrième personne ?

On utilise pour cela une manière plus flexible de stocker de l'information : un tableau.

Un tableau est délimité par `[` à son début, et `]` à sa fin.

On peut ainsi écrire :
```ruby
[10,20,30,40,50]
```

Ce tableau contient les éléments 10, 20, 30, 40 et 50.

On peut alors stocker l'ensemble de ces éléments dans une seule variable :
```ruby
montableau = [10,20,30,40,50]
```

Pour accéder aux éléments d'un tableau, on écrit `tableau[i]` où i correspond au i-ème élément du tableau, en commençant avec 0. `i` est appelé l'index de l'élément auquel on accède

Cela permet ensuite d'accéder à ces informations de la manière suivante :
```ruby
montableau = [10,20,30,40,50]
puts montableau[0]
puts montableau[2]
```

=> affiche 10 qui est l'élément d'index 0, puis affiche 30 qui est l'élément d'index 2

On peut également "boucler" sur l'ensemble des éléments d'un tableau : cela veut dire que l'on va exécuter une série d'instructions sur chacun des éléments de ce tableau, dans l'ordre.

On écrit pour cela :
```ruby
tableau.each do |element|
  instructions...
end
```

Exemple :
```ruby
montableau = [10,20,30,40,50]
montableau.each do |element|
  puts element + 5
end
```

Ici, on prend chaque élément de "montableau" (10, puis 20, puis 30, puis 40, puis 50), on y ajoute 5, et on affiche le résultat.

=> affiche 15, puis 25, puis 35, puis 45, puis 55

Grâce à ce principe, on peut créer une fonction "saluer_plusieurs" plus pratique :

```ruby
def saluer_plusieurs(tableauprenoms)
  tableauprenoms.each do |prenom|
    saluer(prenom)
  end
end
```

On peut ensuite exécuter :
```ruby
montableau1 = ["Yann", "Christopher", "Eve"]
saluer_plusieurs(montableau1)
montableau2 = ["Yann", "Christopher", "Eve", "Pauline", "Marion"]
saluer_plusieurs(montableau2)
```

### "Retourner" un résultat

Lorsque nous écrirons nos fonctions, nous serons souvent amenés à travailler avec le résultat qu'elles produisent.

Exemple :
```ruby
def foisdeux(nombre)
  puts nombre*2
end
```

Cette fonction affiche à l'écran le nombre passé en paramètre, multiplié par 2.

Dès lors, on pourrait être tenté de taper :
```ruby
foisdeux(foisdeux(5))
```
afin de multiplier par 2, puis encore par 2, le nombre 5.

Pourtant, si on exécute ceci, on obtient l'erreur suivante :
```
NoMethodError: undefined method '*' for nil:NilClass
```

Cela vient du fait que l'instruction "puts" affiche un élément à l'écran, sans en stocker le résultat dans la mémoire de l'ordinateur : on dit que cette instruction ne renvoie "rien" (rien étant noté "nil" dans Ruby).

Ainsi, quand on exécute `foisdeux(foisdeux(5))` pas à pas, l'ordinateur fait :
- Exécution de `foisdeux(foisdeux(5))`
- Calculer 5*2, soit 10
- Afficher 10 et remplacer 'foisdeux(5)' par 'nil' dans la ligne précédente (instruction 'puts')
- Exécution de `foisdeux(nil)`
- Erreur car exécuter nil*2 (rien fois 2) n'est pas possible pour la machine.

Afin de corriger ce problème, on utilise le mot-clé "return ELEMENT" qui dit à Ruby que la fonction a pour but de mettre en mémoire le contenu de ELEMENT, pour s'en servir plus tard.

On dit alors que la fonction "retourne" ou "renvoie" ELEMENT.


Exemple :
```ruby
def foisdeux(nombre)
  return nombre*2
end
```

Dans ce cas, si on exécute à nouveau `foisdeux(foisdeux(5))` pas à pas, l'ordinateur fait :
- Exécution de `foisdeux(foisdeux(5))`
- Calculer 5*2 soit 10, et remplacer 'foisdeux(5)' par 10 dans la ligne précédente (instruction return)
- Exécution de `foisdeux(10)`
- Calculer 10*2 soit 20, et remplacer 'foisdeux(10)' par 20 dans la ligne précédente (instruction return)

Pour finir, on peut aller un peu plus loin et combiner 'puts' sur des fonctions qui utilisent le mot-clé 'return'.

Ainsi, si on exécute à nouveau `puts foisdeux(foisdeux(5))` pas à pas, l'ordinateur fait :
- Exécution de `puts foisdeux(foisdeux(5))`
- Calculer 5*2 soit 10, et remplacer 'foisdeux(5)' par 10 dans la ligne précédente (instruction return)
- Exécution de `puts foisdeux(10)`
- Calculer 10*2 soit 20, et remplacer 'foisdeux(10)' par 20 dans la ligne précédente (instruction return)
- Exécution de 'puts 20'
- Afficher 20

Cette notion sera de plus en plus claire avec la pratique.

En cas de doute, une règle simple pour éviter les erreurs est de ne jamais utiliser 'puts' à la fin d'une fonction, et de privilégier 'return'.

### Les conditions

Enfin, nous serons souvent amenés à utiliser des instructions qui dépendront des résultats précédents : on appelle cela des instructions "conditionnelles".

Leur notation est :
```ruby
if condition
  instruction si condition est vraie
else
  instruction si condition fausse
end
```

Exemple :
```ruby
def sup3(nombre)
  resultat = ""
  if nombre > 3
    resultat = "Le nombre est supérieur à 3 !"
  else
    resultat = "Le nombre est inférieur ou égal à 3 !"
  end
  return resultat
end

puts sup(5) # nombre > 3 vaut vrai, on exécute ce qui est après le if et avant le else
puts sup(2) # nombre > 3 vaut faux, on exécute ce qui est après le else
puts sup(3) # nombre > 3 vaut faux, on exécute ce qui est après le else
```

## Exercices

1) Créer une fonction 'inverse_chaine' qui prend en paramètre une chaîne de caractères et en retourne l'inverse.

Exemples :
- `inverse_chaine("coucou")` retourne "uocuoc"
- `inverse_chaine("sciencespo")` retourne "opsecneics"


2) Créer une fonction 'is_palindrome' qui prend en paramètre une chaîne de caractères et qui retourne True si la chaîne est un palindrome, False sinon.

Exemples :
- `is_palindrome("coucou")` retourne False
- `is_palindrome("kayak")` retourne True


3) Créer une fonction 'compte_voyelles' qui prend en paramètre une chaîne de caractères, et compte les voyelles de cette chaîne de caractères

Exemples :
- `compte_voyelles("coucou")` retourne 4
- `compte_voyelles("kayak")` retourne 3


4) Créer une fonction 'compte_voyelles_occ' qui prend en paramètre une chaîne de caractères, et compte les occurrences de chaque voyelle dans cette chaîne. On utilisera pour cela un tableau où :

- la case d'index 0 contiendra le nombre de 'a'
- la case d'index 1 contiendra le nombre de 'e'
- la case d'index 2 contiendra le nombre de 'i'
- la case d'index 3 contiendra le nombre de 'o'
- la case d'index 4 contiendra le nombre de 'u'
- la case d'index 5 contiendra le nombre de 'y'

Exemples :
- `compte_voyelles_occ("coucou")` retourne [0,0,0,2,2,0]
- `compte_voyelles_occ("kayak")` retourne [2,0,0,0,0,1]

5) Créer une fonction 'code_cesar' qui prend en paramètres une chaîne de caractères et un nombre de décalages à effectuer, et qui renvoie la chaîne de caractères chiffrée avec l'algorithme du code de César

Exemples :
- 'code_cesar("test",1)' retourne "uftu"
- 'code_cesar("bonjour",5)' retourne "gtsotzw"
