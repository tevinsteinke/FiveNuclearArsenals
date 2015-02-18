class AddAnalysisFieldsToSimulations < ActiveRecord::Migration
  def change
    add_column :simulations, :recommendComments, :text
    add_column :simulations, :unexpectedComments, :text
    add_column :simulations, :vulnerableComments, :text
  end
end
