class InitialSurvey < ActiveRecord::Base

  def self.to_csv(surveys)
    CSV.generate do |csv|
      csv << column_names
      surveys.each do |survey|
        csv << survey.attributes.values
      end
    end
  end

end
