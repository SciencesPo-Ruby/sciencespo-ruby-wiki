# Exercices sur les Hashs

### ----------
### CONCEPTION
### ----------

# Variables globales pour le programme
LISTE_COURS = []
LISTE_ETUDIANTS = []

# Fonction qui ajoute un cours dans LISTE_COURS
# Parametres :
# - effectif (entier)
# - effectif_limite (entier)
# - nom (chaine de caracteres)
# - enseignant_nom (chaine de caracteres)
def ajouter_cours(effectif_param, effectif_limite_param, nom_param, enseignant_nom_param)
  cours = {
    "effectif" => effectif_param,
    "effectif_limite" => effectif_limite_param,
    "nom" => nom_param,
    "enseignant_nom" => enseignant_nom_param
    }
  
  LISTE_COURS.push(cours)
end

# Fonction qui ajoute un etudiant dans LISTE_ETUDIANTS
# et incremente de 1 l'effectif du cours mentionne
# Parametres :
# - nom (chaine de caracteres)
# - prenom (chaine de caracteres)
# - niveau (chaine de caracteres)
# - cours_nom (chaine de caracteres)
def ajouter_etudiant(nom_param, prenom_param, niveau_param, cours_nom_param)
  # On definit un etudiant
  etudiant = {
    "nom" => nom_param,
    "prenom" => prenom_param,
    "niveau" => niveau_param
    }
  
  # On augmente de 1 l'effectif du cours auquel est inscrit l'etudiant
  inscrire_cours(cours_nom_param)
  
  # On ajoute l'etudiant a la liste des etudiants
  LISTE_ETUDIANTS.push(etudiant)
end

# Fonction qui affiche l'ensemble des cours contenus dans LISTE_COURS
def afficher_liste_cours()
  LISTE_COURS.each do |cours_temp|
    puts "---"
    puts "Nom du cours : "+cours_temp["nom"]
    puts "Effectif : "+cours_temp["effectif"].to_s+"/"+cours_temp["effectif_limite"].to_s
    puts "Enseignant : "+cours_temp["enseignant_nom"]
  end
end

# Fonction qui cherche un cours dans LISTE_COURS
# - cours_recherche_param (chaine de caracteres)
# cours_recherche_param est le nom du cours recherche
def cherche_cours(cours_recherche_param)
  LISTE_COURS.each do |cours_temp|
    # Est-ce que le cours est celui recherche ?
    if cours_temp["nom"] == cours_recherche_param
      return cours_temp # Je recupere tout l'item qui represente le cours recherche
    end
  end
end

# Fonction qui cherche un cours dans LISTE_COURS et qui augmente de 1 son effectif
# - cours_recherche_param (chaine de caracteres)
# cours_recherche_param est le nom du cours recherche
def inscrire_cours(cours_recherche_param)
  LISTE_COURS.each do |cours_temp|
    # Est-ce que le cours est celui recherche ?
    if cours_temp["nom"] == cours_recherche_param
      # Si oui, j'augmente son effectif de 1
      cours_temp["effectif"] = cours_temp["effectif"] + 1
    end
  end
end

### ----------
### PRODUCTION
### ----------

ajouter_cours(3, 5, "Droit public", "Yann Aguila")
ajouter_cours(1, 10, "Finances publiques", "Pierre-Matthieu Duhamel")
 
ajouter_etudiant("Le luron", "Thierry", "M1", "Finances publiques")

afficher_liste_cours()

#puts cherche_cours("Finances publiques")["effectif"]


















