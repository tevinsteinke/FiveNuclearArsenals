class CreateSimulations < ActiveRecord::Migration
  def change
    create_table :simulations do |t|
      t.integer :blueInventory
      t.integer :redInventory
      t.integer :icbmMax
      t.float :icbmMirv
      t.decimal :icbmProb
      t.integer :icbmAvail
      t.boolean :icbmBlueLaunch
      t.decimal :icbmBluePk
      t.integer :subsOperational
      t.decimal :subsAtSea
      t.boolean :subsRoundUp
      t.integer :subsWeaps
      t.integer :subsPlusIcbms
      t.integer :subsPlusBombs
      t.integer :subsTubes
      t.float :subsMirv
      t.integer :subsNavy
      t.integer :bombsNumber
      t.boolean :bombsSurvive
      t.integer :bombsPostStrike
      t.integer :redRatio
      t.boolean :redTarget
      t.decimal :redPk
      t.integer :redBases
      t.integer :redBlueIcbms
      t.integer :redFirstStrike
      t.integer :redSurviving
      t.integer :blueSurviving
      t.integer :deltaSurviving
      t.float :ratioSurviving

      t.timestamps
    end
  end
end
