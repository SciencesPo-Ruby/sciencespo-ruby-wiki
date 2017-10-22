load 'agenda.rb'

class Etudiant
  attr_accessor :nom, :prenom, :date_naissance, :emploi_du_temps

  def initialize(p_nom, p_prenom, p_date_naissance)
    @nom = p_nom
    @prenom = p_prenom
    @date_naissance = p_date_naissance
    @emploi_du_temps = Agenda.new()
  end

  def inscrire(cours)
    @emploi_du_temps.tab_cours = @emploi_du_temps.tab_cours.push(cours)
  end

end
