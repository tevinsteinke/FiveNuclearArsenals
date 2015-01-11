class SimulationsController < ApplicationController
  before_action :set_simulation, only: [:show, :edit, :update, :destroy]

  # GET /simulations
  # GET /simulations.json
  def index
    @simulations = Simulation.all
    respond_to do |format|
      format.html { render :action => "index" }
      format.csv { send_data Simulation.to_csv(@simulations) }
    end
  end

  # GET /simulations/1
  # GET /simulations/1.json
  def show
  end

  # GET /simulations/new
  def new
    @simulation = Simulation.new
  end

  # GET /simulations/1/edit
  def edit
  end

  def add_comments
    @simulation = Simulation.find(params[:simulation_id])
    @simulation.comments = (params[:comments])

    @simulation.save
  end

  # POST /simulations
  # POST /simulations.json
  def create
    @simulation = Simulation.new(simulation_params)
    @simulation.user = cookies[:user] 

    respond_to do |format|
      if @simulation.save
        format.html { redirect_to @simulation, notice: 'Simulation was successfully created.' }
        format.json { render :show, status: :created, location: @simulation }
      else
        format.html { render :new }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /simulations/1
  # PATCH/PUT /simulations/1.json
  def update
    respond_to do |format|
      if @simulation.update(simulation_params)
        if @simulation.comments
          if cookies[:doneForceStructure]
            format.html { redirect_to new_follow_up_survey_path, notice: 'Comments were successfully added.' }
            format.json { render :show, status: :ok, location: @simulation }
          else
            format.html { redirect_to new_simulation_path, notice: 'Comments were successfully added.' }
            format.json { render :show, status: :ok, location: @simulation }
          end
        else
          format.html { redirect_to @simulation, notice: 'Simulation was successfully updated.' }
          format.json { render :show, status: :ok, location: @simulation }
        end
      else
        format.html { render :edit }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulations/1
  # DELETE /simulations/1.json
  def destroy
    @simulation.destroy
    respond_to do |format|
      format.html { redirect_to simulations_url, notice: 'Simulation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simulation
      @simulation = Simulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simulation_params
      params.require(:simulation).permit(
        :blueInventory, 
        :redInventory, 
        :icbmMax, 
        :icbmMirv, 
        :icbmProb, 
        :icbmAvail, 
        :icbmBlueLaunch, 
        :icbmBluePk, 
        :subsOperational, 
        :subsAtSea, 
        :subsRoundUp, 
        :subsWeaps, 
        :subsPlusIcbms, 
        :subsPlusBombs, 
        :subsTubes, 
        :subsMirv, 
        :subsNavy, 
        :bombsNumber, 
        :bombsSurvive, 
        :bombsPostStrike, 
        :redRatio, 
        :redTarget, 
        :redPk,
        :redBases, 
        :redBlueIcbms, 
        :redFirstStrike, 
        :redSurviving, 
        :blueSurviving, 
        :deltaSurviving, 
        :ratioSurviving, 
        :subsSeaRate, 
        :user, 
        :comments
      )
    end
end
