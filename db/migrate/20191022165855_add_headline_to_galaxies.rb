class AddHeadlineToGalaxies < ActiveRecord::Migration[5.2]
  def change
    add_column :galaxies, :headline, :string
  end
end
