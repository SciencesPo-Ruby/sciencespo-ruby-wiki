load 'cours.rb'

class Agenda
  attr_accessor :tab_cours

  def initialize()
    @tab_cours = []
  end

  def afficher
    # Afficher le nom de tous les cours stockés dans l'agenda
    @tab_cours.each do |cours|
      puts cours.nom
    end
  end

end
