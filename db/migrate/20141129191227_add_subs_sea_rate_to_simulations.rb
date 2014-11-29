class AddSubsSeaRateToSimulations < ActiveRecord::Migration
  def change
    add_column :simulations, :subsSeaRate, :decimal
  end
end
