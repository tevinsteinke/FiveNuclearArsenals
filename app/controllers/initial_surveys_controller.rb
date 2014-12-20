class InitialSurveysController < ApplicationController
  before_action :set_initial_survey, only: [:show, :edit, :update, :destroy]

  # GET /initial_surveys
  # GET /initial_surveys.json
  def index
    @initial_surveys = InitialSurvey.all
  end

  # GET /initial_surveys/1
  # GET /initial_surveys/1.json
  def show
  end

  # GET /initial_surveys/new
  def new
    @initial_survey = InitialSurvey.new
  end

  # GET /initial_surveys/1/edit
  def edit
  end

  # POST /initial_surveys
  # POST /initial_surveys.json
  def create
    @initial_survey = InitialSurvey.new(initial_survey_params)

    respond_to do |format|
      if @initial_survey.save
        format.html { redirect_to @initial_survey, notice: 'Initial survey was successfully created.' }
        format.json { render :show, status: :created, location: @initial_survey }
      else
        format.html { render :new }
        format.json { render json: @initial_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /initial_surveys/1
  # PATCH/PUT /initial_surveys/1.json
  def update
    respond_to do |format|
      if @initial_survey.update(initial_survey_params)
        format.html { redirect_to @initial_survey, notice: 'Initial survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @initial_survey }
      else
        format.html { render :edit }
        format.json { render json: @initial_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /initial_surveys/1
  # DELETE /initial_surveys/1.json
  def destroy
    @initial_survey.destroy
    respond_to do |format|
      format.html { redirect_to initial_surveys_url, notice: 'Initial survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_initial_survey
      @initial_survey = InitialSurvey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def initial_survey_params
      params.require(:initial_survey).permit(:timeSpent, :currentPosition, :positionAffiliation, :weaponsBenefit, :superiorToRussia, :equalToRussia, :numberOfWeapons, :ssbnSurvivability, :survivabilityImportance, :ssbnValuable, :icbmValuable, :groupOneSuggestions, :groupTwoSuggestions, :groupThreeSuggestions, :groupFourSuggestions, :groupFiveSuggestions)
    end
end
