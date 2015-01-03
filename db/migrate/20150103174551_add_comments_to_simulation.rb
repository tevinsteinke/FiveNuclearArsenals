class AddCommentsToSimulation < ActiveRecord::Migration
  def change
    add_column :simulations, :comments, :string
  end
end
