class Simulation < ActiveRecord::Base
  before_save :calc_icbm_avail
  before_save :calc_subs_at_sea
  before_save :calc_subs_plus_icbms
  before_save :calc_subs_plus_bombs
  before_save :calc_subs_navy
  before_save :calc_subs_mirv
  before_save :calc_weaps_at_sea
  before_save :calc_red_blue_icbms
  before_save :calc_red_first_strike
  before_save :calc_red_surviving
  before_save :calc_blue_surviving
  before_save :calc_delta_surviving
  before_save :calc_ratio_surviving

  MIRVRATIOS = [[1, 1.0], [2, 2.0], [3, 3.0]]
  TARGETINGRATIOS = [["0:1", 0], ["1:1", 1], ["2:1", 2]]

  def self.to_csv(simulations)
    CSV.generate do |csv|
      csv << column_names
      simulations.each do |simulation|
        csv << simulation.attributes.values
      end
    end
  end

  def calc_icbm_avail
    unless self.icbmMax.blank? || self.icbmProb.blank? || self.icbmMirv.blank?
      self.icbmAvail = (self.icbmMax * self.icbmProb * self.icbmMirv).ceil
    end
  end

  def calc_subs_at_sea
    self.subsRoundUp = true
    unless self.subsOperational.blank? || self.subsSeaRate.blank?
      self.subsAtSea = (self.subsOperational * self.subsSeaRate).floor
    end
  end

  def calc_subs_plus_bombs
    unless self.subsPlusIcbms.blank?
      if self.bombsPercentage.blank?
        self.bombsPercentage = 1
      end
      if self.bombsPostStrike.blank? || self.bombsPostStrike == 0
        self.subsPlusBombs = self.subsPlusIcbms + self.bombsNumber
      else
        self.subsPlusBombs = self.subsPlusIcbms + (self.bombsPostStrike * self.bombsPercentage)
      end
    end
  end

  def calc_subs_plus_icbms
    unless self.subsWeaps.blank? || self.icbmAvail.blank?
      self.subsPlusIcbms = self.subsWeaps + self.icbmAvail
    end
  end

  def calc_subs_navy
    unless self.icbmMax.blank? || self.blueInventory.blank? || self.bombsNumber.blank?
      if self.bombsPostStrike.blank? 
        self.bombsPostStrike = 0
      end
      if self.bombsPercentage.blank?
        self.bombsPercentage = 1
      end
      if self.icbmMirv
        self.subsNavy = self.blueInventory - (self.icbmMax * self.icbmMirv) - (self.bombsPostStrike)
      else
        self.subsNavy = self.blueInventory - self.icbmMax - (self.bombsPostStrike)
      end
    end
  end

  def calc_subs_mirv
    unless self.subsNavy.blank? || self.subsOperational.blank? || self.subsTubes.blank?
      if subsOperational == 0 || subsTubes == 0
        self.subsMirv = 0
      else
        self.subsMirv = (self.subsNavy.to_f / (self.subsOperational.to_f * self.subsTubes.to_f)).round(2)
      end
      if self.subsMirv > 8
        self.subsMirv = 8
      end
    end
  end

  def calc_weaps_at_sea
    unless self.subsMirv.blank? || self.subsTubes.blank? || self.subsAtSea.blank?
      self.subsWeaps = self.subsMirv * self.subsTubes * self.subsAtSea
    end
  end

  def calc_red_blue_icbms
    unless self.icbmMax.blank? || self.redRatio.blank?
      if self.redTarget
        self.redBlueIcbms = (self.icbmMax * self.redRatio) + (self.icbmMax / 10)
      else
        self.redBlueIcbms = self.icbmMax * self.redRatio
      end
    end
  end

  def calc_red_first_strike
    unless self.redBlueIcbms.blank? || self.redBases.blank?
      self.redFirstStrike = self.redBlueIcbms + self.redBases
    end
    #if self.icbmBlueLaunch
      #self.redFirstStrike = self.redInventory - self.redBlueIcbms - self.icbmAvail
    #else
      #self.redFirstStrike = self.redInventory - self.redBlueIcbms
    #end
  end

  def calc_red_surviving
    unless self.redInventory.blank? || self.redFirstStrike.blank?
      self.redSurviving = self.redInventory - self.redFirstStrike
    end
  end

  def calc_blue_surviving
    if self.icbmBlueLaunch
      self.blueSurviving = self.subsAtSea * self.subsTubes * self.subsMirv
    else
      if self.redRatio == 0
        if self.icbmMax
          self.blueSurviving = (self.subsAtSea * self.subsTubes * self.subsMirv) + self.icbmMax
        else
          self.blueSurviving = (self.subsAtSea * self.subsTubes * self.subsMirv)
        end
      else
        if self.redPk == 1
          self.blueSurviving = self.subsAtSea * self.subsTubes * self.subsMirv
        else
          if self.icbmProb
            #self.blueSurviving = (self.subsAtSea * self.subsTubes * self.subsMirv) + (self.icbmMax * (1 - (self.redPk*self.redRatio))) * self.icbmProb
            self.blueSurviving = (self.subsAtSea * self.subsTubes * self.subsMirv) + ((self.icbmMax * self.icbmMirv) * (1 - self.redPk))
          else
            self.blueSurviving = (self.subsAtSea * self.subsTubes * self.subsMirv) + ((self.icbmMax * self.icbmMirv) * (1 - self.redPk))
          end
        end
      end
    end
    if self.bombsSurvive
      if self.bombsPercentage.blank?
        self.bombsPercentage = 1
      end
      if self.bombsPostStrike
        self.blueSurviving += (self.bombsPostStrike * self.bombsPercentage)
      else
        self.blueSurviving += self.bombsNumber
      end
    end
  end

  def calc_delta_surviving
    unless self.redSurviving.blank? || self.blueSurviving.blank?
      self.deltaSurviving = self.blueSurviving - self.redSurviving
    end
  end

  def calc_ratio_surviving
    unless self.redSurviving.blank? || self.blueSurviving.blank?
      self.ratioSurviving = (self.redSurviving.to_f / self.blueSurviving.to_f).round(1)
    end
  end
end
