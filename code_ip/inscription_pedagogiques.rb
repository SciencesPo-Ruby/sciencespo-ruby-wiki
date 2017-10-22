load 'agenda.rb'
load 'etudiant.rb'
load 'cours.rb'
require 'date'

# Définition des cours de ScPo
# Rappel :
# Cours a pour paramètres :
# horaire_debut, horaire_fin,
# jour, nom, enseignant, nb_max
CATALOGUE_COURS = [
  Cours.new(8, 10, 0, "Finances publiques", "DSK", 200),
  Cours.new(10, 12, 1, "Droit administratif", "Yann Aguila", 200),
  Cours.new(14, 16, 1, "Questions sociales", "Martin Hirsch", 100)
]

puts CATALOGUE_COURS[0].nom

# Afficher les cours qui ont lieu le Mardi
puts "Les cours qui ont lieu le Mardi sont :"

CATALOGUE_COURS.each do |cours|
  if cours.jour == 1 # 0 = Lundi, 1 = Mardi
    puts cours.nom # J'affiche le nom du cours
  end
end

# Paramètres d'étudiant
# (p_nom, p_prenom, p_date_naissance)
# Date a pour paramètres année, mois, jour
LISTE_ETUDIANTS = [
  Etudiant.new("Le luron", "Thierry", Date.new(1955,11,1)),
  Etudiant.new("Mion", "Frederic", Date.new(1975,1,5)),
  Etudiant.new("Boutmy", "Emile", Date.new(1942,6,8))
]

puts LISTE_ETUDIANTS[0].nom
puts "Etudiants nés avant 1960 :"
LISTE_ETUDIANTS.each do |etudiant|
  if etudiant.date_naissance.year < 1960
    puts etudiant.nom
  end
end

# Inscrire Frederic Mion à un cours de Questions sociales
LISTE_ETUDIANTS[1].inscrire(
  CATALOGUE_COURS[2]
)

puts "Cours de Frederic Mion :"
# Afficher l'emploi du temps de Frederic Mion
LISTE_ETUDIANTS[1].emploi_du_temps.afficher
