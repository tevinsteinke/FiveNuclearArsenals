class CreateInitialSurveys < ActiveRecord::Migration
  def change
    create_table :initial_surveys do |t|
      t.string :timeSpent
      t.string :currentPosition
      t.string :positionAffiliation
      t.string :weaponsBenefit
      t.string :superiorToRussia
      t.string :equalToRussia
      t.string :numberOfWeapons
      t.string :ssbnSurvivability
      t.string :survivabilityImportance
      t.string :ssbnValuable
      t.string :icbmValuable
      t.string :groupOneSuggestions
      t.string :groupTwoSuggestions
      t.string :groupThreeSuggestions
      t.string :groupFourSuggestions
      t.string :groupFiveSuggestions

      t.timestamps
    end
  end
end
