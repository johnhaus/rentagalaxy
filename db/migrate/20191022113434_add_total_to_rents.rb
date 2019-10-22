class AddTotalToRents < ActiveRecord::Migration[5.2]
  def change
    add_column :rents, :total_days, :integer
    add_column :rents, :total_price, :integer
  end
end
