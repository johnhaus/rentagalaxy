class CreateGalaxies < ActiveRecord::Migration[5.2]
  def change
    create_table :galaxies do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :owner

      t.timestamps
    end
  end
end
