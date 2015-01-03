class AddUserToFollowUpSurvey < ActiveRecord::Migration
  def change
    add_column :follow_up_surveys, :user, :string
  end
end
