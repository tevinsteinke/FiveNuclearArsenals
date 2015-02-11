class AlterColumnSimulationsComments < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.change :comments, :text
    end
  end
  def self.up
    change_table :products do |t|
      t.change :comments, :string
    end
  end
end
