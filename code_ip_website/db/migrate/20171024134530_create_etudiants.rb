class CreateEtudiants < ActiveRecord::Migration[5.1]
  def change
    create_table :etudiants do |t|
      t.string :nom
      t.string :prenom
      t.date :date_naissance
      t.references :master, foreign_key: true

      t.timestamps
    end
  end
end
