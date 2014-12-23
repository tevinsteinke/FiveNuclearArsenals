require 'test_helper'

class FollowUpSurveysControllerTest < ActionController::TestCase
  setup do
    @follow_up_survey = follow_up_surveys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:follow_up_surveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create follow_up_survey" do
    assert_difference('FollowUpSurvey.count') do
      post :create, follow_up_survey: { adversaryRelevancy: @follow_up_survey.adversaryRelevancy, equalRussia: @follow_up_survey.equalRussia, groupFiveSuggestions: @follow_up_survey.groupFiveSuggestions, groupFourSuggestions: @follow_up_survey.groupFourSuggestions, groupOneSuggestions: @follow_up_survey.groupOneSuggestions, groupThreeSuggestions: @follow_up_survey.groupThreeSuggestions, groupTwoSuggestions: @follow_up_survey.groupTwoSuggestions, icbmValue: @follow_up_survey.icbmValue, ssbnSurvivability: @follow_up_survey.ssbnSurvivability, ssbnValue: @follow_up_survey.ssbnValue, superiorRussia: @follow_up_survey.superiorRussia, survivabilityImportance: @follow_up_survey.survivabilityImportance, weaponsBenefit: @follow_up_survey.weaponsBenefit }
    end

    assert_redirected_to follow_up_survey_path(assigns(:follow_up_survey))
  end

  test "should show follow_up_survey" do
    get :show, id: @follow_up_survey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @follow_up_survey
    assert_response :success
  end

  test "should update follow_up_survey" do
    patch :update, id: @follow_up_survey, follow_up_survey: { adversaryRelevancy: @follow_up_survey.adversaryRelevancy, equalRussia: @follow_up_survey.equalRussia, groupFiveSuggestions: @follow_up_survey.groupFiveSuggestions, groupFourSuggestions: @follow_up_survey.groupFourSuggestions, groupOneSuggestions: @follow_up_survey.groupOneSuggestions, groupThreeSuggestions: @follow_up_survey.groupThreeSuggestions, groupTwoSuggestions: @follow_up_survey.groupTwoSuggestions, icbmValue: @follow_up_survey.icbmValue, ssbnSurvivability: @follow_up_survey.ssbnSurvivability, ssbnValue: @follow_up_survey.ssbnValue, superiorRussia: @follow_up_survey.superiorRussia, survivabilityImportance: @follow_up_survey.survivabilityImportance, weaponsBenefit: @follow_up_survey.weaponsBenefit }
    assert_redirected_to follow_up_survey_path(assigns(:follow_up_survey))
  end

  test "should destroy follow_up_survey" do
    assert_difference('FollowUpSurvey.count', -1) do
      delete :destroy, id: @follow_up_survey
    end

    assert_redirected_to follow_up_surveys_path
  end
end
