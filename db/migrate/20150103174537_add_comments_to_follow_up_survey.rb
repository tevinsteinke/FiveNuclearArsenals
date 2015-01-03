class AddCommentsToFollowUpSurvey < ActiveRecord::Migration
  def change
    add_column :follow_up_surveys, :comments, :string
  end
end
