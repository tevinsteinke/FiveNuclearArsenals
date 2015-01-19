class AddAgeToInitialSurveys < ActiveRecord::Migration
  def change
    add_column :initial_surveys, :age, :string
  end
end
