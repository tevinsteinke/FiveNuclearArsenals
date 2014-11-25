json.array!(@simulations) do |simulation|
  json.extract! simulation, :id, :blueInventory, :redInventory, :icbmMax, :icbmMirv, :icbmProb, :icbmAvail, :icbmBlueLaunch, :icbmBluePk, :subsOperational, :subsAtSea, :subsRoundUp, :subsWeaps, :subsPlusIcbms, :subsPlusBombs, :subsTubes, :subsMirv, :subsNavy, :bombsNumber, :bombsSurvive, :bombsPostStrike, :redRatio, :redTarget, :redPk, :redBases, :redBlueIcbms, :redFirstStrike, :redSurviving, :blueSurviving, :deltaSurviving, :ratioSurviving
  json.url simulation_url(simulation, format: :json)
end
