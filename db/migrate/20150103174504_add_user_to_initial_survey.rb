class AddUserToInitialSurvey < ActiveRecord::Migration
  def change
    add_column :initial_surveys, :user, :string
  end
end
