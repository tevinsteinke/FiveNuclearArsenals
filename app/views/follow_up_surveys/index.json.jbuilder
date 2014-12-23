json.array!(@follow_up_surveys) do |follow_up_survey|
  json.extract! follow_up_survey, :id, :weaponsBenefit, :superiorRussia, :equalRussia, :adversaryRelevancy, :ssbnSurvivability, :survivabilityImportance, :ssbnValue, :icbmValue, :groupOneSuggestions, :groupTwoSuggestions, :groupThreeSuggestions, :groupFourSuggestions, :groupFiveSuggestions
  json.url follow_up_survey_url(follow_up_survey, format: :json)
end
