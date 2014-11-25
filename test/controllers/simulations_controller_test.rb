require 'test_helper'

class SimulationsControllerTest < ActionController::TestCase
  setup do
    @simulation = simulations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simulations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simulation" do
    assert_difference('Simulation.count') do
      post :create, simulation: { blueInventory: @simulation.blueInventory, blueSurviving: @simulation.blueSurviving, bombsNumber: @simulation.bombsNumber, bombsPostStrike: @simulation.bombsPostStrike, bombsSurvive: @simulation.bombsSurvive, deltaSurviving: @simulation.deltaSurviving, icbmAvail: @simulation.icbmAvail, icbmBlueLaunch: @simulation.icbmBlueLaunch, icbmBluePk: @simulation.icbmBluePk, icbmMax: @simulation.icbmMax, icbmMirv: @simulation.icbmMirv, icbmProb: @simulation.icbmProb, ratioSurviving: @simulation.ratioSurviving, redBases: @simulation.redBases, redBlueIcbms: @simulation.redBlueIcbms, redFirstStrike: @simulation.redFirstStrike, redInventory: @simulation.redInventory, redPk: @simulation.redPk, redRatio: @simulation.redRatio, redSurviving: @simulation.redSurviving, redTarget: @simulation.redTarget, subsAtSea: @simulation.subsAtSea, subsMirv: @simulation.subsMirv, subsNavy: @simulation.subsNavy, subsOperational: @simulation.subsOperational, subsPlusBombs: @simulation.subsPlusBombs, subsPlusIcbms: @simulation.subsPlusIcbms, subsRoundUp: @simulation.subsRoundUp, subsTubes: @simulation.subsTubes, subsWeaps: @simulation.subsWeaps }
    end

    assert_redirected_to simulation_path(assigns(:simulation))
  end

  test "should show simulation" do
    get :show, id: @simulation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @simulation
    assert_response :success
  end

  test "should update simulation" do
    patch :update, id: @simulation, simulation: { blueInventory: @simulation.blueInventory, blueSurviving: @simulation.blueSurviving, bombsNumber: @simulation.bombsNumber, bombsPostStrike: @simulation.bombsPostStrike, bombsSurvive: @simulation.bombsSurvive, deltaSurviving: @simulation.deltaSurviving, icbmAvail: @simulation.icbmAvail, icbmBlueLaunch: @simulation.icbmBlueLaunch, icbmBluePk: @simulation.icbmBluePk, icbmMax: @simulation.icbmMax, icbmMirv: @simulation.icbmMirv, icbmProb: @simulation.icbmProb, ratioSurviving: @simulation.ratioSurviving, redBases: @simulation.redBases, redBlueIcbms: @simulation.redBlueIcbms, redFirstStrike: @simulation.redFirstStrike, redInventory: @simulation.redInventory, redPk: @simulation.redPk, redRatio: @simulation.redRatio, redSurviving: @simulation.redSurviving, redTarget: @simulation.redTarget, subsAtSea: @simulation.subsAtSea, subsMirv: @simulation.subsMirv, subsNavy: @simulation.subsNavy, subsOperational: @simulation.subsOperational, subsPlusBombs: @simulation.subsPlusBombs, subsPlusIcbms: @simulation.subsPlusIcbms, subsRoundUp: @simulation.subsRoundUp, subsTubes: @simulation.subsTubes, subsWeaps: @simulation.subsWeaps }
    assert_redirected_to simulation_path(assigns(:simulation))
  end

  test "should destroy simulation" do
    assert_difference('Simulation.count', -1) do
      delete :destroy, id: @simulation
    end

    assert_redirected_to simulations_path
  end
end
