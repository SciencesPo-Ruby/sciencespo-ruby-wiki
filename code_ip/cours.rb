class Cours
  attr_accessor :horaire_debut, :horaire_fin, :jour, :nom, :enseignant, :nb_max

  def initialize(p_horaire_debut, p_horaire_fin, p_jour, p_nom, p_enseignant, p_nb_max)
    @horaire_debut = p_horaire_debut
    @horaire_fin = p_horaire_fin
    @jour = p_jour
    @nom = p_nom
    @enseignant = p_enseignant
    @nb_max = p_nb_max
  end
  
end
