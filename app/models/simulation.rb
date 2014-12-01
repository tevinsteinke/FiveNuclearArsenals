class Simulation < ActiveRecord::Base
  before_save :calc_icbm_avail
  before_save :calc_subs_at_sea
  before_save :calc_weaps_at_sea 
  before_save :calc_subs_plus_icbms
  before_save :calc_subs_plus_bombs
  before_save :calc_subs_navy
  before_save :calc_subs_mirv
  before_save :calc_red_blue_icbms
  before_save :calc_red_first_strike
  before_save :calc_red_surviving
  before_save :calc_blue_surviving

  def calc_icbm_avail
    unless self.icbmMax.blank? || self.icbmProb.blank? || self.icbmMirv.blank?
      self.icbmAvail = (self.icbmMax * self.icbmProb * self.icbmMirv).ceil
    end
  end

  def calc_subs_at_sea
    unless self.subsOperational.blank? || self.subsSeaRate.blank?
      if self.subsRoundUp
        self.subsAtSea = (subsOperational * self.subsSeaRate).ceil
      else
        self.subsAtSea = (subsOperational * self.subsSeaRate).floor
      end
    end
  end

  def calc_weaps_at_sea
    unless self.subsMirv.blank? || self.subsTubes.blank? || self.subsAtSea.blank?
      self.subsWeaps = self.subsMirv * self.subsTubes * self.subsAtSea
    end
  end

  def calc_subs_plus_icbms
    unless self.subsWeaps.blank? || self.icbmAvail.blank?
      self.subsPlusIcbms = self.subsWeaps * self.icbmAvail
    end
  end

  def calc_subs_plus_bombs
    unless self.subsPlusIcbms.blank?
      if self.bombsPostStrike.blank?
        self.subsPlusBombs = self.subsPlusIcbms + self.bombsNumber
      else
        self.subsPlusBombs = self.subsPlusIcbms + self.bombsPostStrike
      end
    end
  end

  def calc_subs_navy
    unless self.icbmMax.blank? || self.blueInventory.blank?
      self.subsNavy = self.blueInventory - self.icbmMax
    end
  end

  def calc_subs_mirv
    unless self.subsNavy.blank? || self.subsOperational.blank? || self.subsTubes.blank?
      self.subsMirv = self.subsNavy / (self.subsOperational * self.subsTubes)
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
    if self.icbmBlueLaunch
      self.redFirstStrike = self.redInventory - self.redBlueIcbms - self.icbmAvail
    else
      self.redFirstStrike = self.redInventory - self.redBlueIcbms
    end
  end

  def calc_red_surviving
    unless self.redInventory.blank? || self.redFirstStrike.blank?
      self.redSurviving = self.redInventory - self.redFirstStrike
    end
  end

  def calc_blue_surviving
    if self.icbmBlueLaunch
      self.blueSurviving = self.icbmAvail
    else
      if self.redRatio = 0
        self.blueSurviving = self.icbmAvail + self.icbmAvail
      elsif self.redRatio = 1
        self.blueSurviving = self.icbmAvail
      elsif self.redRatio = 2
        self.blueSurviving = self.icbmMax * (1 - (self.redPk^self.redRatio))
      end
    end
    if self.bombsSurvive
      if self.bombsPostStrike
        self.blueSurviving += self.bombsPostStrike
      else
        self.blueSurviving += self.bombsNumber
      end
    end
  end
end
