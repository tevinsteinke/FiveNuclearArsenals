json.array!(@initial_surveys) do |initial_survey|
  json.extract! initial_survey, :id, :timeSpent, :currentPosition, :positionAffiliation, :weaponsBenefit, :superiorToRussia, :equalToRussia, :numberOfWeapons, :ssbnSurvivability, :survivabilityImportance, :ssbnValuable, :icbmValuable, :groupOneSuggestions, :groupTwoSuggestions, :groupThreeSuggestions, :groupFourSuggestions, :groupFiveSuggestions
  json.url initial_survey_url(initial_survey, format: :json)
end
