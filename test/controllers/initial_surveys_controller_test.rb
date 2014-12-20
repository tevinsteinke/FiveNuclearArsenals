require 'test_helper'

class InitialSurveysControllerTest < ActionController::TestCase
  setup do
    @initial_survey = initial_surveys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:initial_surveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create initial_survey" do
    assert_difference('InitialSurvey.count') do
      post :create, initial_survey: { currentPosition: @initial_survey.currentPosition, equalToRussia: @initial_survey.equalToRussia, groupFiveSuggestions: @initial_survey.groupFiveSuggestions, groupFourSuggestions: @initial_survey.groupFourSuggestions, groupOneSuggestions: @initial_survey.groupOneSuggestions, groupThreeSuggestions: @initial_survey.groupThreeSuggestions, groupTwoSuggestions: @initial_survey.groupTwoSuggestions, icbmValuable: @initial_survey.icbmValuable, numberOfWeapons: @initial_survey.numberOfWeapons, positionAffiliation: @initial_survey.positionAffiliation, ssbnSurvivability: @initial_survey.ssbnSurvivability, ssbnValuable: @initial_survey.ssbnValuable, superiorToRussia: @initial_survey.superiorToRussia, survivabilityImportance: @initial_survey.survivabilityImportance, timeSpent: @initial_survey.timeSpent, weaponsBenefit: @initial_survey.weaponsBenefit }
    end

    assert_redirected_to initial_survey_path(assigns(:initial_survey))
  end

  test "should show initial_survey" do
    get :show, id: @initial_survey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @initial_survey
    assert_response :success
  end

  test "should update initial_survey" do
    patch :update, id: @initial_survey, initial_survey: { currentPosition: @initial_survey.currentPosition, equalToRussia: @initial_survey.equalToRussia, groupFiveSuggestions: @initial_survey.groupFiveSuggestions, groupFourSuggestions: @initial_survey.groupFourSuggestions, groupOneSuggestions: @initial_survey.groupOneSuggestions, groupThreeSuggestions: @initial_survey.groupThreeSuggestions, groupTwoSuggestions: @initial_survey.groupTwoSuggestions, icbmValuable: @initial_survey.icbmValuable, numberOfWeapons: @initial_survey.numberOfWeapons, positionAffiliation: @initial_survey.positionAffiliation, ssbnSurvivability: @initial_survey.ssbnSurvivability, ssbnValuable: @initial_survey.ssbnValuable, superiorToRussia: @initial_survey.superiorToRussia, survivabilityImportance: @initial_survey.survivabilityImportance, timeSpent: @initial_survey.timeSpent, weaponsBenefit: @initial_survey.weaponsBenefit }
    assert_redirected_to initial_survey_path(assigns(:initial_survey))
  end

  test "should destroy initial_survey" do
    assert_difference('InitialSurvey.count', -1) do
      delete :destroy, id: @initial_survey
    end

    assert_redirected_to initial_surveys_path
  end
end
