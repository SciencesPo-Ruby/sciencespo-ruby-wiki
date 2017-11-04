class CreateMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :masters do |t|
      t.string :nom
      t.string :responsable
      t.integer :effectif_max

      t.timestamps
    end
  end
end
