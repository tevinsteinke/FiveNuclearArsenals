class AddBombersPercentageToSimulations < ActiveRecord::Migration
  def change
    add_column :simulations, :bombsPercentage, :float
  end
end
