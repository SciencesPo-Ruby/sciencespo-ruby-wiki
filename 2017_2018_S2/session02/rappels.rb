# Début de fichier
variable = "Ma chaine"
puts variable

total = 2+2
puts total

# Ma premiere fonction
def helloworld
  puts "Hello World"
end

helloworld()

# Ma premiere fonction avec des parametres
def saluer(prenom)
  puts "Bonjour "+prenom
end

saluer("Maxime")
saluer("Thierry")

# Tableaux
def lireTableau(tab)
  # tab.each signifie pour chaque valeur de tab...
  # ...do signifie "exécuter / faire"...
  # ...|temp| signifie que chaque valeur de tab sera appelée temp
  tab.each do |temp|
    puts temp # Affiche le contenu de temp
  end # Ce "end" ferme le "do"
end # Ce "end" ferme le "def"

monPremierTableau = ["element 1","element 2"]
monPremierTableau.push("element 3") # ajoute un element par la droite
monPremierTableau.unshift("element 0") # ajoute un element par la gauche
# Attention : monPremierTableau contient maintenant 4 éléments !
lireTableau(monPremierTableau)

monSecondTableau = [1,2,3,4,5]
lireTableau(monSecondTableau)

###########
## Exercice
###########

# Session 2 - Exercice 1
# ----------------------
# Définition :
# Créer une fonction nommée "saluer_plusieurs",
# qui prend en paramètre une variable nommée "prenoms".
# Cette variable "prenoms" contiendra un tableau de prénoms.
# -
# Objectif :
# saluer_plusieurs affichera alors "Bonjour PRENOM",
# pour chaque prénom contenu dans la variable "prenoms",
# en remplaçant PRENOM par le prénom lu.
# -
# Exemples :
# saluer_plusieurs(["Thierry","Jean"]) affichera :
# Bonjour Thierry
# Bonjour Jean


def saluer_plusieurs(x) #x sera un tableau
  # Pour chaque élément dans x...
  # ...j'appelle cet élément "temp"...
  x.each do |temp|
    # ...et j'exécute ce qu'il y a...
    # ...entre le "do" et le "end"
    puts "Bonjour "+temp
  end
end
x = ["Thierry","Jean"]
saluer_plusieurs(x)



































