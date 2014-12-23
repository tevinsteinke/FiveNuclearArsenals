class CreateFollowUpSurveys < ActiveRecord::Migration
  def change
    create_table :follow_up_surveys do |t|
      t.string :weaponsBenefit
      t.string :superiorRussia
      t.string :equalRussia
      t.string :adversaryRelevancy
      t.string :ssbnSurvivability
      t.string :survivabilityImportance
      t.string :ssbnValue
      t.string :icbmValue
      t.string :groupOneSuggestions
      t.string :groupTwoSuggestions
      t.string :groupThreeSuggestions
      t.string :groupFourSuggestions
      t.string :groupFiveSuggestions

      t.timestamps
    end
  end
end
