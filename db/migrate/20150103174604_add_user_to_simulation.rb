class AddUserToSimulation < ActiveRecord::Migration
  def change
    add_column :simulations, :user, :string
  end
end
