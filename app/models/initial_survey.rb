class InitialSurvey < ActiveRecord::Base
  serialize :groupOneSuggestions, Array
  serialize :groupTwoSuggestions, Array
  serialize :groupThreeSuggestions, Array
  serialize :groupFourSuggestions, Array
  serialize :groupFiveSuggestions, Array

  def self.to_csv(surveys)
    CSV.generate do |csv|
      csv << column_names
      surveys.each do |survey|
        csv << survey.attributes.values
      end
    end
  end

end
