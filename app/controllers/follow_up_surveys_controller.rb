class FollowUpSurveysController < ApplicationController
  before_action :set_follow_up_survey, only: [:show, :edit, :update, :destroy]

  # GET /follow_up_surveys
  # GET /follow_up_surveys.json
  def index
    @follow_up_surveys = FollowUpSurvey.all
    respond_to do |format|
      format.html { render :action => "index" }
      format.csv { send_data FollowUpSurvey.to_csv(@follow_up_surveys) }
    end
  end

  # GET /follow_up_surveys/1
  # GET /follow_up_surveys/1.json
  def show
  end

  # GET /follow_up_surveys/new
  def new
    @follow_up_survey = FollowUpSurvey.new
  end

  # GET /follow_up_surveys/1/edit
  def edit
  end

  # POST /follow_up_surveys
  # POST /follow_up_surveys.json
  def create
    @follow_up_survey = FollowUpSurvey.new(follow_up_survey_params)
    @follow_up_survey.user = cookies[:user] 

    respond_to do |format|
      if @follow_up_survey.save
        format.html { redirect_to @follow_up_survey, notice: 'Follow up survey was successfully created.' }
        format.json { render :show, status: :created, location: @follow_up_survey }
      else
        format.html { render :new }
        format.json { render json: @follow_up_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follow_up_surveys/1
  # PATCH/PUT /follow_up_surveys/1.json
  def update
    respond_to do |format|
      if @follow_up_survey.update(follow_up_survey_params)
        format.html { redirect_to @follow_up_survey, notice: 'Follow up survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow_up_survey }
      else
        format.html { render :edit }
        format.json { render json: @follow_up_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follow_up_surveys/1
  # DELETE /follow_up_surveys/1.json
  def destroy
    @follow_up_survey.destroy
    respond_to do |format|
      format.html { redirect_to follow_up_surveys_url, notice: 'Follow up survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow_up_survey
      @follow_up_survey = FollowUpSurvey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follow_up_survey_params
      params.require(:follow_up_survey).permit(:weaponsBenefit, :superiorRussia, :equalRussia, :adversaryRelevancy, :ssbnSurvivability, :survivabilityImportance, :ssbnValue, :icbmValue, :groupOneSuggestions, :groupTwoSuggestions, :groupThreeSuggestions, :groupFourSuggestions, :groupFiveSuggestions)
    end
end
