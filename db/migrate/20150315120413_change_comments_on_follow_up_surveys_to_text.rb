class ChangeCommentsOnFollowUpSurveysToText < ActiveRecord::Migration
  def up
    change_column :follow_up_surveys, :comments, :text, :limit => nil
  end

  def down
    change_column :follow_up_surveys, :comments, :string
  end
end
