class AlterColumnSimulationsSubsMirv < ActiveRecord::Migration
  def self.up
    change_table :simulations do |t|
      t.change :subsMirv, :decimal, :precision => 10, :scale => 2
    end
  end
  def self.down
    change_table :simulations do |t|
      t.change :subsMirv, :float
    end
  end
end
